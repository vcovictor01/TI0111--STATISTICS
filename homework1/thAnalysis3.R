#Biblioteca Usada
library(ggplot2)

#Importando os dados do arquivo .csv
dados <- read.csv("/home/victor/Área de Trabalho/victor/TI0111_HW1_assignment/TI0111_HW1_assignment/HW1_bike_sharing.csv")

#Measures of central tendency: Temperature
mean(dados$temp) #[1] 20.31122
median(dados$temp) #[1] 20.4
quantile(dados$temp) # 2.4; 13.8; 20.4; 26.9; 35.3   

#Measures of central tendecy: Casual Users
mean(dados$casual) #848.176
median(dados$casual) #713
quantile(dados$casual) # 2.0;  315.5;  713.0; 1096.0; 3410.0 

#Measures of central tendecy: Registered Users
mean(dados$registered) #3656.172
median(dados$registered) #3662
quantile(dados$registered) #20.0; 2497.0; 3662.0; 4776.5; 6946.0;

#Criando o vetor com base no cálculo de número total de usuários
totalUsers <- (dados$casual+dados$registered)

#Criando o vetor com base no cálculo de temperatura normalizada
temperature <- (dados$temp*41)

#Definindo as datas dos registros
dteday <- as.Date(dados$dteday)

#Estabelecendo um data frame com os vetores criados
df <- data.frame(totalUsers, temperature, dteday, season, weather)

#Criando os levéis para o dado: Season
season <- factor(dados$season,
                  levels = c(1, 2, 3, 4),
                  labels = c("Spring", "Summer", "Autumn", "Winter"))

#Criando o barplot de registros de season, isto é, os registros para diferentes estações
png("/home/victor/github/TI0111--STATISTICS/homework1/season.png", width = 800, height = 600)
ggplot(df, aes(x = season, y = totalUsers)) +
  geom_bar(stat = "summary", fun = "mean", fill = "#8e87eb") +
  labs(title = "Users per Season",
       x = "Seasons",
       y = "Total Users") +
  theme_minimal()
dev.off()       
getwd()

#Criando os levéis para o dado: weathersit
weather <- factor(dados$weathersit,
                  levels = c(1, 2, 3, 4),
                  labels = c("Clear Skies", "Cloudy", "Light Rain", "Heavy Rain"))

#Criando o barplot de registros de weather, isto é, os registros para diferentes climas
png("/home/victor/github/TI0111--STATISTICS/homework1/weather.png", width = 800, height = 600)
ggplot(df, aes(x = weather, y = totalUsers)) +
  geom_bar(stat = "summary", fun = "mean", fill = "skyblue") +
  labs(title = "Users per Weather",
       x = "Weather",
       y = "Média de Usuários") +
  theme_minimal()
dev.off()
getwd()

#Plotando o número de usuários totais no tempo
png("/home/victor/github/TI0111--STATISTICS/homework1/totalUsers.png", width = 800, height = 600)
ggplot(df, aes(x=dteday, y=totalUsers)) + 
        geom_line(color = "steelblue") +
        labs(title = "Evolução de Usuários", x = "Data", y = "Total de Usuários") +
        theme_minimal()
dev.off()
getwd()

#Plotando a temperatura no tempo
png("/home/victor/github/TI0111--STATISTICS/homework1/temp.png", width = 800, height = 600)
ggplot(df, aes(x=dteday, y=temperature)) + 
        geom_line(color = "steelblue") +
        labs(title = "Evolução da Temperatura", x = "Data", y = "Temperatura") +
        theme_minimal()
dev.off()
getwd()

