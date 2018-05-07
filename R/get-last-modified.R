#' Retrieve the last-modified header
#'
#' @md
#' @param uri URL/URI to read
#' @return data frame (tibble) or `NULL` if no haeder
#' @export
#' @examples
#' get_last_modified("http://www.example.org/")
get_last_modified <- function(url) {

  x <- safe_GET(url, httr::user_agent(.ua))

  if (!is.null(x)) {

    x <- httr::headers(x)
    x <- unname(x[['last-modified']])

  }

  # if we got nada
  if (is.null(x)) return(NULL)

  data.frame(
    last_modified = anytime::anytime(x),
    stringsAsFactors = FALSE
  ) -> x

  class(x) <- c("tbl_df", "tbl", "data.frame")

  x

}
