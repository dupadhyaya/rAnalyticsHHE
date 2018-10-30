#IIM Kpv -5th Day

#Review
#R, RStudio, Git
#R Env
#Data Structures
(v1 = c(77,4,5,6,8,4,11,15,7,32,55,23)) ; length(v1)
(m1 = matrix(v1, ncol=4))
(df1 = data.frame(product=c('Maggi','Top Ramen','Cadbury'), sales=c(100,150,68), type=c('T1','T1','T2')))
df1$type = factor(df1$type)
#list and array as HW
#dplyr package
library(dplyr)
df1 %>% group_by(type) %>% summarise(sum(sales))
#import & export data