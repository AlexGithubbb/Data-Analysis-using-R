install.packages(c("tidyverse","lucr"))
library(tidyverse)
library(lucr)
rawfile <- "/Users/Alexpower/Desktop/R/task3/salesData.txt"

sales <- read.delim("salesData.txt", 
                      stringsAsFactor = FALSE)
sales <- read.delim(rawfile, header = TRUE, col.names = c("sale"))
#length(sales$sale)
#tail(sales,16)
#head(sales,10)
#head(sales,20) %>% mutate(haha = sales > 500)
#summary(sales)
#class(sales)
#mode(sales)

# tidy GBP part (by using: from_currency) and convert the British Pound to USD by multiplying 1.34, which is the currency rate between GBP and USD
GBPpart <- sales$sale[c(1:100)]
GBPpart
salesNewGBP <-  round(from_currency(GBPpart, decimal_delim = ".") * 1.34,2)
salesNewGBP
# tidy USD part (by using: from_currency)
USDpart <- sales$sale[c(101:200)]
USDpart
salesNewUSD <- round(from_currency(USDpart, decimal_delim = ".")/100,2)
salesNewUSD
# combine two currencies(only digits)
wholeSales <- c(salesNewGBP, salesNewUSD)
wholeSales
#max(wholeSales)
#min(wholeSales)
# use: to_currency, to transform the value from digits to currency value
wholeSalesNew <- to_currency(wholeSales, currency_symbol = "$", symbol_first = TRUE,
            group_size = 4, group_delim = ",", decimal_size = 2,
            decimal_delim = ".")
wholeSalesNew
#greater1000 <- wholeSales > 1000 %>% filter("TRUE")
#greater1000
#wholeSales %>% mutate(">1000", ifelse(wholeSales > 1000, "Yes", "No"))
#wholeSalesNew %>% 
#  mutate(ifelse(wholeSales > 1000))
#sales %>% filter(sales == "191,13$" )
#head(sales,10)

#rawfile1 <- "/Users/Alexpower/Desktop/dates_for_wrangling.csv"
#dates <- read.csv("/Users/Alexpower/Desktop/dates_for_wrangling.csv", TRUE, ",")
#dates <- read.csv(rawfile1, header = FALSE, col.names = c("date"))
#length(dates$date)
#fixed <- mutate(dates, yyyymmdd = ymd(date), mmddyyyy = mdy(date), 
#                ddmmyyyy = dmy(date)) %>% unite("fixedup", yyyymmdd, ddmmyyyy, mmddyyyy
#                                                , sep = "")
#fixed$fixedup <- gsub("NA","", fixed$fixedup)
#fixed
#fixed_md_dm <- fixed %>% mutate(fixedup, month = month(fixedup), day = day(fixedup), to_be_reviewed = day(fixedup) <= 12 & month(fixedup) <= 12)
#fixed_md_dm