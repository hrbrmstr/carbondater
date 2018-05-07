
# carbondater

Estimate the Age of Web Resources

## Description

Methods are provided to read ‘URL’ metadata and scan web archives/use
web archive ‘APIs’ to determine the approxate age of the resource.

## What’s Inside The Tin

The following functions are implemented:

  - `get_date_from_url`: Locate and retrieve publication date from a URL
  - `get_earliest_mementos`: Retrieve the earliest mementos for a
    URL/URI
  - `get_earliest_pubdate`: Retrieve the earliest “pubdate” for a URL
  - `get_last_modified`: Retrieve the last-modified header

## Installation

``` r
devtools::install_github("hrbrmstr/carbondater")
```

## Usage

``` r
library(carbondater)
library(tidyverse)

# current verison
packageVersion("carbondater")
```

    ## [1] '0.1.0'

### Mementos

``` r
get_earliest_mementos("http://www.cs.odu.edu")
```

    ## # A tibble: 5 x 2
    ##   memento_datetime    uri_m                                                                  
    ## * <dttm>              <chr>                                                                  
    ## 1 1997-06-06 10:50:39 http://archive.is/19970606105039/http://www.cs.odu.edu/                
    ## 2 2009-12-23 04:30:49 http://arquivo.pt/wayback/20091223043049/http://www.cs.odu.edu/        
    ## 3 2012-02-08 03:54:08 http://web.archive.org/web/20120208035408/http://@cs.odu.edu/          
    ## 4 2017-03-04 16:34:53 http://wayback.archive-it.org/all/20170304163453/http://www.cs.odu.edu/
    ## 5 1997-01-02 13:01:37 http://web.archive.org/web/19970102130137/http://cs.odu.edu:80/

### Last Modified

``` r
get_last_modified("http://example.org/")
```

    ## # A tibble: 1 x 1
    ##   last_modified      
    ##   <dttm>             
    ## 1 2013-08-09 23:54:35

``` r
get_earliest_pubdate("http://www.cnn.com/2011/10/28/living/ways-to-look-better-is/index.html")
```

    ## # A tibble: 1 x 1
    ##   pubdate            
    ##   <dttm>             
    ## 1 2011-10-28 11:57:43

``` r
get_date_from_url(
  "https://rud.is/b/2018/05/03/seventeen-minutes-from-tweet-to-package/"
)
```

    ## # A tibble: 1 x 1
    ##   last_modified      
    ##   <dttm>             
    ## 1 2018-05-03 00:00:00
