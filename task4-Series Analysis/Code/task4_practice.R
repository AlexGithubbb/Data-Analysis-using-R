getwd()
setwd("/Users/Alexpower/Desktop")
getwd()
kings <- scan("https://robjhyndman.com/tsdldata/misc/kings.dat", skip = 3)
kingstimeseries <- ts(kings, frequency = 4, start = c(1986,4))
kingstimeseries
plot.ts(kingstimeseries)

births<- scan("https://robjhyndman.com/tsdldata/data/nybirths.dat")
birthtimeseries <- ts(births, frequency = 12, start = c(1987,1))
birthtimeseries
plot.ts(birthtimeseries)
logbirthtimeseries <- log(birthtimeseries)
plot.ts(logbirthtimeseries)

souvenir <- scan("https://robjhyndman.com/tsdldata/data/fancy.dat")
souvenirtimeseries <- ts(souvenir, frequency = 12, start = c(1987,1))
souvenirtimeseries
plot.ts(souvenirtimeseries)
logsouvenirtimeseries <- log(souvenirtimeseries)
plot.ts(logsouvenirtimeseries)

# TTR package
install.packages("TTR")
library("TTR")
#SMA() function to smooth the time series data
kings <- scan("https://robjhyndman.com/tsdldata/misc/kings.dat", skip = 3)
kings1 <- ts(kings, frequency = 4, start = c(1845,1))
plot.ts(kings1)
kingsSMA3 <- SMA(kings, n=8)
plot.ts(kingsSMA3)
# Decomposing Seasonal Data
# Decomposing Seasonal Data
births<- scan("https://robjhyndman.com/tsdldata/data/nybirths.dat")
births <- ts(births, frequency = 12, start = c(1946,1))
birthsComp <- decompose(births)
plot(birthsComp)

# Seasonally Adjusting
births<- scan("https://robjhyndman.com/tsdldata/data/nybirths.dat")
births <- ts(births, frequency = 12, start = c(1946,1))
birthsComp <- decompose(births)
birthsSeasonAdj <- births - birthsComp$seasonal
plot(birthsSeasonAdj)

# HoltWinters() funtion for simple exponential smoothing
rain <- ts(scan("https://robjhyndman.com/tsdldata/hurst/precip1.dat", skip = 1), start = c(1813))
plot.ts(rain)
rainF <- HoltWinters(rain, beta = FALSE, gamma = FALSE)
rainF
plot(rainF)
