#Transformando dados

#Carregando o pacote de transformacao/manipulacao de dados
library(tidyr)
library(dplyr)

#Quantidade de vendas por ano e produto
dfDate <- data.frame(Produto = c('A', 'B', 'C'),
                     A.2015 = c(10, 12, 20),
                     A.2016 = c(20, 25, 35),
                     A.2017 = c(15, 20, 30)
                     )
head(dfDate)

#Gather: Pertence ao tidyr: Transformar colunas em linhas
dfDate2 <- gather(dfDate, "Ano", "Quantidade", 2:4)
head(dfDate2)

#Separate: Pertence ao dyplr: Separa um texto com base numa condicao
dfDate3 <- separate(dfDate2, Ano, c("A", "Ano"))

dfDate3 <- dfDate3[-2] #Excluindo coluna velha
dfDate3

#Acrescentando a coluna Mes
dfDate3$Mes <- c('01', '02', '03')
dfDate3

#Unite: Pertence ao tidyr: Jutar os dados de diferentes colunas
dfDate4 <- dfDate3 %>%
  unite(Data, Mes, Ano, sep='/')
head(dfDate4)
