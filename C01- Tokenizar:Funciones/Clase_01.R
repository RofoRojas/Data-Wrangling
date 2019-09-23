library(readr)
library(tidyverse)
library(dplyr)

#install.packages("tidytext")

text_file <- 'data/quijote.txt'

readLines(text_file, n=10, encoding = "UTF-8", skipNul = TRUE)

## Usando Readr

quijote_lines <- read_lines(text_file)
quijote_lines

# Performance de Funciones

system.time(readLines(text_file, n=10, encoding = "UTF-8", skipNul = TRUE))
system.time(read_lines())

## Obtener partes de un string

substr(quijote_lines, 1, 10)

### Tokenizar
require(tidytext)

quijote_frame <- data_frame(txt=quijote_lines)
head(quijote_frame)
quijote_words <- unnest_tokens(quijote_frame, input = txt, output = words, token = "words")
head(quijote_words)

## A Contar
quijote_count <- count(quijote_words, words, sort = TRUE)
class(quijote_count)

## Quitar o ignorar palabras inutiles (Stopwords)
#install.packages("quanteda")
library(quanteda)

spanish_stopwords <- data_frame(words= quanteda::stopwords(language = 'es'))
#View(spanish_stopwords)

quijote_words_clean <- anti_join(quijote_words, spanish_stopwords)

quijote_clean_count <- count(quijote_words_clean, words, sort = TRUE)
quijote_clean_count



## Functions
find_sample <- function(x){
  for_index <- sample(1:nrow(x), size = 3, replace = FALSE)
  new_df <- x[for_index,]
  return(new_df)
}

data<- data.frame(a=1:10, b=sample(c("GT", "US","CA"), size = 10, replace = TRUE))
find_sample(data)


generate_df <- function(x){
  df<- data.frame(a=sample(letters, size = 10, replace=TRUE), b= sample(1:10, size = 10, replace=TRUE))
  return(df)
}

result_list <- list()
system.time(for(i in 1:100000){
  result_list[[i]] <- generate_df(1)
})

system.time(
  lapply(1:100000, generate_df)
)

#### Cargar EXCEL
library(readxl)
library(openxlsx)

hour <- read.csv("data/hour.csv")
bancos_activos <- read_excel("data/bancos.xlsx", sheet = 2)
head(bancos_activos)
bancos_activos_2 <- readWorkbook("data/bancos.xlsx", sheet = 2)
head(bancos_activos_2)









