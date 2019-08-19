Laboratorio03
================
Rodolfo
14/8/2019

    ## -- Attaching packages ----------------------------------------------------- tidyverse 1.2.1 --

    ## <U+221A> ggplot2 3.0.0     <U+221A> purrr   0.2.5
    ## <U+221A> tibble  2.1.3     <U+221A> dplyr   0.8.3
    ## <U+221A> tidyr   0.8.1     <U+221A> stringr 1.3.1
    ## <U+221A> readr   1.3.1     <U+221A> forcats 0.3.0

    ## Warning: package 'tibble' was built under R version 3.5.2

    ## Warning: package 'dplyr' was built under R version 3.5.2

    ## -- Conflicts -------------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

Trabajo en Clase EXTRA
======================

``` r
players_score <- as.data.frame(read_csv(file = "football-world-cup-2018-dataset/Players_Score.csv"))
```

    ## Parsed with column specification:
    ## cols(
    ##   Rank = col_double(),
    ##   player = col_character(),
    ##   club = col_character(),
    ##   age = col_double(),
    ##   Apps = col_character(),
    ##   Mins = col_double(),
    ##   Goals = col_character(),
    ##   Assists = col_character(),
    ##   Yel = col_character(),
    ##   Red = col_character(),
    ##   SpG = col_character(),
    ##   PS = col_double(),
    ##   AerialsWon = col_character(),
    ##   MotM = col_character(),
    ##   Rating = col_double()
    ## )

``` r
players_score$cambio<-str_extract_all(players_score$Apps, "\\([^)]*\\)","")
players_score$cambio<-str_extract_all(players_score$cambio,"[0-9]+")
players_score$Apps<-str_replace_all(players_score$Apps, "\\([^)]*\\)","")
numbers <- c("age", "Apps", "cambio", "Goals", "Assists", "Yel", "Red", "SpG", "PS", "AerialsWon", "MotM","Rating")

players_score[numbers] <- lapply(players_score[numbers],as.numeric)
```

    ## Warning in lapply(players_score[numbers], as.numeric): NAs introducidos por
    ## coerci'on

    ## Warning in lapply(players_score[numbers], as.numeric): NAs introducidos por
    ## coerci'on

    ## Warning in lapply(players_score[numbers], as.numeric): NAs introducidos por
    ## coerci'on

    ## Warning in lapply(players_score[numbers], as.numeric): NAs introducidos por
    ## coerci'on

    ## Warning in lapply(players_score[numbers], as.numeric): NAs introducidos por
    ## coerci'on

    ## Warning in lapply(players_score[numbers], as.numeric): NAs introducidos por
    ## coerci'on

    ## Warning in lapply(players_score[numbers], as.numeric): NAs introducidos por
    ## coerci'on

``` r
players_score[numbers] <- players_score[numbers] %>%
  replace_na(list(age=0, Goals=0, Assists=0, Yel=0, Red=0, SpG=0, PS=0, AerialsWon=0,MotM=0, cambio=0))
head(players_score)
```

    ##   Rank              player          club age Apps Mins Goals Assists Yel
    ## 1    1        Hakim Ziyech          Ajax  25   34 3043     9      15   4
    ## 2    2 Alireza Jahanbakhsh    AZ Alkmaar  24   33 2840    21      12   3
    ## 3    3      Hirving Lozano PSV Eindhoven  22   29 2350    17       8   4
    ## 4    4         David Neres          Ajax  21   28 2534    14      11   3
    ## 5    5     Steven Berghuis     Feyenoord  26   31 2597    18      12   5
    ## 6    6        Luuk de Jong PSV Eindhoven  27   22 2078    12       5   1
    ##   Red SpG   PS AerialsWon MotM Rating cambio
    ## 1   0 4.9 75.4        0.2    9   8.21      0
    ## 2   0 4.3 73.4        0.7   14   8.20      0
    ## 3   2 3.4 75.3        0.6    8   7.90      0
    ## 4   0 2.1 83.1        0.3    6   7.85      4
    ## 5   1 2.9 78.4        0.4    9   7.81      0
    ## 6   0 3.4 66.7        5.7    4   7.69      6

