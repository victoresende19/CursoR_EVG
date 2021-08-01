#Analise de dados na pratica

#Carregando dados
diabetes <- read.csv(file = "C:/Users/victo/Desktop/Estudos/Estudos R/EVG/Módulo 4/diabetes.csv")

head(diabetes)

#Preparacao dos dados
str(diabetes)
colSums(is.na(diabetes))

diabetes$Outcome <- as.factor(diabetes$Outcome) #Pois estava como tipo int

summary(diabetes$Insulin)
boxplot(diabetes$Insulin)

#Analise exploratoria
boxplot(diabetes)

hist(diabetes$Pregnancies)
hist(diabetes$Age)
hist(diabetes$BMI)

library(dplyr)
diabetes <- diabetes %>%
  filter(Insulin <= 250)
boxplot(diabetes$Insulin)

boxplot(diabetes)
summary(diabetes$Insulin)

#Construcao do modelo categorico: KNN, Naive Bayes, SVM
install.packages("caTools")
library(caTools)

#Divisao dos dados
set.seed(123)
index = sample.split(diabetes$Pregnancies, SplitRatio = .70) #Treino e teste

train = subset(diabetes, index == TRUE) 
test = subset(diabetes, index == FALSE)

dim(diabetes)
dim(train)
dim(test)

#KNN
install.packages("caret")
install.packages("e1071")
library(caret)
library(e1071)

modelo <- train(Outcome ~., data = train, method = "knn") #Variavel resp e variaveis pred
modelo$results #Acuracia para cada valor de K
modelo$bestTune #Melhor valor de K

#Testando outros valores de K
modelo2 <- train(Outcome ~., data=train, method = "knn",
                 tuneGrid = expand.grid(k = c(1:20)))
modelo2$results
modelo$bestTune

plot(modelo2)

#Naive Bayes
modelo3 <- train(Outcome ~., data = train, method = "naive_bayes")
modelo3$results
modelo3$bestTune

#SVM
modelo4 <- train(Outcome ~., data = train, method = "svmRadialSigma",
                 preProcess=c("center"))
modelo4$results
modelo4$bestTune

#Predicoes
predicoes <- predict(modelo4, test)
predicoes

#Matrix de confusao
confusionMatrix(predicoes, test$Outcome)

#Realizando predicoes
novos.dados <- data.frame(
  Pregnancies = c(3),
  Glucose = c(111.50),
  BloodPressure = c(70),
  SkinThickness = c(20),
  Insulin = c(47.49),
  BMI = c(30.80),
  DiabetesPedigreeFunction = c(0.34),
  Age = c(28)
)

previsao <- predict(modelo4, novos.dados)
resultado <- ifelse(previsao == 1, "Positivo", "Negativo")
print(paste("Resultado: ",resultado))

#Visualizacao dos resultados
write.csv(predicoes, 'resultado.csv')
#Agora basta criar um R Markdown para ficar melhor
