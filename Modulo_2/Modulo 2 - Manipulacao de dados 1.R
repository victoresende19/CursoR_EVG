#Selecionando os dados

##Carregando o pacote de manipulacao de dados
library(dplyr)

?iris
head(iris)

#Obter info do dataset
glimpse(iris) #Pertence ao dplyr: Qnt. variaveis e observacoes

#Filtrar: Pertence ao dplyr: Filtra os dados de acordo com o parametro
versicolor <- filter(iris, Species == "versicolor") #Pertence ao dplyr
head(versicolor)
dim(versicolor)

#Slice: Pertence ao dplyr: Filtra um intervalo de linhas
slice(iris, 5:10) #Linha 5 ate linha 10

#Select: Pertence ao dplyr: Filtra colunas
select(iris, 2:4)
select(iris, -Sepal.Width) #Removendo a coluna

#Criando nova coluna com base em existentes
?mutate
iris2 <- mutate(iris, nova.coluna = Sepal.Length + Sepal.Width)
iris2[, c("Sepal.Length", "Sepal.Width", "nova.coluna")]

#Arrange: Pertence ao dplyr: Ordena
select(iris, Sepal.Length) %>% #Executa mais de uma operacao
  arrange(Sepal.Length)

#Group by: Pertence ao dplyr: Agrupa
iris %>% group_by(Species) %>% #Agrupando os dados
  summarise(mean(Sepal.Length)) #Calculando a media de cada dado agrupado
