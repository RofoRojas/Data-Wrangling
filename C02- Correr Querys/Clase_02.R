summary(mydb)
## Ver las tablas
dbListTables(mydb)

dbListFields(mydb, "heroes_information")

## Como son esas columnas
dbColumnInfo(mydb, "heroes_information")

## dbReadTable()

hero <- dbReadTable(mydb, "heroes_information")
head(hero)

hero <- dbGetQuery(mydb, "SELECT * FROM heroes_information;")
head(hero)

## Correr Query
Query <- "SELECT * FROM heroes_information;"
hero <- dbGetQuery(mydb, Query)
head(hero)


## dbSendQuery() y dbFetch()

Query <- dbSendQuery(mydb, "SELECT * FROM heroes_information;")
hero <- dbFetch(Query, n=10)
hero

## Info de lo que va a hacer el query
dbGetInfo(Query)

## Cuantas filas va a retornar mi query
dbGetRowCount(Query)

x <- 1:10
y<- letters[1:10]
test<- data.frame(x,y, stringsAsFactors = FALSE)
dbWriteTable(mydb, "test_Rodolfo_20160315",test, row.names= FALSE)


## Sobreescribir una tabla
x <- sample(100, 10)
y<- letters[11:20]
test2 <- data.frame(x, y, stringsAsFactors = FALSE)
dbWriteTable(mydb, "test_Rodolfo_20160315", test2, overwrite=TRUE, row.names=FALSE)


mi_tabla<- "test_Rodolfo_20160315"
#append
x <- sample(100, 10)
y<- letters[11:20]
test3 <- data.frame(x, y, stringsAsFactors = FALSE)
dbWriteTable(mydb, mi_tabla, test, test3, append=TRUE, row.names=FALSE)

dbReadTable(mydb, mi_tabla)

dbGetRowCount(dbReadTable(mydb, mi_tabla))
