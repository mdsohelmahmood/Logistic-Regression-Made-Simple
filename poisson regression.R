library(readxl)
library(ordinal)
library(VGAM)

data <- read_excel("D:/Logistic Regression/GSS 2016 data/gss_data_for_possion_regression.xlsx")
data


model1 <- glm(vissci ~ educ , family=poisson, data = data)
summary(model1)

exp(coef(model1))

nagelkerke(model1)
AIC(model1)
BIC(model1)

model2 <- glm(vissci ~ educ +  gender	+ marital	+ wrkfull + faminc, family=poisson, data = data)
summary(model2)

exp(coef(model2))

nagelkerke(model2)
AIC(model2)
BIC(model2)

library(ggeffects)
ggpredict(model1, terms = "educ[5,10,15]")
ggpredict(model2, terms = c("educ[5,10,15]", "gender[0,1]"), ci=NA)
ggpredict(model2, terms = c("educ[5,10,15]", "faminc[0,1]"))



