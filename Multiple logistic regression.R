library(ordinal)
library(readxl)
library(rcompanion)
data <- read_excel("D:/Logistic Regression/GSS - glm2.xlsx")


model_glm <- glm(DEGREE1 ~ MADEG1, data = data) 
summary(model_glm)

nagelkerke(model_glm)
AIC(model_glm)
BIC(model_glm)