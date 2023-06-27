library(readxl)
library(dplyr)

data <- read_excel("D:/Logistic Regression/GSS - glm.xlsx")
data

gen = data %>% group_by(GENDER1)
summarize(gen)


summarize(gen, mean(AGE, na.rm=TRUE), max(AGE), min(AGE), sd(AGE))


gendesc = data %>% group_by(GENDER1) %>% descr(AGE)
gendesc


library(pastecs)
stat.desc(data["GENDER1"])


stat.desc(data[,c("GENDER1","DEGREE","MARITAL")])

table(data$MARITAL, data$GENDER1)

table(data$MARITAL)







table(data$MARITAL, data$DEGREE)

tab <- table(data$MARITAL, data$DEGREE)
summary(tab)

addmargins(tab)











library(sjmisc)
frq(data, GENDER1)










library(gmodels)
CrossTable(data$MARITAL, data$DEGREE)

chisq.test(data$MARITAL, data$DEGREE)
















