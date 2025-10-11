#List with the data provided
emissions <- c(15.8, 22.7, 26.8, 19.1, 18.5, 14.4, 8.3, 25.9, 26.4, 9.8, 21.9, 10.5, 17.3,
        6.2, 18.0, 22.9, 24.6, 19.4, 12.3, 15.9, 20.1, 17.0, 22.3, 27.5, 23.9, 17.5, 11.0,
        20.4, 16.2, 20.8, 20.9, 21.4, 18.0, 24.3, 11.8, 17.9, 18.7, 12.8, 15.5, 19.2, 13.9,
        28.6, 19.4, 21.6, 13.5, 24.6, 20.0, 24.1, 9.0, 17.6, 25.7, 20.1, 13.2, 23.7, 10.7,
        19.0, 14.5, 18.1, 31.8, 28.5, 22.7, 15.2, 23.0, 29.6, 11.2, 14.7, 20.5, 26.6, 13.3,
        18.1, 24.8, 26.1, 7.7, 22.5, 19.3, 19.4, 16.7, 16.9, 23.5, 18.4)

e <- emissions

#Ordered list
eSort <- sort(e)
eSort

#Calculating the mean using the R language - 19.02125
eMean <- mean(e)
eMean

#Calculating the median using the R language - 19.15
eMedian <- median(e)
eMedian

#The "unique()" function is used to select only values ​​without repetitions;
#This is useful for calculating the mode by counting the repetitions of each value
eValues <- unique(e)
eMode <- eValues[which.max(tabulate(match(e, eValues)))]
eMode
#For more information:
#https://stackoverflow.com/questions/2547402/how-to-find-the-statistical-mode

#Calculating the 1th and 3th quantiles using the R language - 15.425; 22.925
eQuantiles <- quantile(e, probs = c(0.25, 0.5, 0.75))
eQuantiles
#https://www.geeksforgeeks.org/r-language/how-to-calculate-quartiles-in-r/

#Calculating the interquartile range by the standard formula - 7.5
eIQR <- eQuantiles[3] - eQuantiles[1]
eIQR

#Calculating the data range by the standard formula - 25.6
eRange <- max(e) - min(e)
eRange

#Calculating the variance using the R language - 30.84144
eVariance <- var(e)
eVariance

#Calculating the Standard Deviation using the R language - 5.5535
eDeviation <- sd(e)
eDeviation

#Calculating the Coefficient of Variation by the standard formula - 29.196
eVariation <- (sd(e)/mean(e))*100
eVariation