#' Retrieve the last-modified header
#'
#' @md
#' @param uri URL/URI to read
#' @return data frame (tibble)
#' @export
#' @examples
#' get_last_modified("http://www.example.org/")
get_last_modified <- function(uri) {

  x <- safe_GET(uri, httr::user_agent(.ua))

  if (!is.null(x)) {

    x <- httr::headers(x)
    x <- unname(x[['last-modified']])

  }

  data.frame(
    method = "last_modified",
    date = if (is.null(x)) anytime::anytime("") else anytime::anytime(x),
    uri = uri,
    stringsAsFactors = FALSE
  ) -> x

  class(x) <- c("tbl_df", "tbl", "data.frame")

  x

}
