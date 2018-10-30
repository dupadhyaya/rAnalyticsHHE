# SLR Area vs Sales
#import from ggsheet
library(gsheet)
slr1 = "https://docs.google.com/spreadsheets/d/1qLHa5qFTyWacta8F-IGo6J3Zpf-BVR9OrlqONuJDqYc/edit#gid=2023826519"
df = as.data.frame(gsheet::gsheet2tbl(slr1))
head(df)
str(df)
linearmodel = lm(Y ~ X, data=df)
(new2 = data.frame(X=c(1.5,2,3,4,5)))

(p2sales= predict(linearmodel, newdata= new2))
cbind(new2, p2sales)
