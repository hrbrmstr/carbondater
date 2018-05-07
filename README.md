
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
carbondate("https://rud.is/b/2013/12/27/points-polygons-and-power-outages/")
```

    ## # A tibble: 5 x 3
    ##   method        date                uri                                                                                
    ## * <chr>         <dttm>              <chr>                                                                              
    ## 1 url           2013-12-27 00:00:00 https://rud.is/b/2013/12/27/points-polygons-and-power-outages/                     
    ## 2 memento       2014-03-30 14:18:34 http://wayback.vefsafn.is/wayback/20140330141834/http://rud.is/b/2013/12/27/points…
    ## 3 memento       2014-01-10 02:26:45 http://web.archive.org/web/20140110022645/http://rud.is:80/b/2013/12/27/points-pol…
    ## 4 pubdate       2013-12-27 15:30:09 https://rud.is/b/2013/12/27/points-polygons-and-power-outages/                     
    ## 5 last_modified NA                  https://rud.is/b/2013/12/27/points-polygons-and-power-outages/

``` r
carbondate("http://www.cs.odu.edu")
```

    ## # A tibble: 8 x 3
    ##   method        date                uri                                                                    
    ## * <chr>         <dttm>              <chr>                                                                  
    ## 1 url           NA                  http://www.cs.odu.edu                                                  
    ## 2 memento       1997-06-06 10:50:39 http://archive.is/19970606105039/http://www.cs.odu.edu/                
    ## 3 memento       2009-12-23 04:30:49 http://arquivo.pt/wayback/20091223043049/http://www.cs.odu.edu/        
    ## 4 memento       2012-02-08 03:54:08 http://web.archive.org/web/20120208035408/http://@cs.odu.edu/          
    ## 5 memento       2017-03-04 16:34:53 http://wayback.archive-it.org/all/20170304163453/http://www.cs.odu.edu/
    ## 6 memento       1997-01-02 13:01:37 http://web.archive.org/web/19970102130137/http://cs.odu.edu:80/        
    ## 7 pubdate       NA                  http://www.cs.odu.edu                                                  
    ## 8 last_modified NA                  http://www.cs.odu.edu

``` r
carbondate("http://example.org/")
```

    ## # A tibble: 4 x 3
    ##   method        date                uri                
    ##   <chr>         <dttm>              <chr>              
    ## 1 url           NA                  http://example.org/
    ## 2 memento       NA                  http://example.org/
    ## 3 pubdate       NA                  http://example.org/
    ## 4 last_modified 2013-08-09 23:54:35 http://example.org/

``` r
carbondate("http://www.cnn.com/2011/10/28/living/ways-to-look-better-is/index.html")
```

    ## # A tibble: 5 x 3
    ##   method        date                uri                                                                                
    ## * <chr>         <dttm>              <chr>                                                                              
    ## 1 url           2011-10-28 00:00:00 http://www.cnn.com/2011/10/28/living/ways-to-look-better-is/index.html             
    ## 2 memento       2011-10-28 22:09:26 http://wayback.archive-it.org/all/20111028220926/http://www.cnn.com/2011/10/28/liv…
    ## 3 memento       2011-10-28 22:09:26 http://web.archive.org/web/20111028220926/http://www.cnn.com/2011/10/28/living/way…
    ## 4 pubdate       2011-10-28 11:57:43 http://www.cnn.com/2011/10/28/living/ways-to-look-better-is/index.html             
    ## 5 last_modified NA                  http://www.cnn.com/2011/10/28/living/ways-to-look-better-is/index.html
