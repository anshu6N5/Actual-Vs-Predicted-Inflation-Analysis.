# Actual-Vs-Predicted-Inflation-Analysis.
This project analyzes how money supply and interest rates influence CPI inflation across countries using a Linear Mixed Model.
It uses panel data from the World Bank (WDI) and accounts for country-specific inflation baselines using random intercepts.

🔍 Objective
To model CPI inflation across multiple countries and understand the macroeconomic effects of:

🏦 Broad Money Supply

💰 Interest Rates

...while accounting for differences in country-level baseline inflation.

📦 Tools & Packages Used
R (language)

tidyverse (data manipulation and visualization)

WDI (World Bank Data API)

lme4 (Linear Mixed Model)

performance (R² calculation)

ggplot2 (data visualization)

📁 Data Source
Data was pulled using the WDI package with the following indicators:

Indicator	Description
FP.CPI.TOTL.ZG	CPI Inflation (annual %)
FM.LBL.BMNY.ZG	Broad Money Supply (% annual growth)
FR.INR.LEND	Lending Interest Rate (%)

🧪 Model Specification
r
Copy
Edit
model <- lmer(inflation ~ money_supply + interest_rate + (1 | country), data = data)
Fixed Effects: money_supply, interest_rate

Random Effect: Intercept by country (to capture baseline inflation differences)

📊 Results
Marginal R² (fixed effects only): 0.483 → 48.3% of inflation variation explained

Conditional R² (fixed + random effects): 0.517 → 51.7% total variation explained

🔎 Insight: Money supply and interest rates are significant drivers of inflation, and country-level inflation baselines help capture additional variation.

📈 Visualizations
📌 Actual vs Predicted Inflation

📌 Random Intercepts by Country

📌 Residual Analysis (Optional)

<!-- Update path if needed -->

✅ Key Learnings
How to build and interpret a Linear Mixed Model

Use of random intercepts for panel data

Accessing and cleaning macroeconomic data from the World Bank

Visualizing and interpreting model performance

🙋‍♂️ Author
Anshu Kumar
Based in Delhi(India) 
https://github.com/anshu6N5 
https://www.linkedin.com/in/anshu-kumar-04240b225/ 
