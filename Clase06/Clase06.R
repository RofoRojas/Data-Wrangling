library(stringr)
library(dplyr)



# str_extract() Saca la regex que es pattern  
# str_locate() Coloca la palabra y donde se encuentra
# str_locate_all() Busca en todo
# str_detect() 

str_extract(
  string = c("Nov", "Nov.", "november", "Noviembre", "Noventa", "ANOVA"),
  pattern = "^[nN][oO][vV](\\.|ember|iembre)?$"
)

str_locate(
  string = c("Nov", "Nov.", "november", "Noviembre", "Noventa", "ANOVA"),
  pattern = "^[nN][oO][vV](\\.|ember|iembre)?$"
)

index <-str_detect(
  string = c("Nov", "Nov.", "november", "Noviembre", "Noventa", "ANOVA"),
  pattern = "^[nN][oO][vV](\\.|ember|iembre)?$"
)


df<- data.frame(
  mes = c("Nov", "Nov.", "november", "Noviembre", "Noventa", "ANOVA"),
  anio =c(1,2,3,4,5,6),
  stringsAsFactors = FALSE
)

df[index, ] %>% 
  mutate(mes= "Noviembre")

## year with or without century, of this century

str_detect(
  string = c("2019", "19", "2015", "10", "08", "96", "69", "1975", "2022"),
  pattern = 
  # pattern = "^(20)?[0-1]\\d$"
)
