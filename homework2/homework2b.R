install.packages("ggplot2")
library(ggplot2)

#--------------------------------------------QUESTÃO 2
#parametros para a distribuição binomial da segunda questão
n <- 10000000
p <- 0.0000001

esperancaBinomial <- n * p
varianciaBinomial <- n * p * (1 - p)

#parametros para a distribuição de poisson
l <- esperancaBinomial

#valor médio considerando a distribuição de poisson
k <- 0:(10000000-1)
pois <- dpois(k, l) #valor da probabilidade para cada k poisson

poismedia <- sum((1 / (k + 1)) * pois)
poismedia #0.6321206

#simulação da binomial para vários dias
dias <- 10000

set.seed(222)
binomialmedia <- rbinom(d, n, p)

binomial <- table(binomialmedia) / dias
binomial_df <- data.frame(
  k = as.numeric(names(binomial)),
  prob = as.numeric(binomial)
)

#simulando no máximo 20 ganhadores para poupar
k <- 0:20 
pois <- dpois(k, l) #valor da probabilidade para cada k poisson
poismedia <- sum((1 / (k + 1)) * pois)

pois_df <- data.frame(
  k = k,
  prob = pois
)

#comparação gráfica
ggplot() +
  geom_col(data = emp_df,
           aes(x = k, y = prob),
           alpha = 0.6) +
  geom_point(data = pois_df,
             aes(x = k, y = prob)) +
  geom_line(data = pois_df,
            aes(x = k, y = prob)) +
  labs(
    x = "Vencedores",
    y = "Probabilidade"
  ) +
  theme_minimal()