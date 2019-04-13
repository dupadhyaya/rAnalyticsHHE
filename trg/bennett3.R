#Bennett3

#import from csv-----
write.csv(mtcars, 'cardata.csv')
read1 = read.csv('cardata.csv')
head(read1)
read2 = read.csv(file=file.choose())
head(read2)

#import from google sheet----
#install.packages('gsheet')
library(gsheet)

readgg = "https://docs.google.com/spreadsheets/d/1QogGSuEab5SZyZIw1Q8h-0yrBNs1Z_eEBJG7oRESW5k/edit#gid=107865534"

read3 = as.data.frame(gsheet2tbl(readgg))
head(read3)
#linear regression----


#logistic regression----


#decision tree-----
