library(ggplot2) #Biblioteca para os gráficos

#------------------------ AGE
age <- c(28, 34, 46, 26, 37, 29, 51, 31,
         39, 43, 58, 44, 25, 23, 52, 42, 48, 33, 38, 46)
#vetor de idades
age_ord <- sort(age)
age_ord
#ordenando o vetor

ageMean <- mean(age) #cálculo da média pelo R - 38.65
ageMedian <- median(age) #cálculo da mediana pelo R - 38.5 
ageSD <- sd(age) #cálculo do desvio padrão pelo R - 9.9275
ageMean; ageMedian; ageSD 

#------------------------ DESIRED INCOME
dI <- c(2.3, 1.6, 1.2, 0.9, 2.1, 1.6, 1.8, 1.4, 1.2, 2.8, 3.4, 2.7, 1.6, 1.2, 1.1, 2.5, 2.0, 1.7, 2.1, 3.2)
dIord <- sort(dI)
dIord
#vetor ordenado de pretensão salarial

dImean <- mean(dI) #cálculo da média pelo R - 1.92
dImedian <- median(dI) #cálculo da mediana pelo R - 1.75
dIsd <- sd(dI)  #cálculo do desvio padrão pelo R - 0.7134792
dImean; dImedian; dIsd

#------------------------ YEARS OF EXPERIENCE
expY <- c(2, 8, 21, 1, 15, 3, 28, 5, 13, 20, 32, 23, 1, 0, 29, 18, 19, 7, 12, 23)
expYord <- sort(expY)
expYord

expYmean <- mean(expY) #cálculo da média pelo R - 14
expYmedian <- median(expY)  #cálculo da mediana pelo R - 14
expYsd <- sd(expY)  #cálculo do desvio padrão pelo R - 10.27004
expYmean; expYmedian; expYsd

#------------------------ NATIONALITY
nationality <- c("Italiana", "Inglesa", "Belga", "Espanhola", "Italiana", 
                 "Espanhola", "Francesa", "Belga", "Italiana", "Italiana", 
                 "Italiana", "Inglesa", "Francesa", "Espanhola", "Italiana",   
                 "Alemã", "Francesa", "Italiana", "Alemã", "Italiana")
nationalityOrd <- sort(nationality)
nationalityOrd
#vetor de nacionalidade


#------------------------ DATA FRAME SET
df <- data.frame(age, nationality, dI, expY)
df
#criando um data set (data.frame) com os dados fornecidos

#------------------------ SCATTERPLOT
png("/home/victor/github/TI0111--STATISTICS/homework1/DIyear.png", width = 800, height = 600)
ggplot(data = df, aes(x = expY, y = dI)) +
  geom_point(alpha = 0.6) +
  labs(
    title = "Desired Income per Years of Experience",
    x = "Experience",
    y = "Desired Income"
  ) +
  theme_minimal()
dev.off()
#plotando e salvando o scatterplot de pretensão salarial por anos de experiência



#------------------------ BOX PLOTS
png("/home/victor/github/TI0111--STATISTICS/homework1/diNationality.png", width = 800, height = 600)
ggplot(df, aes(x=as.factor(nationality), y=dI)) + 
    geom_boxplot(fill="slateblue", alpha=0.2) + 
    ylab("Desired Income") +
    xlab("") +
    ggtitle("Desired Income per Nationality")
dev.off()
getwd()
#plotando e salvando o boxplot de pretensão salarial por nacionalidade

png("/home/victor/github/TI0111--STATISTICS/homework1/ageNationality.png", width = 800, height = 600)
ggplot(df, aes(x=as.factor(nationality), y=age)) + 
    geom_boxplot(fill="slateblue", alpha=0.2) + 
    ylab("Age") +
    xlab("") +
    ggtitle("Age per Nationality")
dev.off()
#plotando e salvando o boxplot de idade por nacionalidade
