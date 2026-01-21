install.packages("ggplot2")
library(ggplot2)

#--------------------------------------------QUESTÃO 1
#parametros para a distribuição binomial da primeira questão
#sabemos que a análise se restringe à 50 clientes com probabilidade 70%

n1 <- 50
p1 <- 0.7
r1 <- 0:50 #range

pmf1 <- dbinom(r1, n1, p1)
cdf1 <- pbinom(r1, n1, p1)

#organizando os dados
d1 <- data.frame(r1, pmf1, cdf1)
head(d1)

#analise teórica
esperanca1 <- n1 * p1
variancia1 <- n1 * p1 * (1 - p1)
desvioPadrao1 <- sqrt(variancia1)

esperanca1
variancia1
desvioPadrao1

#plot dos gŕaficos
#PMF
ggplot(d1, aes(x = r1, y = pmf1)) +
  geom_segment(aes(xend = r1, y = 0, yend = pmf1)) +
  labs(
    title = "PMF"
  ) +
  theme_minimal()

#CDF
ggplot(d1, aes(x = r1, y = cdf1)) +
  geom_step() +
  geom_point() +
  labs(
    title = "CDF"
  ) +
  theme_minimal()