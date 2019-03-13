# Random Forests
#http://rpubs.com/Jeffery/titanic

#import data from online site
path = 'https://raw.githubusercontent.com/thomaspernet/data_csv_r/master/data/titanic_csv.csv'
titanic <- read.csv(path)
head(titanic)
names(titanic)
str(titanic)
