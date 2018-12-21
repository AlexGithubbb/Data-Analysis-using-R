#Task4 Exercise 5 
amznF <- HoltWinters(amzn_ts, gamma = F)
amznF
plot(amznF)
# for the further prediction
# method1:
amznFC <- forecast:::forecast.HoltWinters(amznF, h = 20)
plot(amznFC)

# method2: forecast from HoltWinters 
amznFC <- forecast(amznF, h = 20)
plot(amznFC)

# method3: ARIMA
amznF <- auto.arima(amzn_ts)
amznF
amznFC <- forecast(amznF)
plot(amznFC)

