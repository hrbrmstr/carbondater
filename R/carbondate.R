#' Carbon date a URL/URI
#'
#' Given a URL/URI, use all available methods to gather date info and present
#' results in a data frame
#'
#' @md
#' @param uri URL/URI to carbon date
#' @return data frame (tibble)
#' @export
#' @examples
#' carbondate(
#'   "http://www.cnn.com/2011/10/28/living/ways-to-look-better-is/index.html"
#' )
carbondate <- function(uri) {

  url_date <-  get_date_from_url(uri)
  memento_dates <- get_earliest_mementos(uri)
  pub_date <- get_earliest_pubdate(uri)
  last_mod_date <- get_last_modified(uri)

  do.call(rbind.data.frame, list(url_date, memento_dates, pub_date, last_mod_date))

}