Repaso
================
Rodolfo
24/7/2019

Instalar librerias
------------------

\#\# Cargando Librerias

``` r
require(dplyr)
```

    ## Loading required package: dplyr

    ## Warning: package 'dplyr' was built under R version 3.5.2

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

Tipos de Datos
--------------

``` r
string <- "This is a string"
class(string)
```

    ## [1] "character"

``` r
nchar(string)
```

    ## [1] 16

``` r
length(string)
```

    ## [1] 1

``` r
number <- 234L
class(number)
```

    ## [1] "integer"

``` r
typeof(number)
```

    ## [1] "integer"

``` r
logical<- FALSE
logical
```

    ## [1] FALSE

``` r
logical*1
```

    ## [1] 0

``` r
factor_1 <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Wed", "Thu", "Wed", "Thu")
factor_1 <- factor(factor_1)
factor_1
```

    ##  [1] Mon Tue Wed Thu Fri Sat Sun Mon Tue Wed Thu Fri Sat Sun Wed Thu Wed
    ## [18] Thu
    ## Levels: Fri Mon Sat Sun Thu Tue Wed

``` r
as.numeric(factor_1)
```

    ##  [1] 2 6 7 5 1 3 4 2 6 7 5 1 3 4 7 5 7 5

``` r
factor_2 <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Wed", "Thu", "Wed", "Thu")
factor_2 <- ordered(factor_2, levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"))
factor_2
```

    ##  [1] Mon Tue Wed Thu Fri Sat Sun Mon Tue Wed Thu Fri Sat Sun Wed Thu Wed
    ## [18] Thu
    ## Levels: Mon < Tue < Wed < Thu < Fri < Sat < Sun

Vectors
=======

``` r
sample(x= 1:100, size=8, replace= FALSE)
```

    ## [1] 82 71 77 76 56 18 87 32

``` r
sample(x = 1:100, size = 8, replace = TRUE)
```

    ## [1]  40  90  83  60  13  47 100  29

``` r
class(sample(x = 1:100, size = 8, replace = TRUE))
```

    ## [1] "integer"

``` r
vector_1 <- c(1:5, "A")
```

List
----

``` r
list_1 <- list(c(1:5),as.logical(c(1,0,1)),c("a", "b", "c"))
names(list_1) <- c("first", "second","third")
list_1
```

    ## $first
    ## [1] 1 2 3 4 5
    ## 
    ## $second
    ## [1]  TRUE FALSE  TRUE
    ## 
    ## $third
    ## [1] "a" "b" "c"

``` r
list_1$second[2]
```

    ## [1] FALSE

``` r
list_1[[2]][2]
```

    ## [1] FALSE

Matrices
--------

``` r
matrix(data = 1, nrow = 4, ncol = 5)
```

    ##      [,1] [,2] [,3] [,4] [,5]
    ## [1,]    1    1    1    1    1
    ## [2,]    1    1    1    1    1
    ## [3,]    1    1    1    1    1
    ## [4,]    1    1    1    1    1

Data Frames
-----------

``` r
df <- data.frame(col1 = c("This","is","a","vector","of","strings"), col2 = 1:6, col3 = letters[1:6], stringsAsFactors = FALSE)
df2 <- data.frame(col1 = c("This","is","a","vector","of","strings"), col2 = 1:6, col3 = letters[1:6], stringsAsFactors = TRUE)
nrow(df)
```

    ## [1] 6

``` r
ncol(df)
```

    ## [1] 3

``` r
str(df)
```

    ## 'data.frame':    6 obs. of  3 variables:
    ##  $ col1: chr  "This" "is" "a" "vector" ...
    ##  $ col2: int  1 2 3 4 5 6
    ##  $ col3: chr  "a" "b" "c" "d" ...

BaseR
-----

``` r
#df$col4 <- 11:16
new_elements <- c("new_string", 19, "z")
df <- rbind(df, new_elements)
df2 <- rbind(df2, new_elements)
```

    ## Warning in `[<-.factor`(`*tmp*`, ri, value = "new_string"): invalid factor
    ## level, NA generated

    ## Warning in `[<-.factor`(`*tmp*`, ri, value = "new_string"): invalid factor
    ## level, NA generated

``` r
is.na(df2)
```

    ##       col1  col2  col3
    ## [1,] FALSE FALSE FALSE
    ## [2,] FALSE FALSE FALSE
    ## [3,] FALSE FALSE FALSE
    ## [4,] FALSE FALSE FALSE
    ## [5,] FALSE FALSE FALSE
    ## [6,] FALSE FALSE FALSE
    ## [7,]  TRUE FALSE  TRUE
