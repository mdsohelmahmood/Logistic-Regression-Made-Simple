library(readxl)
library(rcompanion)
library(ordinal)
library(foreign)
data <- read_excel("D:/Logistic Regression/UCI data/Adult dataset/adult-v2.xlsx", sheet = "label encoded data v1")
data



data$Income_greater_than_50k_code <- factor(data$Income_greater_than_50k_code, ordered=TRUE)
data$Education_code <- as.numeric(data$Education_code)
data$Bachelors <- as.numeric(data$Bachelors)
data$Education_yrs <- as.numeric(data$Education_yrs)

model_clm1 <- clm(Income_greater_than_50k_code ~ Education_code, data = data) 
summary(model_clm1)

model_clm2 <- clm(Income_greater_than_50k_code ~ Bachelors, data = data) 
summary(model_clm2)

model_clm3 <- clm(Income_greater_than_50k_code ~ Education_yrs, data = data) 
summary(model_clm3)

nagelkerke(model_clm1)
AIC(model_clm1)
BIC(model_clm1)

nagelkerke(model_clm2)
AIC(model_clm2)
BIC(model_clm2)

nagelkerke(model_clm3)
AIC(model_clm3)
BIC(model_clm3)



library(ggeffects)

ggpredict(model_clm1, terms = "Education_code[5,10,13]")
ggpredict(model_clm2, terms = "Bachelors")
ggpredict(model_clm3, terms = "Education_yrs[5,10,16]")


