safe_GET <- function(url = NULL, config = list(),
                     timeout = httr::timeout(5), ..., handle = NULL) {

  options(show.error.messages = FALSE)

  suppressWarnings(
    suppressMessages(
      tryCatch(
        httr::GET(url = url, config = config, timeout, ..., handle = handle),
        error = function(e) {
          NULL
        }
      )
    )
  ) -> res

  options(show.error.messages = TRUE)

  return(res)

}
