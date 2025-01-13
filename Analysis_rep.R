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