Lab04
================
Rodolfo
28/8/2019

Laboratorio 4
=============

``` r
library(tidyr)
library(reshape2)
```

    ## 
    ## Attaching package: 'reshape2'

    ## The following object is masked from 'package:tidyr':
    ## 
    ##     smiths

``` r
library(readr)
library(dplyr)
```

    ## Warning: package 'dplyr' was built under R version 3.5.2

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(stringr)
```

Intro
-----

``` r
df<- data.frame(row= LETTERS[1:3], a= 1:3, b = 4:6, c = 7:9)
df
```

    ##   row a b c
    ## 1   A 1 4 7
    ## 2   B 2 5 8
    ## 3   C 3 6 9

Melt es de Reshape2

``` r
dfm<- reshape2::melt(df, id="row")
dfm
```

    ##   row variable value
    ## 1   A        a     1
    ## 2   B        a     2
    ## 3   C        a     3
    ## 4   A        b     4
    ## 5   B        b     5
    ## 6   C        b     6
    ## 7   A        c     7
    ## 8   B        c     8
    ## 9   C        c     9

Gather es de Tidyr

``` r
dfg <- gather(df, key="variable", value ="value", a:c)
dfg
```

    ##   row variable value
    ## 1   A        a     1
    ## 2   B        a     2
    ## 3   C        a     3
    ## 4   A        b     4
    ## 5   B        b     5
    ## 6   C        b     6
    ## 7   A        c     7
    ## 8   B        c     8
    ## 9   C        c     9

Messy Data de Casos
-------------------

``` r
my_data <- read_csv("Archive/raw.csv") %>% select(-X1)
```

    ## Warning: Missing column names filled in: 'X1' [1]

    ## Parsed with column specification:
    ## cols(
    ##   X1 = col_double(),
    ##   country = col_character(),
    ##   year = col_double(),
    ##   m014 = col_double(),
    ##   m1524 = col_double(),
    ##   m2534 = col_double(),
    ##   m3544 = col_double(),
    ##   m4554 = col_double(),
    ##   m5564 = col_double(),
    ##   m65 = col_double(),
    ##   mu = col_logical(),
    ##   f014 = col_double(),
    ##   f1524 = col_double(),
    ##   f2534 = col_double(),
    ##   f3544 = col_double(),
    ##   f4554 = col_double(),
    ##   f5564 = col_double(),
    ##   f65 = col_double(),
    ##   fu = col_logical()
    ## )

``` r
head(my_data)
```

    ## # A tibble: 6 x 18
    ##   country  year  m014 m1524 m2534 m3544 m4554 m5564   m65 mu     f014 f1524
    ##   <chr>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <lgl> <dbl> <dbl>
    ## 1 AD       2000     0     0     1     0     0     0     0 NA       NA    NA
    ## 2 AE       2000     2     4     4     6     5    12    10 NA        3    16
    ## 3 AF       2000    52   228   183   149   129    94    80 NA       93   414
    ## 4 AG       2000     0     0     0     0     0     0     1 NA        1     1
    ## 5 AL       2000     2    19    21    14    24    19    16 NA        3    11
    ## 6 AM       2000     2   152   130   131    63    26    21 NA        1    24
    ## # ... with 6 more variables: f2534 <dbl>, f3544 <dbl>, f4554 <dbl>,
    ## #   f5564 <dbl>, f65 <dbl>, fu <lgl>

``` r
melted_data <- gather(my_data, key = "Rango", value = "cases", 3:18)
melted_data %>% head()
```

    ## # A tibble: 6 x 4
    ##   country  year Rango cases
    ##   <chr>   <dbl> <chr> <dbl>
    ## 1 AD       2000 m014      0
    ## 2 AE       2000 m014      2
    ## 3 AF       2000 m014     52
    ## 4 AG       2000 m014      0
    ## 5 AL       2000 m014      2
    ## 6 AM       2000 m014      2

``` r
tidy_data1 <- melted_data %>% 
  mutate(sex = substr(Rango, 1,1), age= as.factor(substr(Rango,2,5))) %>% 
  select(country, year,sex, age, cases) 
tidy_data1 %>% head()
```

    ## # A tibble: 6 x 5
    ##   country  year sex   age   cases
    ##   <chr>   <dbl> <chr> <fct> <dbl>
    ## 1 AD       2000 m     014       0
    ## 2 AE       2000 m     014       2
    ## 3 AF       2000 m     014      52
    ## 4 AG       2000 m     014       0
    ## 5 AL       2000 m     014       2
    ## 6 AM       2000 m     014       2

``` r
levels(tidy_data1$age) <- c("0-14", "15-24", "25-34", "35-44", "45-54", "55-64", "65", "u")
tidy_data1 %>% head()
```

    ## # A tibble: 6 x 5
    ##   country  year sex   age   cases
    ##   <chr>   <dbl> <chr> <fct> <dbl>
    ## 1 AD       2000 m     0-14      0
    ## 2 AE       2000 m     0-14      2
    ## 3 AF       2000 m     0-14     52
    ## 4 AG       2000 m     0-14      0
    ## 5 AL       2000 m     0-14      2
    ## 6 AM       2000 m     0-14      2

Wide Religion
-------------

``` r
load("Archive/wide_religion.Rda")
head(wide_religion)
```

    ##                    religion <$10k $10-20k $20-30k $30-40k $40-50k $50-75k
    ## 1                  Agnostic    27      34      60      81      76     137
    ## 2                   Atheist    12      27      37      52      35      70
    ## 3                  Buddhist    27      21      30      34      33      58
    ## 4                  Catholic   418     617     732     670     638    1116
    ## 5 Don<U+2019>t know/refused    15      14      15      11      10      35
    ## 6          Evangelical Prot   575     869    1064     982     881    1486
    ##   $75-100k $100-150k >150k Don't know/refused
    ## 1      122       109    84                 96
    ## 2       73        59    74                 76
    ## 3       62        39    53                 54
    ## 4      949       792   633               1489
    ## 5       21        17    18                116
    ## 6      949       723   414               1529

``` r
wide_religion_tidy <- gather(wide_religion, key = "income", value = "freq", 2:11) %>%
  arrange(religion)
head(wide_religion_tidy,10)
```

    ##    religion             income freq
    ## 1  Agnostic              <$10k   27
    ## 2  Agnostic            $10-20k   34
    ## 3  Agnostic            $20-30k   60
    ## 4  Agnostic            $30-40k   81
    ## 5  Agnostic            $40-50k   76
    ## 6  Agnostic            $50-75k  137
    ## 7  Agnostic           $75-100k  122
    ## 8  Agnostic          $100-150k  109
    ## 9  Agnostic              >150k   84
    ## 10 Agnostic Don't know/refused   96
