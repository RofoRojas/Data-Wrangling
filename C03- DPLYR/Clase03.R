library(tidyverse)
library(readr)
players_score <- read.csv(file = "football-world-cup-2018-dataset/Players_Score.csv")
head(players_score)



players_score$cambio<-str_extract_all(players_score$Apps, "\\([^)]*\\)","")
players_score$cambio<-str_extract_all(players_score$cambio,"[0-9]+")
players_score$Apps<-str_replace_all(players_score$Apps, "\\([^)]*\\)","")



numbers <- c("age", "Apps", "cambio", "Goals", "Assists", "Yel", "Red", "SpG", "PS", "AerialsWon", "Rating")
players_score[numbers] <- lapply(players_score[numbers],as.numeric)
head(players_score) %>% View()

players_score[numbers] <- players_score[numbers] %>%
  replace_na(list(age=0, Goals=0, Assists=0, Yel=0, Red=0, SpG=0, PS=0, AerialsWon=0,MotM=0, cambio=0))

## Filter
filter(players_score, club=="Real Madrid", age<30)
filter(players_score, club %in% c("Real Madrid","Barcelona", age<30)
       
players_score %>%
  filter(club=="Real Madrid")

## Selecionamos las columnas y despues filtramos
filter(select(players_score, club, age), club=="Real Madrid")


## Ahora Con Pipe
players_score%>%
  select(club,age) %>%
  filter(club== "Real Madrid")

players_score %>%
  mutate(Goal_Race= Mins/Goals) %>%
  arrange(desc(Goal_Race))


players_score %>%
  filter(Goals>0) %>%
  mutate(Goal_Rate = Mins/Goals)%>%
  arrange(desc(Goal_Rate)) %>%
  distinct()


##Equipo Goleador
players_score %>%
  select(club, Goals) %>%
  group_by(club) %>%
  summarise(team_goals= sum(Goals)) %>%
  arrange(desc(team_goals))
       
       
       
       