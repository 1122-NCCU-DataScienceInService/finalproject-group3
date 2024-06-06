# Load the necessary libraries
library(readr)
library(dplyr)
library(stringr)

# Set the directory containing the CSV files
directory_path <- "getCSV/"

# List all CSV files in the directory
all_files <- list.files(directory_path, pattern = "Stats_Table_6.*\\.csv", full.names = TRUE)

# Process each file found
for (file_path in all_files) {
  # Read the CSV file
  hitting_stats <- read_csv(file_path)
  
  # Define the correct column names
  correct_names <- c("Year", "Age", "Team", "G", "AB", "R", "H", "2B", "3B", "HR", "GRSL", "RBI", "BB", "IBB", "SO", "SH", "SF", "HBP", "GIDP", "AVG", "OBP", "SLG")
  
  # Assign the correct names to the dataframe
  names(hitting_stats) <- correct_names
  
  # Optionally, remove the first two rows if they are not necessary
  hitting_stats <- hitting_stats[-c(1, 2), ]
  
  # Generate a new filename for the cleaned data
  new_file_name <- str_replace(basename(file_path), "Stats_Table_6", "Cleaned_Hitting_Stats")
  
  # Save the cleaned data to a new CSV file in a specific folder
  write_csv(hitting_stats, paste0(directory_path, "process_getCSV/", new_file_name))
}

# Output the names of processed files for verification
print(paste("Processed files:", all_files))