### Jugador con mejor PS y de que club es

``` r
players_score %>% select(player,PS,club) %>% 
  arrange(desc(PS)) %>% head(1)
```

    ##         player   PS                club
    ## 1 Thiago Silva 96.1 Paris Saint Germain

### Mas veces a sido Man of the Match e indice de goles por minuto

``` r
players_score %>% arrange(desc(MotM)) %>% 
  mutate(`Minutos/Gol`= Mins/Goals) %>% 
  head(1) %>% 
  summarise(player,MotM, `Minutos/Gol`)
```

    ##         player MotM Minutos/Gol
    ## 1 Lionel Messi   22    88.14706

### Mas joven con mas goles anotados

``` r
players_score %>% 
  arrange(age, desc(Goals)) %>% head(1) %>% 
  select(player, club, age, Goals, Mins)
```

    ##    player      club age Goals Mins
    ## 1 Rodrygo Santos FC  17     5  742

### Cambio mas efectivo con goles

Respuesta inconclusa, no supe en que basar esto.

``` r
players_score %>% mutate(`M/G`=Mins/Goals, Rate= Goals/cambio) %>% 
  filter(Goals!=0, cambio!=0) %>% 
  arrange(Rate, desc(Goals),Mins,  desc(`M/G`, cambio)) %>% head()
```

    ##   Rank         player     club age Apps Mins Goals Assists Yel Red SpG
    ## 1  366 Fred Onyedinma Millwall  21    8  981     1       1   0   0 0.7
    ## 2  366 Fred Onyedinma Millwall  21    8  981     1       1   0   0 0.7
    ## 3  281      Marko Rog   Napoli  22    0  259     1       0   2   0 0.2
    ## 4  281      Marko Rog   Napoli  22    0  259     1       0   2   0 0.2
    ## 5  281      Marko Rog   Napoli  22    0  259     1       0   2   0 0.2
    ## 6  281      Marko Rog   Napoli  22    0  259     1       0   2   0 0.2
    ##     PS AerialsWon MotM Rating cambio M/G       Rate
    ## 1 74.1        0.4    0   6.27     29 981 0.03448276
    ## 2 74.1        0.4    0   6.27     29 981 0.03448276
    ## 3 87.5        0.3    0   6.20     28 259 0.03571429
    ## 4 87.5        0.3    0   6.20     28 259 0.03571429
    ## 5 87.5        0.3    0   6.20     28 259 0.03571429
    ## 6 87.5        0.3    0   6.20     28 259 0.03571429

### Jugador con mas tarjetas

``` r
players_score %>% mutate(Tot_Tarjetas= Yel+Red) %>% 
  select(player, club, Tot_Tarjetas, Yel, Red) %>% arrange(desc(Tot_Tarjetas)) %>% 
  head(1)
```

    ##          player     club Tot_Tarjetas Yel Red
    ## 1 Daniel Parejo Valencia           16  15   1

### El mejor equipo

Para decidir cual es el mejor equipo me baso en la idea que en conjunto el ranking de sus jugadores hace al equipo, asi la suma del ranking de los jugadores me da una metrica valida para comparar a los equipos.

``` r
players_score %>% 
  group_by(club) %>% 
  summarise(rank_equipo=sum(Rank)) %>% arrange(rank_equipo)
```

    ## # A tibble: 332 x 2
    ##    club                 rank_equipo
    ##    <chr>                      <dbl>
    ##  1 PSV Eindhoven               1542
    ##  2 Ajax                        1606
    ##  3 AZ Alkmaar                  1830
    ##  4 Guangzhou Evergrande        1934
    ##  5 Los Angeles FC              2020
    ##  6 Fenerbahce                  2082
    ##  7 Shanghai SIPG FC            2231
    ##  8 Inter                       2246
    ##  9 Flamengo                    2284
    ## 10 FC Krasnodar                2378
    ## # ... with 322 more rows

Laboratorio 3
=============

