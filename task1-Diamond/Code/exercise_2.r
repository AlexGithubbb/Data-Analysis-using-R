#Exercise 2: Answer the following question by adding R 
#statements that prints the answers for these questions:
#1.mean value of the prices is $3932.8
price.mean<- mean(diamonds$price,trim = 0 ,na.rm= TRUE)
print(price.mean)
#2.how many diamonds with price<= $500 is 1749
sum(diamonds$price <= 500)
#3.price>= $10000 is 5223
sum(diamonds$price >= 10000)
