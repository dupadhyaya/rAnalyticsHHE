# import and export csv 

head(mtcars)

write.csv(mtcars, 'mtcars.csv', row.names=F)


dhiraj = read.csv('mtcars.csv')
head(dhiraj)

dhiraj2 = read.csv(file.choose())
head(dhiraj2)

dhiraj3 = read.csv('https://raw.githubusercontent.com/dupadhyaya/online/master/mtcars.csv')
head(dhiraj3)




library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907"
sales3 = as.data.frame(gsheet2tbl(url))
head(sales3)


