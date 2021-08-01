#Funcoes

par.impar <- function(num){
  if((num %% 2) == 0){
    return("Par")
  }else{
    return("Impar")
  }
}

#Usando a funcao
num = 4 
par.impar(num)
