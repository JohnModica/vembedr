% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parse.R
\name{build_suggestion}
\alias{build_suggestion}
\title{Given a parse-list, generate an embed-list}
\usage{
build_suggestion(parse_list)
}
\arguments{
\item{parse_list, }{list generated using \code{\link{parse_video_url}}
with members:
\describe{
  \item{service}{character, describes which service is used}
  \item{id}{character, identifier for the video at the service}
  \item{start_time}{character, indicates start time}
}}
}
\value{
list with members:
\describe{
  \item{embed}{character, code for \code{\link{embed}} call}
  \item{start_time}{character, (optional) code for \code{\link{use_start_time}} call}
}
}
\description{
This is an internal function, supporting \code{\link{suggest_embed}}
}
\examples{
parse_video_url("https://youtu.be/1-vcErOPofQ?t=28s") \%>\%
build_suggestion()
}
\seealso{
\code{\link{suggest_embed}} \code{\link{parse_video_url}}
}
