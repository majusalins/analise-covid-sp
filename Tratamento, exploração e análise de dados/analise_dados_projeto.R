# exploração e análise dos dados após tratamento

library(dplyr)
if (!require(rstatix))
  install.packages("rstatix")
library(rstatix)

covid_sp_tratado <- read.csv('covid_sp_tratado.csv', sep = ",")
View(covid_sp_tratado)

covid_sp_tratado$data <- as.Date(covid_sp_tratado$data, format ='%Y-%m-%d')
glimpse(covid_sp_tratado)

mean(covid_sp_tratado$obitos_novos)
mean(covid_sp_tratado$casos_novos)
summarise_at(covid_sp_tratado, vars(obitos_novos, casos_novos), mean)

median(covid_sp_tratado$obitos_novos)
median(covid_sp_tratado$casos_novos)
summarise_at(covid_sp_tratado, vars(obitos_novos, casos_novos), median)

moda <- function(m){
  valor_unico <- unique(m)
  valor_unico[which.max(tabulate(match(m, valor_unico)))]
}

moda(covid_sp_tratado$obitos_novos)
moda(covid_sp_tratado$casos_novos)
summarise_at(covid_sp_tratado, vars(obitos_novos, casos_novos), moda)
