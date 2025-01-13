setwd('~/Desktop/STA 536/Final Project')

# Libraries
library(ggplot2)
library(readxl)
library(dplyr)
library(car)

# Loading in data
data1 <- read_excel("randomized_data_1.xlsx")
data2 <- read_excel("randomized_data_2.xlsx")
data3 <- read_excel("randomized_data_3.xlsx")
data4 <- read_excel("randomized_data_4.xlsx")

data <- rbind(data1, data2, data3, data4)

# Data cleaning
data$Replicate <- rep(seq(1, 4), each = 9)
data$Duration = as.factor(data$Duration)
data$Intensity = as.factor(data$Intensity)
data$TRT = as.factor(data$TRT)
data$Replicate = as.factor(data$Replicate)

# ANOVA
lm_model <- lm(data$`Cal. Burned` ~ Duration + Intensity + TRT + Replicate, data = data)
anova(lm_model)

# Analyzing residuals
residuals <- residuals(lm_model)

## Normality
qqplot <- qqnorm(residuals)
qq_plot <- qqline(residuals)

hist(residuals, main = "Histogram of Residuals")

shapiro.test(residuals)

## Common variance
# Scatter plot of residuals vs. fitted values
ggplot(data, aes(x = TRT, y = residuals)) + 
  geom_point(color = 'blue') + 
  labs(title = 'Scatter Plot of Residuals by Treatment Level')

leveneTest(residuals ~ TRT, data = data)

## No interaction
fitted_values <- fitted(lm_model)

resid_vs_fitted <- plot(fitted_values, residuals, 
                        xlab = "Fitted Values", 
                        ylab = "Residuals",
                        main = "Residuals vs Fitted Values")

# Add a horizontal line at y = 0 for reference
abline(h = 0, col = "red", lty = 2)

# Post-Hoc multiple comparison
TukeyHSD(aov(lm_model), 'TRT')




