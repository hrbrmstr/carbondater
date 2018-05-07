#' Locate and retrieve publication date from a URL
#'
#' Many modern URLs have publication dates in the URL. This function
#' searches for common ones and returns it if found.
#'
#' @md
#' @param x URL
#' @export
#' @examples
#' get_date_from_url(
#'   "https://rud.is/b/2018/05/03/seventeen-minutes-from-tweet-to-package/"
#' )
get_date_from_url <- function(x) {

  x <- stri_extract_first_regex(x, .date_regex)

  if (!is.na(x)) {

    x <- stri_replace_first_regex(x, "^[^[:digit:]]+", "")
    x <- stri_replace_last_regex(x, "[^[:digit:]]+$", "")
    x <- anytime::anytime(x)

    data.frame(
      last_modified = x,
      stringsAsFactors = FALSE
    ) -> x

    class(x) <- c("tbl_df", "tbl", "data.frame")

    x

  } else {
    NULL
  }

}

