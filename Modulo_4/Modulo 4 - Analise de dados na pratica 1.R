#Analise de dados na pratica

#Obtendo dados
#http://www.portaltransparencia.gov.br/download-de-dados/viagens
#Dados de 2019

#Carregando dados
viagens <- read.csv(file = "C:/Users/victo/Desktop/Estudos/Estudos R/EVG/Módulo 4/2019_Viagem.csv",
                    sep = ";",
                    dec = ","
)

#Visualizando os dados
head(viagens)
View(viagens)                      

#Dimensao do dataset
dim(viagens)

#Informacoes estatisticas do dataset
summary(viagens)
summary(viagens$Valor.passagens)

#Verificar o tipo de dados de cada coluna
library(dplyr)
glimpse(viagens)

#Convertendo um campo para o tipo data
viagens$data.inicio <- as.Date(viagens$Período...Data.de.início,
                               "%d/%m/%Y")
viagens$data.inicio

#Convertendo o formato data para possuir apenas mes e ano
viagens$data.inicio.formatada <- format(viagens$data.inicio, 
                                        "%Y-%m")
viagens$data.inicio.formatada



#Analise exploratoria dos dados

#Histograma
hist(viagens$Valor.passagens)

#Estatisticas dos dados relevantes
summary(viagens$Valor.passagens)

#Visualizando os valores em um boxplot
boxplot(viagens$Valor.passagens)

#Calculando o desvio padrao
sd(viagens$Valor.passagens)

#Verificando a existencia de dados nulos por coluna
colSums(is.na(viagens))

#Verificando as ocorrencias por coluna
str(viagens$Situação) #Qnt ocorrencia da coluna
table(viagens$Situação) #Qnt correncia de cada classe
prop.table(table(viagens$Situação))*100 #Porcentagem de ocorrencia de cada classe


# 1. Quais orgaos estao gastando mais com passagens aereas?
#Criando dataframe com os 15 que mais gastam
p1 <- viagens %>%
  group_by(Nome.do.órgão.superior) %>%
  summarise(n = sum(Valor.passagens)) %>%
  arrange(desc(n)) %>%
  top_n(15)

names(p1) <- c("orgao", "valor")
p1

#plotando
library(ggplot2)
ggplot(p1, aes(x = reorder(orgao, valor), y= valor))+
  geom_bar(stat="identity", fill = '#0ba792')+
  geom_text(aes(label=valor), vjust=0.3, size=3)+
  coord_flip()+
  labs(x='valor', y='orgao')

options(scipen=999)


# 2. Qual é o valor gasto por cidade?
#Criando dataframe com os 15 que mais gastam
p2 <- viagens %>%
  group_by(Destinos) %>%
  summarise(n = sum(Valor.passagens)) %>%
  arrange(desc(n)) %>%
  top_n(15)

names(p2) <- c("destino", "valor")

#plotando
ggplot(p2, aes(x = reorder(destino, valor), y= valor))+
  geom_bar(stat="identity", fill = '#0ba792')+
  geom_text(aes(label=valor), vjust=0.3, size=3)+
  coord_flip()+
  labs(x='valor', y='orgao')

options(scipen=999)


# 3. Qual é a quantidade de viagens por mês?
p3 <- viagens %>%
  group_by(data.inicio.formatada)%>%
  summarise(qtd = n_distinct(Identificador.do.processo.de.viagem))
head(p3)

#plotando
ggplot(p3, aes(x = data.inicio.formatada, y = qtd, group=1))+
  geom_line()+
  geom_point()

#Relatorios RMarkdown Instalar:
install.packages("rmarkdown")
install.packages('tinytex')
tinytex::install_tinytex()