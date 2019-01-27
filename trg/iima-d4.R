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
(price = sort(runif(100, 20,100)))
(buy = factor(rep(c('Buy','NotBuy'), times=c(55,45))))
purchase = data.frame(price, buy)
head(purchase)
log_fit = glm(buy ~ price, data=purchase, family='binomial') 
summary(log_fit)
str(purchase)
plot(x=price, y=buy, data=purchase)
(ndata1= data.frame(price=c(30,50,70,90,98)))
p1=predict(log_fit, newdata=ndata1, type='response')
options(scipen=999)
cbind(ndata1, p1)
cbind(ndata1, p1, BUY=ifelse(p1 > .5,'No','Yes'))

#decision trees

