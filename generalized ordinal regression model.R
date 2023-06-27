library(readxl)
library(ordinal)
library(VGAM)
library(rcompanion)

data <- read_excel("D:/Logistic Regression/GSS 2016 data/gss_data_for_generalized_model.xlsx")
data

# Generalized model

model1 <- vglm(health ~ educ + gender + marital + wrkfull , family = cumulative(parallel = FALSE, reverse = TRUE), data = data)
summary(model1)

nagelkerke(model1)
AIC(model1)
BIC(model1)

exp(coef(model1, matrix = TRUE))



model2 <- vglm(health ~ educ + gender + marital + faminc , family = cumulative(parallel = FALSE, reverse = TRUE), data = data)
summary(model2)

nagelkerke(model2)
AIC(model2)
BIC(model2)

exp(coef(model2, matrix = TRUE))


lrtest(model1,model2)



# PPO model

# Identify which variables are violating PO assumption

data$health <- factor(data$health, ordered=TRUE)
model1 <- clm(health ~ educ + gender + marital + faminc, data = data)
nominal_test(model1)


model2 <- vglm(health ~ educ + gender + marital + faminc , family = cumulative(parallel = FALSE ~ marital + faminc , reverse = FALSE), data = data)
summary(model2)

exp(coef(model2, matrix = TRUE))


nagelkerke(model1)
AIC(model1)
BIC(model1)

nagelkerke(model2)
AIC(model2)
BIC(model2)








