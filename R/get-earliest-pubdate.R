# x <- httr::GET("http://www.cnn.com/2011/10/28/living/ways-to-look-better-is/index.html")
# x <- httr::GET("https://rud.is/b/2018/05/03/seventeen-minutes-from-tweet-to-package/")

#' Retrieve the earliest "pubdate" for a URL
#'
#' Scan URL content for metatdata indicating publication date. Failing that,
#' try to extract it from the URL itself.
#'
#' @md
#' @param uri URL/URI to read
#' @return data frame (tibble)
#' @export
#' @examples
#' get_earliest_pubdate(
#'  "https://rud.is/b/2018/05/03/seventeen-minutes-from-tweet-to-package/"
#' )
get_earliest_pubdate <- function(uri) {

  x <- safe_GET(uri, httr::user_agent(.ua))

  if (!is.null(x)) {

    x <- suppressMessages(httr::content(x))

    data.frame(
      mtag = rvest::html_nodes(
        x,
        xpath=".//meta[@http-equiv or @itemprop or @name or @property]/
             @*[name()='http-equiv' or name()='itemprop' or name()='name' or name()='property']"
      ) %>% rvest::html_text() %>% tolower()
      ,
      mval = rvest::html_nodes(
        x,
        xpath=".//meta[@http-equiv or @itemprop or @name or @property]/@content"
      ) %>% rvest::html_text() %>% tolower()
    ) -> x

    c('pubdate', 'publishdate', 'timestamp','dc.date.issued',
      'article:published_time', 'bt:pubdate', 'og:pubdate',
      'sailthru.date', 'article.published', 'published-date',
      'article.created', 'article_date_original',
      'cxenseparse:recs:publishtime', 'date_published',
      'datepublished', 'datecreated', 'date') -> date_fields

    x <- x[x$mtag %in% date_fields,]

    if (nrow(x) > 0) {
      x$mval <- anytime::anytime(x$mval)
      x <- min(x$mval)
    } else {
      x <- anytime::anytime("")
    }

  } else {
    x <- anytime::anytime("")
  }

  data.frame(
    method = "pubdate",
    date = x,
    uri = uri,
    stringsAsFactors = FALSE
  ) -> x

  class(x) <- c("tbl_df", "tbl", "data.frame")

  x

}

