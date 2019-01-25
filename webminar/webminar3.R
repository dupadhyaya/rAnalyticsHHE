#webminar 3 - 25 Jan 2019

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
df
names(df)
head(df)
names(df) = c('productID', 'month')
head(df); nrow(df)
#check how many rows created for each product
table(df$productID); table(df$month)
#20 products, 12 months
#create column of values for sales figures
set.seed(1234)
df$sales = round(rnorm(20 * 12 , mean=60, sd=15),0)
df
write.csv(df,'./data/salesdata.csv')
#reshape data
library(reshape2)
df2 = dcast(df, formula = productID ~ month)
write.csv(df2,'./data/salesdatamonth.csv')

#summarise - productwise, monthwise - min, max, average, sd, sum
str(df)  #see the structure 

#base functions
rep1 <- aggregate(sales ~ productID, data=df, FUN=sum )
rep1
#user defined functions
myfunction <- function(x){cbind( sum(x), round(mean(x),0), max(x), min(x))}

rep2 <- aggregate(sales ~ productID, data=df, FUN=myfunction) 
rep2
write.csv(rep2, './data/rep2.csv')

#using package - dplyr
library(dplyr)
#rep4-----
df %>% group_by(productID) %>% summarise(n=n(), mean(sales))
df %>% group_by(productID) %>% summarise(meanSales = mean(sales), maxSales= max(sales), minSales= min(sales), sdSales = sd(sales)) -> rep4
rep4
write.csv(rep4, './data/rep4.csv')


#rep4b-----
df %>% group_by(productID) %>% summarise_if(is.numeric, c(Mean= mean, Min= min, Max= max, SD= sd))

#rep5 -----
#monthwise
rep5 <- df %>% group_by(month) %>% summarise_if(is.numeric, c(Mean= mean, Min= min, Max= max, SD= sd))
rep5
write.csv(rep5, './data/rep5.csv')



#how many months sales was more than mean sales
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
#not a very good way

#ggplot
#barplot - means sales of each product in the year
ggplot(group1, aes(x=productID, y=meanSales, fill=productID)) + geom_bar(stat='identity') + geom_hline(aes(yintercept=mean(df$sales)))

#boxplot to see the distribution/ changes over the months for each product
ggplot(df, aes(x=productID, y=sales)) + geom_boxplot()
#dots outside whiskers - outliers / extreme values

#another way to draw plot of mean sales
ggplot(df) +  geom_bar(aes(productID, sales, fill = productID), position = "dodge", stat = "summary", fun.y = "mean")

#monthwise mean sales
ggplot(df) +  geom_bar(aes(month, sales, fill = month), position = "dodge", stat = "summary", fun.y = "mean") 

#monthwise min sales
ggplot(df) +  geom_bar(aes(month, sales, fill = month), position = "dodge", stat = "summary", fun.y = c("min"))

                       
#import / export csv


#import from gsheets
library(gsheet)
url1 = 'https://docs.google.com/spreadsheets/d/1tfN9I5bWaeYE25HN4U-GnRx3e1wo65QE8BzpKJ1ly04/edit#gid=926191366'
url2 = 'https://docs.google.com/spreadsheets/d/1tfN9I5bWaeYE25HN4U-GnRx3e1wo65QE8BzpKJ1ly04/edit#gid=664232613'

DFlong = as.data.frame(gsheet2tbl(url1))
head(DFlong)
DFwide = as.data.frame(gsheet2tbl(url2))
head(DFwide)

colSums(DFwide[,-1])
floor(colMeans(DFwide[,-1]))
rowSums(DFwide[,-1])
trunc(rowMeans(DFwide[,-1]))
