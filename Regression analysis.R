# Load libraries
library(readxl)
library(MASS)
library(caTools)
library(car)
library(quantmod)
library(MASS)
library(corrplot)
library(lmtest)
library(zoo)
library(skedastic)
library(olsrr)

# Load data and build the regression model
indicators <- read_excel(".\\Macro-indicators.xlsx")

full_model <- lm(PD ~ GDP + C + R + TRADE + CA + FDI, data = indicators)

# Perform stepwise model selection
step_model <- stepAIC(full_model, direction = "both", trace = FALSE)
summary(step_model)

# Calculate Variance Inflation Factors (VIF)
var = cor(indicators)  # nolint
var_inv <- ginv(var)
vif(step_model)
vif_values <-  vif(step_model)
corrplot(cor(indicators), method = "number")
barplot(vif_values, main = "VIF Values", horiz = TRUE, col = "steelblue")
abline(v = 5, lwd = 3, lty = 2)

# Test for non-constant variance (homoscedasticity)
ncvTest(step_model)

# Diagnostic plots and tests
par(mfrow = c(2, 2))
plot(step_model)
bptest(step_model)
skedastic::white_lm(step_model)
barplot(vif_values, main = "VIF Values", horiz = TRUE, col = "steelblue")
abline(v = 5, lwd = 3, lty = 2)

#Test For Autocorrelation
acf(step_model$residuals, type = "correlation")
dwtest(step_model)
bgtest(step_model, order=3)   #breusch-godfrey test for serial correlation of order up to 3 

# Test for normality of residuals
ols_plot_resid_qq(step_model)
hist(step_model$residuals, main = "Residual Histogram")
ols_plot_resid_hist(step_model)
ols_test_normality(step_model)