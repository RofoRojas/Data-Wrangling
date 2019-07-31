EjercicioBeatles
================
Rodolfo
29/7/2019

    ## -- Attaching packages ----------------------------------------------------- tidyverse 1.2.1 --

    ## <U+221A> ggplot2 3.0.0     <U+221A> purrr   0.2.5
    ## <U+221A> tibble  2.1.3     <U+221A> dplyr   0.8.3
    ## <U+221A> tidyr   0.8.1     <U+221A> stringr 1.3.1
    ## <U+221A> ggplot2 3.0.0     <U+221A> forcats 0.3.0

    ## Warning: package 'tibble' was built under R version 3.5.2

    ## Warning: package 'dplyr' was built under R version 3.5.2

    ## -- Conflicts -------------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

Read Letras
-----------

``` r
beatles_df <- data_frame(txt = read_lines('data/beatles.txt'))
```

    ## Warning: `data_frame()` is deprecated, use `tibble()`.
    ## This warning is displayed once per session.

``` r
beatles_words <- unnest_tokens(beatles_df, input = txt, output = words, token = "words")
```

Tokens Stopwords
----------------

``` r
en_stopwords <- data_frame(words= quanteda::stopwords(language = 'en'))
```

Delete stopwords
----------------

``` r
beatles_clean <- anti_join(beatles_words, en_stopwords)
```

    ## Joining, by = "words"

Count words
-----------

``` r
beatles_clean_count <-  count(beatles_clean, words, sort = TRUE)
beatles_clean_count
```

    ## # A tibble: 2,795 x 2
    ##    words     n
    ##    <chr> <int>
    ##  1 love    613
    ##  2 know    436
    ##  3 oh      347
    ##  4 baby    300
    ##  5 well    265
    ##  6 can     232
    ##  7 now     225
    ##  8 got     220
    ##  9 say     218
    ## 10 go      211
    ## # ... with 2,785 more rows
