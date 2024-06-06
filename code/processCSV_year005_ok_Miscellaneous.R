library(readr)
library(dplyr)
library(stringr)

# Specify the directory containing the CSV files
input_directory <- "process_getCSV/"  # Update this path to where your files are located

# Function to process each file
process_file <- function(file_path) {
  # Read the CSV data
  data <- read_csv(file_path)
  
  
  # Extract the year from the "Team" column and create a new "Year" column
  data <- data %>%
    mutate(Year = if_else(str_detect(Team, "^[0-9]{4}"), as.integer(str_extract(Team, "^[0-9]{4}")), NA_integer_))
  
  
  
  
  # Extract player's name from the filename
  player_name <- str_extract(basename(file_path), "^(.*?)_Cleaned_Fielding_Stats")
  
  # Perform any operations you need here, using the player's name if necessary
  
  
  
  
  
  # For demonstration, let's just add the player's name as a new column
  data <- mutate(data, PlayerName = player_name)
  
  # Define the output filename incorporating the player's name
  output_filename <- paste(player_name, "Fielding_Stats_with_Year.csv", sep="_")
  output_file_path <- file.path("process_getCSV_year/", output_filename)  # Update the output directory path
  
  # Save the processed data
  write_csv(data, output_file_path)
  
  # Print the file path to confirm where the file is saved
  print(paste("Processed data saved to:", output_file_path))
}

# List all files in the directory that match the pattern
file_paths <- list.files(input_directory, pattern = "_Cleaned_Fielding_Stats\\.csv$", full.names = TRUE)

# Apply the function to each file
lapply(file_paths, process_file)
