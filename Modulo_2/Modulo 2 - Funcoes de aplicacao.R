#apply(): Aplicavel em matriz e dataframe

?apply

x <- seq(1:9)
matriz <- matrix(x, ncol=3)
matriz

resultado <- apply(matriz, 1, sum) #Linha (1) / Coluna (2)
resultado

resultado2 <- apply(matriz, 2, sum)
resultado2

#lapply(): Aplicavel em vetor e lista

?lapply

numero.p <- c(2, 4, 6, 8, 10, 12) #Criando vetor
numero.i <- c(1, 3, 5, 7, 9, 11) #Criando vetor

numeros <- list(numero.p, numero.i)
numeros

lapply(numeros, mean)


#sapply(): Aplicavel em vetor e lista. Apresenta os dados de outra maneira

?sapply
sapply(numeros, mean)
