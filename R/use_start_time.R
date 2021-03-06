#' Specify a start time for an embedded video
#'
#' This function provides you a consistent way to specify the start time,
#' regardless of the service.
#'
#' The \code{start_time} argument can take a variety of formats; these inputs
#' all evaluate to the same value:
#'
#' \itemize{
#'   \item{\code{"0h1m0s"}, \code{"0h01m00s"}, \code{"0h1m"}}
#'   \item{\code{"1m0s"}, \code{"1m"}}
#'   \item{\code{"60s"}, \code{60}}
#' }
#'
#' Please note that for Vimeo, you can specify a start time, but you can not
#' specify that the video be paused at this time. In other words, it is like
#' "autoplay" is set to TRUE, and you cannot unset it.
#'
#' @rdname use_start_time
#' @param ...         generic arguments to pass through
#' @param embed       embed object made using an \code{\link{embed}} function
#' @param start_time  numeric (seconds), or character ("3m15s")
#' @param is_paused   logical, for "Channel 9" specifies if the video
#'   should be paused at this time
#'
#' @export
#' @examples
#'   rickroll_youtube() %>%
#'     use_start_time("3m32s")
#'
use_start_time <- function(...) UseMethod("use_start_time")


#' @rdname use_start_time
#' @export
#'
use_start_time.default <- function(...) "Unknown class"

#' @rdname use_start_time
#' @export
#'
use_start_time.embed_youtube <- function(embed, start_time, ...){

  # get the src from the embed
  src <- htmltools::tagGetAttribute(embed, "src")

  # parse the url
  url <- httr::parse_url(src)

  # set the time in url$query
  url$query$start <- .secs(start_time)

  # set the url in the embed
  # == need to ask about a public API for this in htmltools ==
  embed$attribs$src <- httr::build_url(url)

  embed
}

#' @rdname use_start_time
#' @export
#'
use_start_time.embed_vimeo <- function(embed, start_time, ...){

  # get the src from the embed
  src <- htmltools::tagGetAttribute(embed, "src")

  # parse the url
  url <- httr::parse_url(src)

  # set the time in url$fragment
  url$fragment <- paste0("t=", .secs(start_time))

  # set the url in the embed
  # == need to ask about a public API for this in htmltools ==
  embed$attribs$src <- httr::build_url(url)

  embed
}

#' @rdname use_start_time
#' @export
#'
use_start_time.embed_channel9 <- function(embed, start_time, is_paused = TRUE, ...){

  # get the src from the embed
  src <- htmltools::tagGetAttribute(embed, "src")

  # parse the url
  url <- httr::parse_url(src)

  # set the time in url$fragment
  frag <- paste("time", .hms(start_time), sep = "=")

  if (is_paused){
    frag <- paste(frag, "paused", sep = ":")
  }

  url$fragment <- frag

  # set the url in the embed
  # == need to ask about a public API for this in htmltools ==
  embed$attribs$src <- httr::build_url(url)

  embed
}
