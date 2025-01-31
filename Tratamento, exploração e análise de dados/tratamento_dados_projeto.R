# realizando o tratamento dos dados antes de iniciar análise

if(!require(dplyr)) install.packages('dplyr')
library(dplyr)

covid_sp <- read.csv('dados_covid_sp.csv', sep = ";")
View(covid_sp)

# renomeando variáveis (colunas)

df_covid_sp <- rename(covid_sp, municipio = nome_munic,
                      data = datahora)
View(df_covid_sp)
 
# excluindo colunas

df_covid_sp$codigo_ibge <- NULL

# excluindo linhas

df_covid_sp <- slice(df_covid_sp, -c(880491:880498))

# excluindo várias linhas por nome

df_covid_sp <- df_covid_sp %>% filter(municipio!="Ignorado")
View(df_covid_sp)

# verificando valores ausentes

sapply(df_covid_sp, function(x) sum(is.na(x)))
sapply(df_covid_sp, function(x) sum(is.nan(x)))

# verificando e modificando a tipagem de atributos

glimpse(df_covid_sp)

df_covid_sp$data <- as.Date(df_covid_sp$data, format ='%Y-%m-%d')
glimpse(df_covid_sp)

# exportação de arquivos

write.table(df_covid_sp, file = "covid_sp_tratado.csv", sep = ",")
