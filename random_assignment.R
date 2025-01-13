setwd('/Users/epainter/Desktop/STA 536/Final Project')

# Load necessary package
library(readxl)
library(writexl)

# Define a function to randomize and save the data
randomize_and_save <- function(data, output_file) {
  # Randomize the order of the rows
  randomized_data <- data[sample(nrow(data)), ]
  # Save the randomized data to Excel
  write_xlsx(randomized_data, output_file)
}

# Read the second sheet of the Excel file
data <- read_excel("layout.xlsx", sheet = 2)

# Randomize and save the data four times
for (i in 1:4) {
  output_file <- paste0("randomized_data_", i, ".xlsx")
  randomize_and_save(data, output_file)
  cat("Randomized data saved to:", output_file, "\n")
}

