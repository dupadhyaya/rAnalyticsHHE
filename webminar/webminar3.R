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
head(df)
nrow(df)
#check how many rows created for each product
table(df$productID)
table(df$month)
#20 products, 12 months
#create column of values for sales figures
set.seed(1234)
df$sales = round(rnorm(20 * 12 , mean=60, sd=15),0)
df
write.csv(df,'./data/salesdata.csv')
#write.csv(df,'salesdata.csv')  #use this if do not have data folder inside ur project

#reshape data
library(reshape2)  #install this library
#install.packages('reshape2')
?dcast
head(df)
df2 = dcast(df, formula = productID ~ month)
head(df2)
df2
write.csv(df2,'./data/salesdatamonth.csv')
#store in the different folder if you want

#summarise - productwise, monthwise - min, max, average, sd, sum
str(df)  #see the structure 

#base functions----
#sum of sales for each product
rep1 <- aggregate(formula = sales ~ productID, data=df, FUN=sum )
rep1
#user defined functions
myfunction <- function(x){cbind( sum(x), round(mean(x),0), max(x), min(x))}
rep2 <- aggregate(sales ~ productID, data=df, FUN=myfunction) 
rep2
write.csv(rep2, './data/rep2.csv')

#using package - dplyr
library(dplyr) #install this before loading
#rep4-----
df %>% group_by(productID) %>% summarise(n=n(), mean(sales))
df %>% group_by(productID) %>% summarise(meanSales = mean(sales), maxSales= max(sales), minSales= min(sales), sdSales = sd(sales)) -> rep4
rep4
write.csv(rep4, './data/rep4.csv')
df %>% group_by(month) %>% summarise_each(funs(min, max), sales)


#rep4b-----
df$cat = sample(c('C1','C2','C3'), size=240, replace=T)
df$sales2 = round(rnorm(240, mean=70,sd=10))
head(df)
df %>% group_by(productID) %>% summarise_if(is.numeric, c(Mean= mean, Min= min, Max= max, SD= sd)) %>% print(width=Inf)

#rep5 -----
#monthwise
rep5 <- df %>% group_by(month) %>% summarise_if(is.numeric, c(Mean= mean, Min= min, Max= max, SD= sd))
rep5
head(df)
df %>% group_by(month) %>% summarise_at(c('sales2'), c(Mean= mean, Min= min, Max= max, SD= sd))

write.csv(rep5, './data/rep5.csv')



#how many months sales was more than mean sales
(totalMean = mean(df$sales))
df %>% filter(sales >= totalMean) 
df %>% filter(sales >= totalMean) %>% group_by(productID) %>% tally()
df %>% filter(productID == 'P104' & sales>= totalMean) %>% summarise(n=n())
df %>% filter(month=='Jan' & sales > 50 & cat == 'C2') %>% tally()
df %>% filter(month=='Jan')  %>% group_by(cat) 
df %>% arrange(desc(month)) %>% group_by('cat')
df %>% arrange(cat)
df %>% group_by(cat) %>% arrange(cat) %>% top_n(2, sales)
df %>% group_by(month, cat) %>% arrange(month,cat) %>% top_n(1, sales)
#split DF wrt to column values 

head(df)
#other dplyr functions
#select
df
#sample
set.seed(123); sample_n(df,2)
set.seed(1234) ; sample_frac(df, .01)

#mutate
df %>% mutate(newsales = sales * 1.10, newsales2 = sales * 1.2)  %>% head



#how many times, sales > mean sales of their own product
#productwise mean, compare, count
library(purrr)
library(tidyr)
#advanced techniques

#graphs
boxplot(df2$Jan)
quantile(df2$Jan)
fivenum(df2$Jan)
boxplot(df2$Jan)
abline(h=fivenum(df2$Jan))
head(df)
boxplot(sales ~ productID, data=df)
boxplot(sales ~ month, data=df)

df %>% filter(month=='Dec') %>% arrange(sales)

df %>% group_by(productID) %>% summarise(meanSales = mean(sales)) -> group1
barplot(c(102,30,40))
group1
barplot(group1$meanSales, horiz = T)
#not a very good way
pie(group1$meanSales)

#ggplot
#barplot - means sales of each product in the year
library(ggplot2) #install it first
ggplot(group1, aes(x=productID, y=meanSales, fill=productID)) + geom_bar(stat='identity') + geom_hline(aes(yintercept=mean(df$sales)))

#boxplot to see the distribution/ changes over the months for each product
ggplot(df, aes(x=productID, y=sales)) + geom_boxplot()
#dots outside whiskers - outliers / extreme values
ggplot(df, aes(x=month, y=sales)) + geom_boxplot()
#dots outside whiskers - outliers / extreme values

#another way to draw plot of mean sales
ggplot(df) +  geom_bar(aes(productID, sales, fill = productID), position = "dodge", stat = "summary", fun.y = "mean")

#monthwise mean sales
ggplot(df) +  geom_bar(aes(month, sales, fill = month), position = "dodge", stat = "summary", fun.y = "mean") 

#monthwise min sales
ggplot(df) +  geom_bar(aes(month, sales, fill = month), position = "dodge", stat = "summary", fun.y = c("min"))

                       
#import / export csv
read1 = read.csv('./data/rep2.csv')
head(read1)

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


#
#create a data frame 
#rnorm 
#reshape - long to wide to long
#aggregate with user defined function
#dplyr - groupby, summarise, tally, summariseif, at
#mean, min, max, sd
#read/write to csv, read from google sheet
#boxplot, fivenum, barplot, pie
#ggplot - barplot, boxplot

#split

out = split(df , df$cat)
out
out$C1
sapply( out , function(x) mean( x$sales ) )
df %>% group_by(cat) %>% summarise(mean(sales))

unsplit(out, df$cat)

out2 = split.data.frame(df, df$month)
out2$Jan
sapply(out2, function(x) mean( x$sales ))
sapply(out2, mean )

#suggestion
#dplyr, timeseries, regression, correlation