``` r
#df <-as.data.frame( read_csv("Lab3/tabla_completa.csv"))
df <- as.data.frame(readr::read_csv("Lab3/tabla_completa.csv", locale = locale(encoding = "latin1")))
```

    ## Warning: Missing column names filled in: 'X1' [1]

    ## Parsed with column specification:
    ## cols(
    ##   X1 = col_double(),
    ##   COD_VIAJE = col_double(),
    ##   CLIENTE = col_character(),
    ##   UBICACION = col_double(),
    ##   CANTIDAD = col_double(),
    ##   PILOTO = col_character(),
    ##   Q = col_double(),
    ##   CREDITO = col_double(),
    ##   UNIDAD = col_character(),
    ##   MES = col_character(),
    ##   ANIO = col_double()
    ## )

``` r
#df$UNIDAD %>% unique()
head(df)
```

    ##   X1 COD_VIAJE                                       CLIENTE UBICACION
    ## 1  1  10000001       EL PINCHE OBELISCO / Despacho a cliente     76002
    ## 2  2  10000002               TAQUERIA EL CHINITO |||Faltante     76002
    ## 3  3  10000003      TIENDA LA BENDICION / Despacho a cliente     76002
    ## 4  4  10000004                           TAQUERIA EL CHINITO     76002
    ## 5  5  10000005 CHICHARRONERIA EL RICO COLESTEROL |||Faltante     76001
    ## 6  6  10000006                       UBIQUO LABS |||FALTANTE     76001
    ##   CANTIDAD                        PILOTO      Q CREDITO        UNIDAD MES
    ## 1     1200       Fernando Mariano Berrio 300.00      30 Camion Grande  01
    ## 2     1433        Hector Aragones Frutos 358.25      90 Camion Grande  01
    ## 3     1857          Pedro Alvarez Parejo 464.25      60 Camion Grande  01
    ## 4      339          Angel Valdez Alegria  84.75      30         Panel  01
    ## 5     1644 Juan Francisco Portillo Gomez 411.00      30 Camion Grande  01
    ## 6     1827             Luis Jaime Urbano 456.75      30 Camion Grande  01
    ##   ANIO
    ## 1 2017
    ## 2 2017
    ## 3 2017
    ## 4 2017
    ## 5 2017
    ## 6 2017

``` r
# glimpse(viajes) %>% str()
# colSums(is.na(viajes))
```

### ¿Debemos invertir en la contratación de más personal?

Yo creeria que no es necesario contratar a mas personal, cada piloto hace un promedio de 22 viajes al mes, lo cual no es demasiado pues hacen aproximadamente un viaje al dia.

``` r
df %>%
  group_by(MES,PILOTO)%>%
  count() %>% ungroup() %>% 
  group_by(PILOTO) %>% 
  summarise(Promedio=mean(n))
```

    ## # A tibble: 9 x 2
    ##   PILOTO                        Promedio
    ##   <chr>                            <dbl>
    ## 1 Angel Valdez Alegria              21.4
    ## 2 Felipe Villatoro                  22.5
    ## 3 Fernando Mariano Berrio           24.3
    ## 4 Hector Aragones Frutos            22.5
    ## 5 Hector Giron                      20.7
    ## 6 Ismael Rodero Monteagudo          22.2
    ## 7 Juan Francisco Portillo Gomez     19.3
    ## 8 Luis Jaime Urbano                 22.4
    ## 9 Pedro Alvarez Parejo              23

### ¿Debemos invertir en la compra de más vehículos de distribución? ¿Cuántos y de que

tipo? Si vamos a comprar alguna unidad extra probablemente deberia ser de camiones grandes pues es la que mas se usa, las otras basta con dos o tres para suplir los viajes mensuales, del camion grande se usan cinco todo el tiempo sin parar. Es por esto que si de algun transporte se necesita seria el de el camion grande.

