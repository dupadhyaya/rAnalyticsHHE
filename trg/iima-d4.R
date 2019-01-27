#iima - Day4

#missing values

x = c(1,3, NA)
is.na(x)
sum(is.na(x))

library(VIM)
data(sleep)
summary(sleep)
#analyse the data for missing values



#logistic regression------
#binary classification
set.seed(1234)
(price = sort(runif(100, min=20, max=100)))
(buy = factor(rep(c('Buy','NotBuy'), times=c(55,45))))
purchase = data.frame(price, buy)
head(purchase)
purchase
plot(x=price, y=buy, data=purchase)
str(purchase)
#log regression
log_fit = glm(buy ~ price, data=purchase, family='binomial') 
summary(log_fit)

(ndata1= data.frame(price=c(30,50,70,90,98)))
p1=predict(log_fit, newdata=ndata1, type='response')
p1
options(scipen=999)
cbind(ndata1, p1)
cbind(ndata1, p1, BUY=ifelse(p1 > .5,'No','Yes'))

#decision trees

