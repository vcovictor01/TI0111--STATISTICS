install.packages("ggplot2")
library(ggplot2)

#-------------------------QUESTAO 3
mu <- 62
sigma <- 3.5

transformada <- function() {
  unif1 <- runif(1)
  unif2 <- runif(1)

  znormal1 <- sqrt(-2 * log(unif1)) * cos(2 * pi * unif2)
  znormal2 <- sqrt(-2 * log(unif1)) * sin(2 * pi * unif2)

  znormal <- c(znormal1, znormal2)

  tnormal <- (znormal * 3.5) + 62
  tnormal
}

#usando a transformada para gerar 1000 valores
tempfunction <- as.vector(replicate(500, transformada()))

#usando gerador de numeros aleatorios normal do R
set.seed(222)
tempr <- rnorm(1000, 62, 3.5)

#calculando o que se pede para a distribuição pela transformada
mean1 <- mean(tempfunction)
desvio1 <- sd(tempfunction)
tempmin1 <- min(tempfunction)
tempmax1 <- max(tempfunction)
p68e <- mean(tempfunction < 68)
p6065e <- mean(tempfunction > 60 & tempfunction < 65)
p75e <- mean(tempfunction > 75)

mean1 #61.74032
desvio1 #3.50898
tempmin1 #51.31467
tempmax1 #74.25595
p68e #0.969
p6065e #0.525
p75e #0

#calculando o que se pede para a distribuição normal
mean2 <- mean(tempr)
desvio2 <- sd(tempr)
tempmin2 <- min(tempr)
tempmax2 <- max(tempr)
p68t <- mean(tempr < 68)
p6065t <- mean(tempr > 60 & tempr < 65)
p75t <- mean(tempr > 75)

mean2 #61.94536
desvio2 #3.476375
tempmin2 #52.28937
tempmax2 #73.78673
p68t #0.957
p6065t #0.531
p75t #0

#criando os histogramas
dados <- rbind(
  data.frame(temperatura = tempfunction,     metodo = "Box-Muller"),
  data.frame(temperatura = tempr, metodo = "rnorm")
)

ggplot(dados, aes(x = temperatura)) +
  geom_histogram(aes(y = ..density..),
                 bins = 40,
                 fill = "lightblue",
                 color = "black",
                 alpha = 0.6) +
  stat_function(
    fun = dnorm,
    args = list(mean = mu, sd = sigma),
    linewidth = 1.2
  ) +
  facet_wrap(~ metodo, ncol = 1) +
  theme_minimal()
