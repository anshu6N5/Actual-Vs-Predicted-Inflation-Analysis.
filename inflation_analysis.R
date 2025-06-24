install.packages("MASS")
# loading of necessary libraries 
library(tidyverse)
library(readr)
library(janitor)
library(ggplot2)
library(WDI)
library(nlme)
library(lmerTest)
library(performance)

# Modeling The CPI using  LLME test
#search the indicators for the project.
WDIsearch("Inflation")
WDIsearch("Interest Rate") %>% head(20)
WDIsearch("Money Supply") %>% head(20)

# cast all the data in a code 
data <- WDI(country = "all", indicator = c("FP.CPI.TOTL.ZG", "FR.INR.LEND", "FM.LBL.BMNY.ZG"), start = 2000, end = 2022)
view(data)


#cleaning of data 
data <- data %>% 
  clean_names() %>% 
  rename(
    inflation = fp_cpi_totl_zg,
    interest_rate = fr_inr_lend,
    broad_money_supply = fm_lbl_bmny_zg
  ) %>% 
  drop_na(inflation, interest_rate, broad_money_supply)
names(data)

# Running of my model 
model <- lmer(inflation~broad_money_supply+interest_rate+(1|country), data = data)
summary(model)

#predicted vs actual 
data$predicted <- predict(model)

#showing on the graph 
ggplot(data, aes(x = predicted, y = inflation)) + 
  geom_point(alpha = 0.6, color = "black") + 
  geom_abline(slope = 1, color = "darkgreen", intercept = 0) + 
  geom_smooth(method = "lm", se = FALSE, color = "red") + 
  labs(
    title = "Actual VS Predicted Inflation",
    x = "Predicted_Inflation (%)",
    y = "Inflation_Rate(%)"
  ) + 
  theme_minimal()

r2(model)  
