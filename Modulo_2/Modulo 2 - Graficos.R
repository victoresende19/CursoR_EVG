#Graficos

carros <- mtcars[, c(1,2,9)]

#Histograma
hist(carros$mpg)

#Dispersao
plot(carros$mpg, carros$cyl)

#Utilizando ggplot2
library(ggplot2)

ggplot(carros, aes(am))+
  geom_bar()
