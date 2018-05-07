
# carbondater

Estimate the Age of Web Resources

## Description

Methods are provided to read ‘URL’ metadata and scan web archives/use
web archive ‘APIs’ to determine the approxate age of the resource.

## What’s Inside The Tin

The following functions are implemented:

  - `carbondate`: Carbon date a URL/URI
  - `get_date_from_url`: Locate and retrieve publication date from a URL
  - `get_earliest_mementos`: Retrieve the earliest mementos for a
    URL/URI
  - `get_earliest_pubdate`: Retrieve the earliest “pubdate” for a URL
  - `get_last_modified`: Retrieve the last-modified header

## TODO

  - \[X\] A `carbondate()` function to wrap up everything
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

### Carbon data a few URIs

``` r
(x <- carbondate("https://rud.is/b/2013/12/27/points-polygons-and-power-outages/"))
```

    ## Oldest publication record found: 2013-12-27 in url (1592.356 days ago)

``` r
glimpse(x)
```

    ## Observations: 4
    ## Variables: 3
    ## $ method <chr> "url", "memento", "pubdate", "last_modified"
    ## $ date   <dttm> 2013-12-27 00:00:00, NA, 2013-12-27 15:30:09, NA
    ## $ uri    <chr> "https://rud.is/b/2013/12/27/points-polygons-and-power-outages/", "https://rud.is/b/2013/12/27/point...

``` r
(x <- carbondate("http://www.cs.odu.edu"))
```

    ## No publication history was discovered.

``` r
glimpse(x)
```

    ## Observations: 4
    ## Variables: 3
    ## $ method <chr> "url", "memento", "pubdate", "last_modified"
    ## $ date   <dttm> NA, NA, NA, NA
    ## $ uri    <chr> "http://www.cs.odu.edu", "http://www.cs.odu.edu", "http://www.cs.odu.edu", "http://www.cs.odu.edu"

``` r
(x <- carbondate("http://example.org/"))
```

    ## Oldest publication record found: 2013-08-09 23:54:35 in last_modified (1731.401 days ago)

``` r
glimpse(x)
```

    ## Observations: 4
    ## Variables: 3
    ## $ method <chr> "url", "memento", "pubdate", "last_modified"
    ## $ date   <dttm> NA, NA, NA, 2013-08-09 23:54:35
    ## $ uri    <chr> "http://example.org/", "http://example.org/", "http://example.org/", "http://example.org/"

``` r
(x <- carbondate("http://www.cnn.com/2011/10/28/living/ways-to-look-better-is/index.html"))
```

    ## Oldest publication record found: 2011-10-28 in url (2383.398 days ago)

``` r
glimpse(x)
```

    ## Observations: 4
    ## Variables: 3
    ## $ method <chr> "url", "memento", "pubdate", "last_modified"
    ## $ date   <dttm> 2011-10-28 00:00:00, NA, 2011-10-28 11:57:43, NA
    ## $ uri    <chr> "http://www.cnn.com/2011/10/28/living/ways-to-look-better-is/index.html", "http://www.cnn.com/2011/1...
