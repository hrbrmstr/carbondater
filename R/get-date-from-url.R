#' Locate and retrieve publication date from a URL
#'
#' Many modern URLs have publication dates in the URL. This function
#' searches for common ones and returns it if found.
#'
#' @md
#' @param uri URL/URI to examine
#' @export
#' @examples
#' get_date_from_url(
#'   "https://rud.is/b/2018/05/03/seventeen-minutes-from-tweet-to-package/"
#' )
get_date_from_url <- function(uri) {

  x <- stri_extract_first_regex(uri, .date_regex)

  if (!is.na(x)) {

    x <- stri_replace_first_regex(x, "^[^[:digit:]]+", "")
    x <- stri_replace_last_regex(x, "[^[:digit:]]+$", "")
    x <- anytime::anytime(x)

  } else {
    x <- x <- anytime::anytime("")
  }

  data.frame(
    method = "url",
    date = x,
    uri = uri,
    stringsAsFactors = FALSE
  ) -> x

  class(x) <- c("tbl_df", "tbl", "data.frame")

  x

}

