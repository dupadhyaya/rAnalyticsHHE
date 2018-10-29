#Data Structures - I

#Vectors -----
#control+enter when you are in the line to execute
# Vectors-----
x=1:10   #create seq of nos from 1 to 10
x
(x1 <- 1:20)

(x1=1:30)
(x2=c(1,2,13,4,5))
class(x2)

(x3=letters[1:10])
class(x3)
LETTERS[1:26]
(x3b = c('a',"Henry","4"))
class(x3b)

(x4=c(T,FALSE,TRUE,T,F))
class(x4)

x5=c(3L,5L)
class(x5)
x5a = c(3,5)
class(x5a)
(x5b = c(1, 'a',T, 4L))
class(x5b)

#access elements
(x6 = seq(0,100,by=3))
methods(class='numeric')
?seq
#[1]  0  2  4  6  8 10
ls()  #variables in my environment
x6
length(x6)
x6[20]
x6[3]  # access 3rd element
#[1] 4
x6[c(2, 4)]     # access 2nd and 4th element
x6[-1]          # access all but 1st element
x6[-c(1:10, 15:20)]
x6[c(2, -4)]    # cannot mix positive and negative integers
#Error in x[c(2, -4)] : only 0's may be mixed with negative subscripts
x6[-c(1,5,20)]

#sort 
sort(x6)
sort(x6[-c(1,2)])
sort(x6, decreasing=T)
rev(x6)

seq(-3, 10, by=.2)
x6[-c(1:12)]

x = x[1:4]; x      # truncate x to first 4 elements
#[1] 5 0 5 0



#Matrices
(x=100:111)
(m1 = matrix(100:111, nrow=4))
(m2 = matrix(x, ncol=3, byrow=T))
matrix(x, ncol=6)
class(m1)
attributes(m1)
dim(m1)
m1

# access elements of matrix
m1[1,2:3]
m1[c(1,3),]
m1[,-c(1,3)]
#find values as per conditions
m2[m2 > 105 & m2 < 110]


#Data Frame & Factor
#create Vectors to be combined into DF
(rollno = 1:30)
(sname = paste('student',1:30,sep=''))
(gender = sample(c('M','F'), size=30, replace=T, prob=c(.7,.3)))
(marks1 = floor(rnorm(30,mean= 50,sd=10)))
(marks2 = ceiling(rnorm(30,40,5)))
(course = sample(c('BBA','MBA'), size=30, replace=T, prob=c(.5,.5)))
(grades = sample(c(LETTERS[1:5]), size=30, replace=T))
rollno; sname; gender ; marks1 ; marks2; course; grades

#create DF
df1= data.frame(rollno, sname, gender, marks1, marks2, course, grades, stringsAsFactors = F)
str(df1) #structure of DF
head(df1) #top 6 rows
head(df1,n=3) #top 3 rows
tail(df1) #last 6 rows
class(df1) # DF
summary(df1) #summary

#convert few columns to Factor(Categories)
df1$gender = factor(df1$gender)
df1$course = factor(df1$course)
df1$grades = factor(df1$grades, ordered=T, levels=c('E','D','C','B','A'))
#now see the summary
str(df1)
summary(df1)


df1  #full data
df1$gender  # one column
head(df1); tail(df1)
df1[1:3 , c(2,4)] #multiple columns

#as per conditionis
df1[ marks1 > 50 & gender=='F', c('rollno', 'sname','gender', 'marks1')]
df1[ marks1 > 50 & gender=='F', c(1,2)]
df1[ marks1 > 50 | gender=='F', ]

names(df1)  # names of columns
dim(df1)  #Dimensions

aggregate(df1$marks, by=list(df1$gender), FUN=max)
aggregate(marks1 ~ gender, data=df1, FUN=max)
aggregate(cbind(marks1, marks2) ~ gender + course, data=df1, FUN=mean)


