#Join

#Criando os dataframes
df1 <- data.frame(Produto = c(1,2,3,5), Preco = c(15, 10, 25, 20))
head(df1)

df2 <- data.frame(Produto = c(1,2,3,4), Nome = c("A", "B", "C", "D"))
head(df2)

#Carregando o pacote de manipulacao de dados
library(dplyr)

#Fazendo as juncoes dos dados
df3 <- left_join(df1, df2, "Produto") #Dados da coluna da esquerda mantidos
head(df3)

df4 <- right_join(df1, df2, "Produto") #Dados da coluna da direita mantidos
head(df4)

#Percebe-se que contem NA apos as juncoes. Isso se da pois nao foi encontrado
#correspondente ao fazer a juncao


#innerjoin: Une os valores que aparecem nas duas tabelas
df5 <- inner_join(df1, df2, "Produto")
head(df5)
