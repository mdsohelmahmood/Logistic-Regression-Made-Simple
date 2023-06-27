library(readxl)
library(rcompanion)
library(ordinal)
library(foreign)
data <- read_excel("D:/Logistic Regression/UCI data/Adult dataset/adult-v3.xlsx")
data

data$Income_greater_than_50k_code <- factor(data$Income_greater_than_50k_code, ordered=TRUE)
data$Education_code <- as.numeric(data$Education_code)
data$Gender_code <- as.numeric(data$Gender_code)
data$Race_code <- as.numeric(data$Race_code)
data$Random_code <- as.numeric(data$Random_code)

model_clm1 <- clm(Income_greater_than_50k_code ~ Education_code + Gender_code + Race_code, data = data) 
summary(model_clm1)

model_clm2 <- clm(Income_greater_than_50k_code ~ Education_code + Random_code, data = data) 
summary(model_clm2)

nagelkerke(model_clm1)
AIC(model_clm1)
BIC(model_clm1)

nagelkerke(model_clm2)
AIC(model_clm2)
BIC(model_clm2)


library(ggeffects)
result <- ggpredict(model_clm1, terms = "Education_code[3,5,9,13]")
result


result2 <- ggpredict(model_clm1, terms = c("Education_code[3,5,9,13]", "Gender_code[1,2]"))
result2






