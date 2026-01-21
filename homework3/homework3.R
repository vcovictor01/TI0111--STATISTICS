#bibliotecas usadas
install.packages("ggplot2")
library(ggplot2)

#importando dados
amostra <- c(0.99, 2.31, 10.85, 6.15, 10.81, 3.72, 5.75, 4.15, 9.27, 7.84)
n <- length(amostra)

#lambda estimado (estimador de maxima verossimilhança)
lEstimado <- n / sum(amostra)
lEstimado #[1] 0.1617076

#função densidade da distribuição exponencial
dexp(amostra, rate = lEstimado)

#esperança da distribuição exponencial
esperanca <- 1 / lEstimado
esperanca #[1] 6.184

#probabilidade maior que 5:
p5 <- exp(-lEstimado * 5)
p5 #[1] 0.4455089


#=====================================FUNCOES DE VEROSSIMILHANÇA:
#VEROSSIMILHANÇA
verossimilhanca <- function(lambda, x) {
  lambda^length(x) * exp(-lambda * sum(x))
}

#LOG-VEROSSIMILHANCA
logVerossimilhanca <- function(lambda, x) {
  n <- length(x)
  n * log(lambda) - lambda * sum(x)
}

#==================================GRAFICO VEROSSIMILHANÇA:
#criamos o intervalo em que serão plotados os dados para o gŕafico da logV:
intervalo <- seq(0.001, 3 * lEstimado, length.out = 1000)

#aplicamos log em todos valores
dadosLog <- sapply(intervalo, logVerossimilhanca, x = amostra)


#plot do gráfico
plot(intervalo, dadosLog, type = "l",
     xlab = expression(lambda),
     ylab = "log-verossimilhança",
     main = "Função Log-Verossimilhança")

abline(v = lEstimado, col = "red", lwd = 2)
text(lEstimado, max(dadosLog),
     labels = expression(hat(lambda)),
     pos = 4, col = "red")