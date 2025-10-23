library(ggplot2)

#------------------------ AGE
age <- c(28, 34, 46, 26, 37, 29, 51, 31,
         39, 43, 58, 44, 25, 23, 52, 42, 48, 33, 38, 46)
age_ord <- sort(age)
age_ord

ageMean <- mean(age)
ageMedian <- median(age)
ageSD <- sd(age)
ageMean; ageMedian; ageSD


#------------------------ DESIRED INCOME
dI <- c(2.3, 1.6, 1.2, 0.9, 2.1, 1.6, 1.8, 1.4, 1.2, 2.8, 3.4, 2.7, 1.6, 1.2, 1.1, 2.5, 2.0, 1.7, 2.1, 3.2)
dIord <- sort(dI)
dIord

dImean <- mean(dI)
dImedian <- median(dI)
dIsd <- sd(dI)
dImean; dImedian; dIsd

#------------------------ YEARS OF EXPERIENCE
expY <- c(2, 8, 21, 1, 15, 3, 28, 5, 13, 20, 32, 23, 1, 0, 29, 18, 19, 7, 12, 23)
expYord <- sort(expY)
expYord

expYmean <- mean(expY)
expYmedian <- median(expY)
expYsd <- sd(expY)
expYmean; expYmedian; expYsd

#------------------------ NATIONALITY
nationality <- c("Italiana", "Inglesa", "Belga", "Espanhola", "Italiana", 
                 "Espanhola", "Francesa", "Belga", "Italiana", "Italiana", 
                 "Italiana", "Inglesa", "Francesa", "Espanhola", "Italiana",   
                 "Alemã", "Francesa", "Italiana", "Alemã", "Italiana")
nationalityOrd <- sort(nationality)
nationalityOrd


#------------------------ DATA FRAME SET
df <- data.frame(age, nationality, dI, expY)
df

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

#------------------------ BOX PLOTS
png("/home/victor/github/TI0111--STATISTICS/homework1/diNationality.png", width = 800, height = 600)
ggplot(df, aes(x=as.factor(nationality), y=dI)) + 
    geom_boxplot(fill="slateblue", alpha=0.2) + 
    ylab("Desired Income") +
    xlab("")
    ggtitle("Desired Income per Nationality")
dev.off()
getwd()

png("/home/victor/github/TI0111--STATISTICS/homework1/ageNationality.png", width = 800, height = 600)
ggplot(df, aes(x=as.factor(nationality), y=age)) + 
    geom_boxplot(fill="slateblue", alpha=0.2) + 
    ylab("Age") +
    xlab("")
    ggtitle("Age per Nationality")
dev.off()