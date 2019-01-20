#webminar 3 -  Jan 2019
#Data Creation, Summarisation and Visualisation
library(dplyr)
library(ggplot2)

#Data Creation
#create a Data Frame

(productID = paste('P', 100:119, sep=''))
month.abb[1:12]
(months = month.abb[1:12])
#create a structure - each product & every month
df = expand.grid(productID, months)
names(df)
head(df)
names(df) = c('productID', 'month')
head(df); nrow(df)
#check how many rows created for each product
table(df$productID); table(df$month)
#20 products, 12 months
#create column of values for sales figures
df$sales = round(rnorm(20 * 12 , mean=60, sd=15),0)
df

#summarise - productwise, monthwise - min, max, average, sd, sum
str(df)  #see the structure 

#base functions
aggregate(sales ~ productID, data=df, FUN=sum )
#user defined functions
myfunction <- function(x){cbind( sum(x),   mean(x), max(x), min(x))}
aggregate(sales ~ productID, data=df, FUN=myfunction )

#using package - dplyr
library(dplyr)

df %>% group_by(productID) %>% summarise(n=n(), mean(sales))
df %>% group_by(productID) %>% summarise(meanSales = mean(sales), maxSales= max(sales), minSales= min(sales))

df %>% group_by(productID) %>% summarise_if(is.numeric, c(Mean= mean, Min= min, Max= max, SD= sd))
#monthwise
df %>% group_by(month) %>% summarise_if(is.numeric, c(Mean= mean, Min= min, Max= max, SD= sd))

#how many months sales was more than mean for each product
totalMean = mean(df$sales)
df %>% filter(sales >= totalMean) 
df %>% filter(sales >= totalMean) %>% group_by(productID) %>% tally()


#other dplyr functions
#select

#sample

#mutate




#how many times, sales > mean sales of their own product
#productwise mean, compare, count
library(purrr)
library(tidyr)
#advanced techniques

#graphs

boxplot(sales ~ productID, data=df)
boxplot(sales ~ month, data=df)

df %>% group_by(productID) %>% summarise(meanSales = mean(sales)) -> group1
barplot(c(102,30,40))
group1
barplot(group1$meanSales)


#ggplot

ggplot(group1, aes(x=productID, y=meanSales, fill=productID)) + geom_bar(stat='identity')

ggplot(df, aes(x=productID, y=sales)) + geom_boxplot()

ggplot(df) +  geom_bar(aes(productID, sales, fill = productID), position = "dodge", stat = "summary", fun.y = "mean")

ggplot(df) +  geom_bar(aes(month, sales, fill = month), position = "dodge", stat = "summary", fun.y = "mean")

ggplot(df) +  geom_bar(aes(month, sales, fill = month), position = "dodge", stat = "summary", fun.y = c("min"))

                       