# Sample Size Calculation for Final Project
setwd('~/Desktop/STA 536/Final Project')

library(pwr)

k = 3 # treatment levels
alpha = 0.1 #standard
pw = 0.80 # standard power

# Need to calculate std. dev from pilot data
data <- data.frame(values = c(132, 96, 218, 98, 353, 132, 96, 96, 133, 218, 396, 355,
          280, 172, 260, 319, 181))
sd <- sd(data$values)
sigma = sd/sqrt(nrow(data))

# Need to come up with a estimate for D (tolerance)
d = 50 # 35 extra calories burned for a treatment compared to another is what we determine is significant

# Calculating sample size
pwr.anova.test(k=k, f=d*sqrt(1/(2*k*(sigma^2))), power=pw, sig.level = alpha)

plot(pwr.anova.test(k=k, f=d*sqrt(1/(2*k*(sigma^2))), power=pw, sig.level = alpha), main = 'OC Power Curve',
     xlim = 25, ylim = 100)


