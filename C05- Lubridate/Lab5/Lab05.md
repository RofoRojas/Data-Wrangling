Lab05
================
Rodolfo
8/9/2019

Laboratorio 5
=============

``` r
library(lubridate)
```

    ## 
    ## Attaching package: 'lubridate'

    ## The following object is masked from 'package:base':
    ## 
    ##     date

``` r
library(dplyr)
```

    ## Warning: package 'dplyr' was built under R version 3.5.2

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:lubridate':
    ## 
    ##     intersect, setdiff, union

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(readr)
library(readxl)
library(plotly)
```

    ## Loading required package: ggplot2

    ## 
    ## Attaching package: 'plotly'

    ## The following object is masked from 'package:ggplot2':
    ## 
    ##     last_plot

    ## The following object is masked from 'package:stats':
    ## 
    ##     filter

    ## The following object is masked from 'package:graphics':
    ## 
    ##     layout

Parte 1
-------

Predecir un eclipse: En tiempo de Norte América, el eclipse total inició el 21 de agosto del 2017 a las 18:26:40. Este mismo evento, sucederá un Saros después. Un Saros equivale a 223 Synodic Months Un Synodic Month equivale a 29 días con 12 horas, con 44 minutos y 3 segundos.

variables

``` r
historico <- dmy_hms("21th August, 2017 18:26:40", tz = "EST")
Synodic_Month <- duration(day=29, hour= 12, minute= 44, second= 3)
Saros <- duration(223*Synodic_Month)
```

``` r
proximo <- historico+Saros
print(paste("El proximo eclipse ocurrira en: ", proximo, sep = ""))
```

    ## [1] "El proximo eclipse ocurrira en: 2035-09-02 02:09:49"

Parte 2
-------

importar datos Nota: para poder importarlos lo pase a un archivo csv y tambien quite las tildes por problema de encoding en mi computadora.

``` r
data <- read_csv("data.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   `Fecha Creacion` = col_character(),
    ##   `Hora Creacion` = col_character(),
    ##   `Caller ID` = col_double(),
    ##   Cod = col_character(),
    ##   Email = col_double(),
    ##   SMS = col_double(),
    ##   Call = col_double(),
    ##   `Fecha Final` = col_character(),
    ##   `Hora Final` = col_character()
    ## )

``` r
glimpse(data)
```

    ## Observations: 263,725
    ## Variables: 9
    ## $ `Fecha Creacion` <chr> "12/10/17", "19-03-17", "13-03-17", "14-04-17...
    ## $ `Hora Creacion`  <chr> "10:18 p. m.", "5:35 p. m.", "10:03 p. m.", "...
    ## $ `Caller ID`      <dbl> 368224, 368224, 368224, 368224, 748633, 59943...
    ## $ Cod              <chr> "Cancelaciones", "Otros/Varios", "Consultas",...
    ## $ Email            <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
    ## $ SMS              <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
    ## $ Call             <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
    ## $ `Fecha Final`    <chr> "12/10/17", "19-03-17", "13-03-17", "14-04-17...
    ## $ `Hora Final`     <chr> "10:29 p. m.", "5:52 p. m.", "10:27 p. m.", "...

parsing dates

``` r
## Modificando las Horas
data$`Hora Creacion` <- paste(substr(data$`Hora Creacion`,1, nchar(data$`Hora Creacion`)-6), substr(data$`Hora Creacion`, nchar(data$`Hora Creacion`)-4, nchar(data$`Hora Creacion`)-4),"m",sep="")

data$`Hora Final` <- paste(substr(data$`Hora Final`,1, nchar(data$`Hora Final`)-6), substr(data$`Hora Final`, nchar(data$`Hora Final`)-4, nchar(data$`Hora Final`)-4),"m",sep="")

## Parseando la fecha
data <- data %>% 
  mutate(Creacion= dmy_hm(paste(data$`Fecha Creacion`, data$`Hora Creacion`, sep = " ")), Final= dmy_hm(paste(data$`Fecha Final`, data$`Hora Final`, sep = " "))) %>% 
  select(Creacion, `Caller ID`, Cod, Email, SMS, Call, Final)
glimpse(data)
```

    ## Observations: 263,725
    ## Variables: 7
    ## $ Creacion    <dttm> 2017-10-12 22:18:00, 2017-03-19 17:35:00, 2017-03...
    ## $ `Caller ID` <dbl> 368224, 368224, 368224, 368224, 748633, 599434, 59...
    ## $ Cod         <chr> "Cancelaciones", "Otros/Varios", "Consultas", "Con...
    ## $ Email       <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,...
    ## $ SMS         <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,...
    ## $ Call        <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,...
    ## $ Final       <dttm> 2017-10-12 22:29:00, 2017-03-19 17:52:00, 2017-03...

### Preguntas

● ¿En qué meses existe una mayor cantidad de llamadas por código?

``` r
data %>% 
  group_by(Codigo= as.factor(Cod), Mes=as.factor(month(Creacion))) %>%
  summarise(llamadas=n()) #%>% 
```

    ## # A tibble: 84 x 3
    ## # Groups:   Codigo [7]
    ##    Codigo Mes   llamadas
    ##    <fct>  <fct>    <int>
    ##  1 0      1         1361
    ##  2 0      2         1236
    ##  3 0      3         1419
    ##  4 0      4         1362
    ##  5 0      5         1404
    ##  6 0      6         1330
    ##  7 0      7         1463
    ##  8 0      8         1442
    ##  9 0      9         1380
    ## 10 0      10        1397
    ## # ... with 74 more rows

``` r
  # plot_ly(x=~Mes, y=~llamadas, color=~Codigo, colors = "Paired") %>% 
  # layout(title="Llamadas por codigo por mes", barmode="group")
```

plot\_ly(x=~Mes, y=~llamadas, color=~Codigo, colors = "Paired") %&gt;% layout(title="Llamadas por codigo por mes", barmode="group")

● ¿Qué día de la semana es el más ocupado? R//Domingo

``` r
data %>% 
  group_by(Dia=wday(Creacion, label = T)) %>% count() #%>%
```

    ## # A tibble: 7 x 2
    ## # Groups:   Dia [7]
    ##   Dia       n
    ##   <ord> <int>
    ## 1 Sun   38254
    ## 2 Mon   37501
    ## 3 Tue   37710
    ## 4 Wed   37511
    ## 5 Thu   37726
    ## 6 Fri   37409
    ## 7 Sat   37614

``` r
  # plot_ly(x=~Dia, y=~n, color=~Dia ,colors= "Spectral") %>%
  # layout(title="Llamadas por dia de la Semana")
```

plot\_ly(x=~Dia, y=~n, color=~Dia ,colors= "Spectral") %&gt;% layout(title="Llamadas por dia de la Semana")

● ¿Qué mes es el más ocupado? R// Mayo

``` r
data %>% 
  group_by(Mes=month(Creacion, label = T)) %>% count() #%>%
```

    ## # A tibble: 12 x 2
    ## # Groups:   Mes [12]
    ##    Mes       n
    ##    <ord> <int>
    ##  1 Jan   22425
    ##  2 Feb   19932
    ##  3 Mar   22708
    ##  4 Apr   21611
    ##  5 May   22525
    ##  6 Jun   21370
    ##  7 Jul   22514
    ##  8 Aug   22316
    ##  9 Sep   21891
    ## 10 Oct   22601
    ## 11 Nov   21681
    ## 12 Dec   22151

``` r
  # plot_ly(x=~Mes, y=~n, color=~Mes ,colors= "Spectral") %>% 
  # layout(title="Llamadas por Mes")
```

plot\_ly(x=~Mes, y=~n, color=~Mes ,colors= "Spectral") %&gt;% layout(title="Llamadas por Mes")

● ¿Existe una temporalidad en la cantidad de llamadas? No parece que la haya

``` r
data %>% 
  group_by(Fecha=date(Creacion)) %>%  summarise(llamadas= n()) #%>% 
```

    ## # A tibble: 365 x 2
    ##    Fecha      llamadas
    ##    <date>        <int>
    ##  1 2017-01-01      653
    ##  2 2017-01-02      706
    ##  3 2017-01-03      716
    ##  4 2017-01-04      751
    ##  5 2017-01-05      705
    ##  6 2017-01-06      706
    ##  7 2017-01-07      713
    ##  8 2017-01-08      730
    ##  9 2017-01-09      733
    ## 10 2017-01-10      734
    ## # ... with 355 more rows

``` r
  # plot_ly(x=~Fecha, y=~llamadas, type = "scatter", mode= "lines") %>%
  # layout(title= "Llamadas diarias en el tiempo")
```

plot\_ly(x=~Fecha, y=~llamadas, type = "scatter", mode= "lines") %&gt;% layout(title= "Llamadas diarias en el tiempo")

● ¿Cuántos minutos dura la llamada promedio? R// Dura en promedio 7M y 46.82 S, esto incluyendo las duraciones negativas por errores de ingreso.

``` r
data %>% 
  mutate(Duracion= seconds(int_length(Creacion%--%Final))) %>% summarise(Min_Promedio=seconds_to_period(mean(Duracion)))
```

    ## # A tibble: 1 x 1
    ##   Min_Promedio       
    ##   <Period>           
    ## 1 7M 46.823547255664S

``` r
data %>% 
  mutate(Duracion= (int_length(Creacion%--%Final))) #%>% 
```

    ## # A tibble: 263,725 x 8
    ##    Creacion            `Caller ID` Cod   Email   SMS  Call
    ##    <dttm>                    <dbl> <chr> <dbl> <dbl> <dbl>
    ##  1 2017-10-12 22:18:00      368224 Canc~     0     1     0
    ##  2 2017-03-19 17:35:00      368224 Otro~     0     1     0
    ##  3 2017-03-13 22:03:00      368224 Cons~     0     1     0
    ##  4 2017-04-14 17:55:00      368224 Cons~     0     1     0
    ##  5 2017-11-04 09:08:00      748633 Cons~     0     1     0
    ##  6 2017-04-29 07:19:00      599434 Canc~     0     1     0
    ##  7 2017-01-10 13:51:00      599434 Cons~     0     1     0
    ##  8 2017-09-20 12:40:00      599434 Cons~     0     1     0
    ##  9 2017-04-13 18:27:00      790749 Cons~     0     1     0
    ## 10 2017-03-23 06:23:00      760915 Cons~     0     1     0
    ## # ... with 263,715 more rows, and 2 more variables: Final <dttm>,
    ## #   Duracion <dbl>

``` r
  # plot_ly(x=~Duracion, type = "box")
```

plot\_ly(x=~Duracion, type = "box")

● Realice una tabla de frecuencias con el tiempo de llamada.

``` r
data %>% 
  mutate(`Tiempo de Llamada en Minutos`= (int_length(Creacion%--%Final)/60)%/%5*5) %>%
  filter(`Tiempo de Llamada en Minutos`>=0) %>% 
  group_by(`Tiempo de Llamada en Minutos`) %>% count()
```

    ## # A tibble: 7 x 2
    ## # Groups:   Tiempo de Llamada en Minutos [7]
    ##   `Tiempo de Llamada en Minutos`     n
    ##                            <dbl> <int>
    ## 1                              0 43882
    ## 2                              5 42296
    ## 3                             10 42195
    ## 4                             15 42003
    ## 5                             20 42073
    ## 6                             25 41641
    ## 7                             30  8333

``` r
data %>% 
  mutate(`Tiempo de Llamada en Minutos`= int_length(Creacion%--%Final)/60) %>%
  filter(`Tiempo de Llamada en Minutos`>=0) #%>% 
```

    ## # A tibble: 262,423 x 8
    ##    Creacion            `Caller ID` Cod   Email   SMS  Call
    ##    <dttm>                    <dbl> <chr> <dbl> <dbl> <dbl>
    ##  1 2017-10-12 22:18:00      368224 Canc~     0     1     0
    ##  2 2017-03-19 17:35:00      368224 Otro~     0     1     0
    ##  3 2017-03-13 22:03:00      368224 Cons~     0     1     0
    ##  4 2017-04-14 17:55:00      368224 Cons~     0     1     0
    ##  5 2017-11-04 09:08:00      748633 Cons~     0     1     0
    ##  6 2017-04-29 07:19:00      599434 Canc~     0     1     0
    ##  7 2017-01-10 13:51:00      599434 Cons~     0     1     0
    ##  8 2017-09-20 12:40:00      599434 Cons~     0     1     0
    ##  9 2017-04-13 18:27:00      790749 Cons~     0     1     0
    ## 10 2017-03-23 06:23:00      760915 Cons~     0     1     0
    ## # ... with 262,413 more rows, and 2 more variables: Final <dttm>, `Tiempo
    ## #   de Llamada en Minutos` <dbl>

``` r
  # plot_ly(x=~`Tiempo de Llamada en Minutos`, type = "histogram", xbins = list(start=0, end=30, size=5)) 
```

plot\_ly(x=~`Tiempo de Llamada en Minutos`, type = "histogram", xbins = list(start=0, end=30, size=5))
