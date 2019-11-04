Lab01
================
Rodolfo
31/7/2019

    ## Warning: package 'dplyr' was built under R version 3.5.2

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

Problema 1
----------

Leer que archivos existen:

``` r
archivos <- list.files("data")
```

Funcion para leer archivo y ponerle fecha

``` r
Poner_Fecha <- function(name){
  Month <- substr(name,1,2)
  Year <- substr(name, 4, 7)
  df_temporal <- data.frame(read_excel(paste("data/", name,sep="")))
  df_temporal$MONTH <- Month
  df_temporal$YEAR <- Year
  df_temporal <- df_temporal[,c("COD_VIAJE","CLIENTE","UBICACION","CANTIDAD", "PILOTO","Q","CREDITO","UNIDAD", "MONTH", "YEAR")]
  return(df_temporal)
}
```

Creo los dataframes

``` r
listado_df <- lapply(archivos, Poner_Fecha)
```

Se unen los dataframes y elimino lo que ya no me va a servir

``` r
Datos_Completos <- do.call(rbind, listado_df)
rm(archivos)
rm(listado_df)
```

Escribo un archivo csv

``` r
write.csv(Datos_Completos, file = "Entregas_2018.csv")
```

Problema 2
----------

Hacer una funcion para encontrar la moda de un vector

``` r
Moda <- function(vec){
  vec_df <- data_frame(values=vec)
  vec_count <- count(vec_df, values, sort = TRUE)
  val <- vec_count[1,1]
  return(as.vector(val))
}
```

Lista de vectores a utilizar

``` r
listado <- list(
  num = c(1:5, 3, 3,4,5,3,2,1),
  nom = c("Rodolfo","Juan", "Sara", "Sofia", "Maria",  "Rodolfo"),
  pais = c("GUA", "USA", "MEX", "ESP", "GUA", "BEL", "FRA", "ITA", "GUA", "ITA")
)
```

Prueba y muestra

``` r
lapply(listado, Moda)
```

    ## Warning: `data_frame()` is deprecated, use `tibble()`.
    ## This warning is displayed once per session.

    ## $num
    ## # A tibble: 1 x 1
    ##   values
    ##    <dbl>
    ## 1      3
    ## 
    ## $nom
    ## # A tibble: 1 x 1
    ##   values 
    ##   <chr>  
    ## 1 Rodolfo
    ## 
    ## $pais
    ## # A tibble: 1 x 1
    ##   values
    ##   <chr> 
    ## 1 GUA

Problema 3
----------

Importar archivo de parque vehicular

``` r
PV_01_2019 <- read.delim(file = "INE_PARQUE_VEHICULAR_080219.txt", header = TRUE, sep="|")
```

    ## Warning in scan(file = file, what = what, sep = sep, quote = quote, dec =
    ## dec, : EOF within quoted string

``` r
PV_01_2019 <- PV_01_2019[,-11]
```
