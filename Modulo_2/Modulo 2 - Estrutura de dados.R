#Estrutura de dados

#Vetores: Armazena um conjunto de valores ordenados chamados de elementos. 
#Todos os elementos de um vetor devem ser do mesmo tipo.

cidade <- c("Brasilia", "Rio de Janeiro", "São Paulo")
cidade

temperatura <- c(33, 15, 28)
temperatura

#Acessando o primeiro elemento (Comeca por 1)
cidade[1]

#Acessando um intervalo de elemento (Comeca por 1)
cidade[1:3]

#Copiando um vetor
cidade1 <- cidade
cidade1

#Exceluindo o segundo elemento da consulta
cidade[-2]

#Alterando um vetor
cidade[3] <- "Florianopolis"

#Adicionando um novo elemento
cidade2[4] <- "Curitiba"
cidade2

#Deletando um vetor
cidade2 <- NULL

##################
#Fator: Armazena valores categóricos (nominal ou ordinal).

UF <- factor(c("DF", "SP", "RJ", "RS"))
UF #LEVELS = CATEGORIA

#Fatores ordenados (Ordem crescente no Levels)
grau.instrucao <- factor(c("Nivel Medio",
                           "Superior",
                           "Nivel Medio",
                           "Fundamental"),
                         levels = c("Fundamental",
                                    "Nivel Medio",
                                    "Superior"),
                         ordered = TRUE)
grau.instrucao

##################
#Listas: É um tipo especial de vetor, porém é possível adicionar elementos de 
#tipos diferentes.

pessoa <- list(sexo = "M", cidade = "Brasília", idade = 20)
pessoa

#Acessando o primeiro elemento da lista
pessoa[1]

#Acessando o valor do primeiro elemento da lista
pessoa[[1]]

#Editando a lista
pessoa[["idade"]] <- 22
pessoa

#Deletando um elemento da lista
pessoa[["idade"]] <- NULL
pessoa

#Filtrando elementos da lista
pessoa[c("cidade", "idade")]

#Listas de listas 
cidades <- list(cidade = cidade, temperatura = temperatura,
                UF = UF)
cidades

##################
#Dataframe: É utilizado para organizar elementos em linhas e colunas, 
#semelhante a uma planilha ou base de dados. Além disso, pode ser formado por 
#listas ou vetores.

#Dataframe com vetores
df <- data.frame(cidade, temperatura)
df

#Filtrando
df[1,2] #[linha, coluna]
df[,1]
df[1,]
df[c(1:3), c(1,2)]
df$cidade
df['cidade']

#Explorando o dataframe
names(df) #Nomes colunas
dim(df) #Dimensao
str(df) #descricao

##################
#Matrizes: Armazena dados tabulares semelhante ao data frame, porém só aceita 
#um tipo de dado.

m <- matrix(seq(1:9), nrow = 3)
m2 <- matrix(seq(1:25),
             ncol = 5,
             byrow = TRUE,
             dimnames = list(c(seq(1:5)),
                             c("A", "B", "C", "D", "E")
             )
)
m
m2

#Filtrando
m2[c(1:2), c("B", "C")]