``` r
df%>%
  group_by(UNIDAD,MES) %>%
  count() %>% ungroup() %>% 
  group_by(UNIDAD) %>% 
  summarise(promedio= mean(n), cant= mean(n)/22)
```

    ## # A tibble: 3 x 3
    ##   UNIDAD                promedio  cant
    ##   <chr>                    <dbl> <dbl>
    ## 1 Camion Grande            110.   5.00
    ## 2 "Camion Peque\u00f1o"     55    2.5 
    ## 3 Panel                     33.1  1.50

### Las tarifas actuales ¿son aceptables por el cliente?

Si son aceptables, todos pagan lo mismo por cada unidad de producto asi que supongo que todos estan de acuerdo con las tarifas si no hay nadie con una tarifa diferente, no importando la cantidad.

``` r
nuevo_df<-df
nuevo_df[grep('EL GALLO NEGRO', nuevo_df$CLIENTE),"CLIENTE"] <-"EL GALLO NEGRO"
nuevo_df[grep('POLLO PINULITO', nuevo_df$CLIENTE),"CLIENTE"] <-"POLLO PINULITO"
nuevo_df[grep('EL PINCHE OBELISCO', nuevo_df$CLIENTE),"CLIENTE"] <-"EL PINCHE OBELISCO"
nuevo_df[grep('TAQUERIA EL CHINITO', nuevo_df$CLIENTE),"CLIENTE"] <-"TAQUERIA EL CHINITO"
nuevo_df[grep('UBIQUO LABS', nuevo_df$CLIENTE),"CLIENTE"] <-"UBIQUO LABS"

nuevo_df %>% group_by(CLIENTE) %>% 
  mutate(Precio=Q/CANTIDAD) %>% 
  select(CLIENTE, Precio) %>% unique() %>% 
  arrange(CLIENTE, Precio)
```

    ## # A tibble: 13 x 2
    ## # Groups:   CLIENTE [13]
    ##    CLIENTE                                            Precio
    ##    <chr>                                               <dbl>
    ##  1 ABARROTERIA EBENEZER/Despacho a cliente              0.25
    ##  2 BAR LA OFICINA                                       0.25
    ##  3 CHICHARRONERIA EL RICO COLESTEROL |||Faltante        0.25
    ##  4 EL GALLO NEGRO                                       0.25
    ##  5 EL PINCHE OBELISCO                                   0.25
    ##  6 HOSPITAL LAS AMERICAS                                0.25
    ##  7 HOSPITAL ROOSEVELT / Despacho a cliente              0.25
    ##  8 POLLO PINULITO                                       0.25
    ##  9 SPORTA, S.A./Despacho a cliente |||Faltante          0.25
    ## 10 TAQUERIA EL CHINITO                                  0.25
    ## 11 TIENDA LA BENDICION / Despacho a cliente             0.25
    ## 12 UBIQUO LABS                                          0.25
    ## 13 UNIVERSIDAD FRANCISCO MARROQUIN/Despacho a cliente   0.25

### ¿Nos están robando los pilotos?

Yo creo que no, si alguien lo esta haciendo quiza sea Pedro Alvarez pero es poco probable a todos los pilotos les falta aproximadamente el 3% de los pedidos, pero es con los mismos clientes, Pedro supera el promedio mensual de los faltantes en 6 meses comparado a 4 de los demas pilotos.

``` r
nuevo_df <-df 
nuevo_df$Faltante <- grepl('Faltante', nuevo_df$CLIENTE, ignore.case=TRUE)
nuevo_df$Despacho <- grepl('Despacho', nuevo_df$CLIENTE, ignore.case=TRUE)
nuevo_df$Devolucion <- grepl('Devolucion', nuevo_df$CLIENTE, ignore.case=TRUE)

nuevo_df %>% 
  group_by(PILOTO, MES) %>% 
  summarise(Tot=n(), Falt=sum(Faltante), Dev=sum(Devolucion, Desp=sum(Despacho))) %>% 
  mutate(Por_Falt=Tot/Falt) %>% arrange(desc(Por_Falt)) %>% 
  mutate(mayor= ifelse(Por_Falt>=mean(Por_Falt), 1, 0)) %>% 
  ungroup() %>% group_by(PILOTO) %>% 
  summarise(mes_Raro= sum(mayor)) %>% arrange(desc(mes_Raro))
```

    ## # A tibble: 9 x 2
    ##   PILOTO                        mes_Raro
    ##   <chr>                            <dbl>
    ## 1 Pedro Alvarez Parejo                 6
    ## 2 Fernando Mariano Berrio              5
    ## 3 Angel Valdez Alegria                 4
    ## 4 Felipe Villatoro                     4
    ## 5 Hector Aragones Frutos               4
    ## 6 Hector Giron                         4
    ## 7 Ismael Rodero Monteagudo             4
    ## 8 Juan Francisco Portillo Gomez        4
    ## 9 Luis Jaime Urbano                    4

