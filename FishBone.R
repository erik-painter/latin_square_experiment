#install.packages('SixSigma')
library(SixSigma)

# Fish-bone Diagram
effect <- 'Caloric Expenditure'
causes.gr = c('Cardio Type', 'Duration', 'Intensity Level', 'Location', 'Machine', 'Time of Day', 'Subject', 
              'Measurement')
causes <- vector(mode = 'list', length = length(causes.gr))
causes[1] <- list(c('Walk Uphill', 'Elliptical', 'Stat. Bike'))
causes[2] <- list(c('10 min', '20 min', '30 min'))
causes[3] <- list(c('Low', 'Medium', 'High'))
causes[4] <- list(c('Gym 1', 'Gym 2'))
causes[5] <- list(c('Brand A', 'Brand B', 'Brand C'))
causes[6] <- list(c('AM', 'PM'))
causes[7] <- list(c('Subject 1', 'Subject 2'))
causes[8] <- list(c('Apple Watch', 'Fitbit', 'Machine'))

ss.ceDiag(effect, causes.gr, causes, sub = 'Factors affecting Caloric Expenditure')