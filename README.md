
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

## TODO

  - \[ \] A `carbondate()` function to wrap up everything
  - \[ \] More error checking
  - \[ \] More resources to check
  - \[ \] More documentation
  - \[ \] Tests

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

    ## NULL

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
    ##   url_date           
    ##   <dttm>             
    ## 1 2018-05-03 00:00:00
