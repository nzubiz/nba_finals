install.packages("tidyverse")
library(tidyverse)

champs <- read_csv( file="./data/raw_data/championsdata.csv")
runners <- read_csv(file= "../../data/raw_data/runnerupsdata.csv")

colnames(champs)
colnames(runners)

unique(champs$Team)
unique(runners$Team)

champs <- champs %>% 
  mutate(Team = ifelse(Team=="Warriorrs", "Warriors", Team)) %>%
  mutate(Team = ifelse(Team=="'Heat'", "Heat", Team))

runners <- runners %>% 
  mutate(Team = ifelse(Team=="Warriorrs", "Warriors", Team)) %>%
  mutate(Team = ifelse(Team=="'Heat'", "Heat", Team))

class(runners$Win)
class(champs$Home)

champs <- champs %>%
  mutate(Win = factor(Win)) %>%
  mutate(Home = factor(Home))

runners <- runners %>%
  mutate(Win = factor(Win)) %>%
  mutate(Home = factor(Home))

class(runners$Home)

champs_test <- champs %>% 
str_replace(Team, "rrs$", "rs")

##Bind dataframes
allteams <- bind_rows("Champions" = champs, "Runner" = runners, 
                      .id='rank')
head(allteams)


