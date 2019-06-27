#webmin - 10 May 2019

#10 students
#Version of R, Studio, Packages - update
#how to push files from R Studio to Git Hub

women
mtcars
?women
?mtcars

class(mtcars)
head(mtcars)
tail(mtcars)
str(mtcars)
dim(mtcars)  #dimensions of dataset
?dim
names(mtcars)
row.names(mtcars)
summary(mtcars)

#what to do 
#what column is in what data scale
#nominal, ordinal, interval, ratio
head(mtcars)
table(mtcars$am)
table(mtcars$vs)

library(dplyr) #install this
mtcars %>% group_by(am) %>% tally()
mtcars %>% group_by(am) %>% count()
mtcars %>% group_by(am) %>% summarise(n=n())

table(mtcars$am, mtcars$vs)
table(mtcars$am, mtcars$vs, dnn=c('am','vs'))

mtcars %>% group_by(am,vs) %>% tally()
mtcars %>% group_by(am,vs,gear) %>% tally()

#group by am : find count and mean mileage
mtcars %>% group_by(am) %>% summarise(n=n(), mean(mpg))

#group by cyl : count and find min horsepower and max weight
#cyl   n   min(hp)  max(wt)
mtcars %>% group_by(cyl,am) %>% summarise(n=n(), MINhp=min(hp), MAXwt = max(wt), SDmpg = sd(mpg))


#list me all cars with mileage > 25
mtcars[ mtcars$mpg > 25, c(1,3,5) ]
mtcars %>% filter(mpg > 25)
#list me all cars with wt > 1.5 and/ or gear = 4
mtcars %>% filter( wt > 1.5 , gear == 4  )
mtcars %>% filter( wt > 1.5 | gear == 4  )

#how to select few columns
table(mtcars$cyl, mtcars$gear)
mtcars %>% filter( cyl == 4 & gear == 4 ) %>% select(mpg, cyl, gear)
mtcars %>% filter( cyl == 4 & gear == 4 ) %>% select(-c(mpg, cyl, gear))

mtcars %>% filter( cyl == 6 & gear == 4 ) %>% select(mpg, wt, am, cyl, gear) %>% arrange(mpg)

mtcars %>% arrange(mpg, desc(hp))

#random selection of rows
mtcars %>% sample_n(2)
mtcars %>% sample_frac(.2)



hist(mtcars$mpg, col=1:6)
