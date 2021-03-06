% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/use_start_time.R
\name{use_start_time}
\alias{use_start_time}
\alias{use_start_time.default}
\alias{use_start_time.embed_youtube}
\alias{use_start_time.embed_vimeo}
\alias{use_start_time.embed_channel9}
\title{Specify a start time for an embedded video}
\usage{
use_start_time(...)

\method{use_start_time}{default}(...)

\method{use_start_time}{embed_youtube}(embed, start_time, ...)

\method{use_start_time}{embed_vimeo}(embed, start_time, ...)

\method{use_start_time}{embed_channel9}(embed, start_time, is_paused = TRUE,
  ...)
}
\arguments{
\item{...}{generic arguments to pass through}

\item{embed}{embed object made using an \code{\link{embed}} function}

\item{start_time}{numeric (seconds), or character ("3m15s")}

\item{is_paused}{logical, for "Channel 9" specifies if the video
should be paused at this time}
}
\description{
This function provides you a consistent way to specify the start time,
regardless of the service.
}
\details{
The \code{start_time} argument can take a variety of formats; these inputs
all evaluate to the same value:

\itemize{
  \item{\code{"0h1m0s"}, \code{"0h01m00s"}, \code{"0h1m"}}
  \item{\code{"1m0s"}, \code{"1m"}}
  \item{\code{"60s"}, \code{60}}
}

Please note that for Vimeo, you can specify a start time, but you can not
specify that the video be paused at this time. In other words, it is like
"autoplay" is set to TRUE, and you cannot unset it.
}
\examples{
  rickroll_youtube() \%>\%
    use_start_time("3m32s")

}
