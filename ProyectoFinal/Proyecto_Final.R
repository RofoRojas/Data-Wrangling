library(readxl)
library(dplyr)
library(lubridate)
library(stringr)
library(tidyverse)

# rm(list = ls())

archivos <- list.files("Data")
for (nombre in archivos) {
  temp_df <- read_excel(path =  paste("Data", nombre, sep = "/"), skip = 9) %>% select(-X__1)
  temp_df <- temp_df %>% filter(complete.cases(temp_df))
  
  pre<- ifelse(str_detect(nombre, "municipal"), "m_", "d_") 
  nombre <- str_remove(nombre, "(_municipal|_departamental)\\.xlsx$")
  nombre <- paste(pre,nombre, sep = "")
  assign(nombre, temp_df)
}

rm(nombre, pre, archivos, temp_df)


h<-d_tecnologia %>% gather(key= "Uso de Celular", value ="Cantidad_Cel", 4:6) %>% gather(key= "Uso de Computadora", value ="Cantidad_Compu", 7:9) %>% 
  gather(key= "Uso de Internet", value ="Cantidad_Inter", 10:12)


colnames(d_tecnologia[c("No Declarado", "No Declarado__1", "No Declarado__2")]) <- c("NA_Cel", "NA_Computadora", "NA_Internet")

h <- d_tecnologia %>% gather(key= c("Uso de Tecnlogia"), 
                             value= c("Cantidad de Personas"), 4:6, 7:9, 10:12)