``` r
nuevo_df %>% 
  filter(PILOTO=="Luis Jaime Urbano") %>% 
  group_by(UNIDAD) %>% summarise(n())
```

    ## # A tibble: 3 x 2
    ##   UNIDAD                `n()`
    ##   <chr>                 <int>
    ## 1 Camion Grande           136
    ## 2 "Camion Peque\u00f1o"    64
    ## 3 Panel                    46

### ¿Qué estrategias debo seguir?

Yo sugeriria implementar tarifas diferente dependiendo del transporte que se deba utilizar pues los costos son diferentes tambien creo que debe haber un cobro escalado y no lineal pues llevar 10 u once productos el costo pienso es el mismo, sin embargo el cobro es menor en esta forma.

### 80-20 de clientes y cuáles de ellos son los más importantes

No se cumple la ley de pareto del 80-20 de los clientes en este caso ni con las ventas ni con los viajes. Los Mas importantes yo diria que son los cinco con mas movimiento, siendo estos El Pinche Obelisco, Taqueria El Chinito, El Gallo Negro, Pollo Pinulito y Ubico Labs.

``` r
nuevo_df <- as.data.frame(df)
nuevo_df$CLIENTE %>% unique()
```

    ##  [1] "EL PINCHE OBELISCO / Despacho a cliente"           
    ##  [2] "TAQUERIA EL CHINITO |||Faltante"                   
    ##  [3] "TIENDA LA BENDICION / Despacho a cliente"          
    ##  [4] "TAQUERIA EL CHINITO"                               
    ##  [5] "CHICHARRONERIA EL RICO COLESTEROL |||Faltante"     
    ##  [6] "UBIQUO LABS |||FALTANTE"                           
    ##  [7] "EL GALLO NEGRO |||DEVOLUCION"                      
    ##  [8] "EL GALLO NEGRO / Despacho a cliente"               
    ##  [9] "UNIVERSIDAD FRANCISCO MARROQUIN/Despacho a cliente"
    ## [10] "POLLO PINULITO|||FALTANTE"                         
    ## [11] "SPORTA, S.A./Despacho a cliente |||Faltante"       
    ## [12] "HOSPITAL ROOSEVELT / Despacho a cliente"           
    ## [13] "UBIQUO LABS"                                       
    ## [14] "BAR LA OFICINA"                                    
    ## [15] "ABARROTERIA EBENEZER/Despacho a cliente"           
    ## [16] "EL PINCHE OBELISCO |||Faltante"                    
    ## [17] "POLLO PINULITO/Despacho a cliente"                 
    ## [18] "HOSPITAL LAS AMERICAS"

