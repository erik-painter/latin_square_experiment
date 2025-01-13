setwd('~/Desktop/STA 536/Final Project')

# Libraries
library(ggplot2)
library(readxl)
library(dplyr)

# Loading in data
data1 <- read_excel("randomized_data_1.xlsx")
data2 <- read_excel("randomized_data_2.xlsx")
data3 <- read_excel("randomized_data_3.xlsx")
data4 <- read_excel("randomized_data_4.xlsx")

data <- rbind(data1, data2, data3, data4)

# Exploratory Data Analysis
by(data$`Cal. Burned`, data$TRT, summary)
hist(data$`Cal. Burned`, main = 'Histogram of Caloric Expenditure',
     xlab = 'Cal. Burned', ylab = 'Frequency')
boxplot(data$`Cal. Burned`, main = 'Boxplot of Caloric Expenditure',
        ylab = 'Cal. Burned')

# Box plot grouped by treatment
boxplot(data$`Cal. Burned` ~ data$TRT, data = data,
        main = "Boxplot of Caloric Expenditure by Treatment",
        xlab = "Treatment", ylab = "Caloric Expenditure")

# Histogram grouped by TRT
ggplot(data, aes(x = `Cal. Burned`, fill = TRT)) +
  geom_histogram(binwidth = 20, position = "dodge", alpha = 0.7) +
  labs(title = "Histogram of Caloric Expenditure by Treatment",
       x = "Caloric Expenditure",
       y = "Frequency") +
  theme_minimal() +
  theme(legend.position = "top")
