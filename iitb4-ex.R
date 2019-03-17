#exercise

#create a dataframe of these columns for 1000 students
#rollno, sname, gender, age, marks1, mark2, passfail
#passfail - 0 fail, 1 pass
n=1000
(rollno = 1:n)
(sname = paste('Student', 1:n, sep='_'))
(gender = sample(c('M','F'), size=n, replace=T, prob=c(.35, .65))   ) #M, F; 65% females
table(gender)
prop.table(table(gender))
(age =  trunc(runif(n, 20, 30)))    #between 20 and 30 , uniform distribution
(marks1 = round(rnorm(n, mean=65, sd=10))  ) #mean=65, sd=10 , normally distributed
(marks2 = round(rnorm(n, mean=70, sd=8),2))  # mean=70, sd=8, normally distributed
(course = sample(c('btech','mtech','phd'), size=n, replace=T, prob=c(.7, .2, .1)))
(passfail = sample(c(0,1), size=n, replace=T, prob=c(.4,.6)) )  #Pass, Fail on placement drive, 60% in pass
#give the data frame name as dataiitb 
dataiitb = data.frame(rollno, sname, gender, age, course, marks1, marks2, passfail)
head(dataiitb)
write.csv(dataiitb, './data/dataiitb.csv') #subdirectory data in current repository
#find properties of data like 
#first few and last few rows
#dimensions
#no of rows and columns
#summary
#structure
#class of data

#find gender mean of marks1 and marks2

#arrange the data in the order of marks1

#who are the top 2 students from each gender from marks of subject2

#make a barplot gender distribution

#create a linear model of predicting marks1 from age

#create a logistic model to predict passfail from marks1, marks2, gender

#create a decision tree using previous case of logistic model. Predict passfail for sample case of gender, marks1, marks2

#create a decision tree - regression model : predict age on gender, marks1, marks2