``` r
nuevo_df[grep('EL GALLO NEGRO', nuevo_df$CLIENTE),"CLIENTE"] <-"EL GALLO NEGRO"
nuevo_df[grep('POLLO PINULITO', nuevo_df$CLIENTE),"CLIENTE"] <-"POLLO PINULITO"
nuevo_df[grep('EL PINCHE OBELISCO', nuevo_df$CLIENTE),"CLIENTE"] <-"EL PINCHE OBELISCO"
nuevo_df[grep('TAQUERIA EL CHINITO', nuevo_df$CLIENTE),"CLIENTE"] <-"TAQUERIA EL CHINITO"
nuevo_df[grep('UBIQUO LABS', nuevo_df$CLIENTE),"CLIENTE"] <-"UBIQUO LABS"

nuevo_df %>% 
  group_by(CLIENTE) %>% 
  summarise(Ventas = sum(Q), Viajes= n()) %>% 
  mutate(Ventas_Por= (Ventas/sum(Ventas)*100),Viajes_Por= (Viajes/sum(Viajes)*100)) %>% 
  arrange(desc(Ventas, Viajes)) %>% 
  mutate(Ventas_Acum= cumsum(Ventas_Por), Viajes_Acum= cumsum(Viajes_Por)) %>% 
  select(CLIENTE, Ventas, Ventas_Acum, Viajes, Viajes_Acum)
```

    ## # A tibble: 13 x 5
    ##    CLIENTE                            Ventas Ventas_Acum Viajes Viajes_Acum
    ##    <chr>                               <dbl>       <dbl>  <int>       <dbl>
    ##  1 EL PINCHE OBELISCO                 71079         11.9    256        11.7
    ##  2 TAQUERIA EL CHINITO                69136.        23.4    247        23.1
    ##  3 EL GALLO NEGRO                     67556.        34.7    245        34.3
    ##  4 POLLO PINULITO                     65106.        45.6    228        44.8
    ##  5 UBIQUO LABS                        64251.        56.3    241        55.8
    ##  6 UNIVERSIDAD FRANCISCO MARROQUIN/D~ 37889.        62.6    134        62.0
    ##  7 ABARROTERIA EBENEZER/Despacho a c~ 37129         68.8    131        68.0
    ##  8 TIENDA LA BENDICION / Despacho a ~ 35338         74.7    129        73.9
    ##  9 BAR LA OFICINA                     35164.        80.6    134        80.0
    ## 10 SPORTA, S.A./Despacho a cliente |~ 34984.        86.4    124        85.7
    ## 11 CHICHARRONERIA EL RICO COLESTEROL~ 32456.        91.9    114        91.0
    ## 12 HOSPITAL ROOSEVELT / Despacho a c~ 26276.        96.2    105        95.8
    ## 13 HOSPITAL LAS AMERICAS              22486        100       92       100

### Mejores pilotos y transportes más efectivos.

El piloto mas efectivo es Ismael Rodero

``` r
df %>% 
  select(PILOTO, UNIDAD, Q, CANTIDAD) %>% 
  group_by(PILOTO) %>% summarise(Ventas=sum(Q), n(), VpV=Ventas/n()) %>% 
  arrange(desc(VpV))
```

    ## # A tibble: 9 x 4
    ##   PILOTO                        Ventas `n()`   VpV
    ##   <chr>                          <dbl> <int> <dbl>
    ## 1 Ismael Rodero Monteagudo      70936.   244  291.
    ## 2 Fernando Mariano Berrio       77097.   267  289.
    ## 3 Hector Giron                  62955.   228  276.
    ## 4 Juan Francisco Portillo Gomez 58347.   212  275.
    ## 5 Angel Valdez Alegria          64308.   235  274.
    ## 6 Hector Aragones Frutos        66645.   248  269.
    ## 7 Pedro Alvarez Parejo          67940.   253  269.
    ## 8 Luis Jaime Urbano             65992.   246  268.
    ## 9 Felipe Villatoro              64626.   247  262.

El transporter mas efectivo es el camion grande pues genera mas ventas por viaje

``` r
df %>% 
  select(PILOTO, UNIDAD, Q, CANTIDAD) %>% 
  group_by(UNIDAD) %>% summarise(Ventas=sum(Q), n(), VpV=Ventas/n()) %>% 
  arrange(desc(VpV))
```

    ## # A tibble: 3 x 4
    ##   UNIDAD                 Ventas `n()`   VpV
    ##   <chr>                   <dbl> <int> <dbl>
    ## 1 Camion Grande         455466.  1211 376. 
    ## 2 "Camion Peque\u00f1o" 112815.   605 186. 
    ## 3 Panel                  30566.   364  84.0
