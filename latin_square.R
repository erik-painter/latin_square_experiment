setwd('~/Desktop/STA 536/Final Project')

# Libraries
library(randomizr)

# Creating data frame & Latin Square
intensity_level<- c('Low', 'Medium', 'High',
                    'Low', 'Medium', 'High',
                    'Low', 'Medium', 'High')
cardio_duration <- c(rep('10', 3), rep('20', 3), rep('30', 3))
workout_type <- c('A', 'B', 'C',
                'B', 'C', 'A',
                'C', 'A', 'B')

data <- data.frame(Intesity = intensity_level, 
                   Duration = cardio_duration, 
                   Workout = workout_type)
data

latin_square <- matrix(data$Workout, nrow = 3, ncol = 3, byrow = TRUE) # Latin Square
latin_square

# Randomizing Rows & Columns of Latin Square
# Row numbers and their associated random numbers

row_numbers <- c(1, 2, 3)
row_random_numbers <- runif(length(row_numbers), min = 0, max = 1)

# Column numbers and their associated random numbers
col_numbers <- c(1, 2, 3)
col_random_numbers <- runif(length(col_numbers), min = 0, max = 1)

# Combine row and column random numbers into data frames
row_data <- data.frame(row_numbers, row_random_numbers)
col_data <- data.frame(col_numbers, col_random_numbers)

# Sort rows and columns based on random numbers in descending order
sorted_rows <- row_data[order(-row_data$row_random_numbers), "row_numbers"]
sorted_cols <- col_data[order(-col_data$col_random_numbers), "col_numbers"]

# Reorder the Latin square rows and columns based on sorted row and column numbers
latin_square_reordered <- latin_square[sorted_rows, sorted_cols]

# Print the reordered Latin square
print(latin_square_reordered) # Latin Square used in design

# I must now assign treatments randomly to our letters in the Latin Square
trt_numbers <- c("A", "B", "C")
trt_random_numbers <- runif(length(trt_numbers), min = 0, max = 1)

# Combine row and column random numbers into data frames
trt_data <- data.frame(trt_numbers, trt_random_numbers)

#### THE LATIN SQUARE IS RANDOMIZED!
