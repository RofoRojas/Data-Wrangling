TwConection
================
Rodolfo
10/28/2019

``` r
library(twitteR)
library(dplyr)
```

    ## Warning: package 'dplyr' was built under R version 3.5.2

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:twitteR':
    ## 
    ##     id, location

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(readr)
```

``` r
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
```

    ## [1] "Using direct authentication"

``` r
tw <- twitteR::searchTwitter('Joker', n = 1e4, since = '2019-10-22', retryOnRateLimit = 1e3)

df <- twitteR::twListToDF(tw)


write_csv(df,"Joker_tweets.csv")
```
