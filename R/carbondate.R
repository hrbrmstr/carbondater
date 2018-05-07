#' @export
carbondate <- function(uri) {

  url_date <-  get_date_from_url(uri)
  memento_dates <- get_earliest_mementos(uri)
  pub_date <- get_earliest_pubdate(uri)
  last_mod_date <- get_last_modified(uri)

  do.call(rbind.data.frame, list(url_date, memento_dates, pub_date, last_mod_date))

}