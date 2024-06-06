# Load the necessary libraries
library(readr)
library(dplyr)
library(stringr)

# Set the directory containing the CSV files
directory_path <- "getCSV/"

# List all CSV files in the directory that include "Stats_Table_7" in their name
all_files <- list.files(directory_path, pattern = "Stats_Table_7.*\\.csv", full.names = TRUE)

# Process each file found
for (file_path in all_files) {
  # Read the CSV file
  fielding_stats <- read_csv(file_path)
  
  # Define the correct column names for fielding stats
  correct_fielding_names <- c("Team", "POS", "G", "GS", "OUTS", "TC", "TC/G", "CH", "PO", "A", "E", "DP", "PB", "CASB", "CACS", "FLD%", "RF")
  
  # Assign the correct names to the dataframe
  names(fielding_stats) <- correct_fielding_names
  
  # Optionally, remove the first two rows if they are not necessary
  fielding_stats <- fielding_stats[-c(1, 2), ]
  
  # Generate a new filename for the cleaned data
  new_file_name <- str_replace(basename(file_path), "Stats_Table_7", "Cleaned_Fielding_Stats")
  
  # Save the cleaned data to a new CSV file in a specific folder
  write_csv(fielding_stats, paste0(directory_path, "process_getCSV/", new_file_name))
}

# Output the names of processed files for verification
print(paste("Processed files:", all_files))
