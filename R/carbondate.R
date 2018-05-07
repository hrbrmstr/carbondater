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

  res <- do.call(rbind.data.frame, list(url_date, memento_dates, pub_date, last_mod_date))

  class(res) <- c("carbondate_record", "tbl_df", "tbl", "data.frame")

  res

}

#' @md
#' @noRd
#' @param x obj
#' @param ... unused
#' @export
print.carbondate_record <- function(x, ...) {

  if (all(is.na(x$date))) {
    message("No publication history was discovered.")
  } else {

    x <- x[!is.na(x$date),]
    x <- x[order(x$date),]
    x <- x[1,]

    cat(
      sprintf(
        "Oldest publication record found: %s in %s (%s ago)\n",
        as.character(x$date),
        x$method,
        prettyunits::pretty_dt(Sys.time() - x$date)
      ),
      sep=""
    )

  }

}