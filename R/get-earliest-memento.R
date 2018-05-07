#' Retrieve the earliest mementos for a URL/URI
#'
#' @md
#' @param uri URL/URI to search for
#' @return data frame (tibble)
#' @export
#' @examples
#' get_earliest_mementos("http://rapid7.com/")
get_earliest_mementos <- function(uri) {

  # clean up the URI
  uri <- stri_replace_all_fixed(uri, " ", "")

  # query the memento server
  safe_GET(
    url = sprintf("http://memgator.cs.odu.edu/timemap/json/%s", uri),
    httr::user_agent(.ua)
  ) -> res

  if (is.null(res)) {
    data.frame(
      date = anytime::anytime(""),
      uri = uri,
      method = "memento",
      stringsAsFactors = FALSE
    ) -> res
    class(res) <- c("tbl_df", "tbl", "data.frame")
    return(res)
  }

  res <- httr::content(res)

  # if we have some
  if (length(res$mementos) > 0) {

    # all this for sane data frames
    saf <- default.stringsAsFactors()
    on.exit(options(stringsAsFactors = saf))
    options(stringsAsFactors = FALSE)

    # turn it into a data frame
    res <- do.call(rbind.data.frame, res$mementos$list)

    # clean up timestamp and extract memento host
    res$datetime <- anytime::anytime(res$datetime)
    res$domain <- urltools::domain(res$uri)

    # for each memento host, find earliest record
    res <- split(res, res$domain)
    lapply(res, function(.x) {
      .x[.x$datetime == min(.x$datetime),]
    }) -> res
    res <- do.call(rbind.data.frame, res)

    # no longer need the domain
    res$domain <- NULL

    colnames(res) <- c("date", "uri")

    res

  } else {
    data.frame(
      date = anytime::anytime(""),
      uri = uri,
      stringsAsFactors = FALSE
    ) -> res
  }

  res$method <- "memento"

  class(res) <- c("tbl_df", "tbl", "data.frame")

  res

}
