#IIM Kpv -5th Day

#Review
#R, RStudio, Git
#R Env
#Data Structures
(v1 = c(77,4,5,6,8,4,11,15,7,32,55,23)) ; length(v1)
(m1 = matrix(v1, ncol=4))
m1[,2:3]
(df1 = data.frame(product=c('Maggi','Top Ramen','Cadbury'), sales=c(100,120,68), type=c('T1','T1','T2')))
head(df1)
df1$type = factor(df1$type)
#list and array as HW
#dplyr package
library(dplyr)
df1 %>% group_by(type) %>% summarise(mean(sales))
#import & export data
df1
write.csv(df1,'mydata.csv', row.names = F)
mydf = read.csv('mydata.csv')
mydf1 = read.csv(file.choose())
head(mydf)
head(mydf1)


mydf = read.csv('mydata.csv', header=F, skip=2)
head(mydf)
is.na(mydf)
sum(is.na(mydf))
?read.csv
str(mydf)
#sunder
