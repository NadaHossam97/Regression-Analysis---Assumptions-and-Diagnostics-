# Regression Analysis of Macroeconomic Indicators and Probability of Default
**Overview**

This project conducts a regression analysis to explore the relationship between macroeconomic indicators and the probability of default (PD). It aims to model how variations in economic factors influence the likelihood of default events, providing insights into the economic determinants of credit risk.

**Goals**

 - Develop a predictive model to understand the impact of macroeconomic variables on the probability of default.

- Assess the significance and contribution of each macroeconomic indicator to the model.

- Validate the model's assumptions and evaluate its predictive performance.

**Dataset**

The analysis utilizes a dataset comprising macroeconomic indicators and corresponding probability of default (PD) data across a specified time period. The dataset is sourced from a bank's retail portfolio.

### Methodology

1.  **Model Building**:
    
    -   Employ linear regression (`lm()`) to construct a baseline model (`full.model`).
    -   Utilize stepwise model selection (`stepAIC()`) to refine the initial model based on AIC criteria, enhancing model fit.
2.  **Diagnostic Analysis**:
    
    -   Calculate Variance Inflation Factors (VIF) to detect multicollinearity among macroeconomic predictors.
    -   Conduct tests for model assumptions:
        -   Test for homoscedasticity (`ncvTest()`).
        -   Assess heteroscedasticity (`bptest()`, `skedastic::white_lm()`).
        -   Examine autocorrelation of residuals (`acf()`, `dwtest()`, `bgtest()`).
        -   Evaluate normality of residuals (`ols_plot_resid_qq()`, `ols_plot_resid_hist()`, `ols_test_normality()`).
3.  **Interpretation and Visualization**:
    
    -   Interpret regression coefficients and their significance (`summary(step.model)`).
    -   Visualize correlations between variables (`corrplot()`), VIF values (`barplot()`), and diagnostic plots (`plot()`, `hist()`) to aid in understanding model assumptions and performance.

### Expected Outcomes

-   Identification of significant macroeconomic indicators influencing the probability of default.
-   Insights into the magnitude and direction of the relationship between each economic factor and credit risk.
-   Validation of model assumptions and assessment of model reliability for predicting default probabilities.

### Conclusion

This project aims to provide actionable insights into how macroeconomic conditions impact the likelihood of default events, offering valuable information for risk management, financial policy decisions, and further research in credit risk assessment.
