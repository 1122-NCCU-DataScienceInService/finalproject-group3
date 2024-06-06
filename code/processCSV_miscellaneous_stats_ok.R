# Load necessary libraries
library(readr)
library(dplyr)
library(stringr)

# Set the directory containing the CSV files
directory_path <- "getCSV/"

# List all CSV files in the directory that include "Stats_Table_8" in their name
all_files <- list.files(directory_path, pattern = "Stats_Table_8.*\\.csv", full.names = TRUE)

# Process each file found
for (file_path in all_files) {
  # Read the CSV file
  misc_stats <- read_csv(file_path)
  
  # Define the correct column names for miscellaneous stats
  correct_misc_names <- c("Team", "SB", "CS", "SB%", "PH", "PR", "DH", "AB/HR", "AB/K", "AB/RBI", "K/BB", "K/9", "BB/9")
  
  # Assign the correct names to the dataframe
  names(misc_stats) <- correct_misc_names
  
  # Optionally, remove the first two rows if they are header or unwanted data
  misc_stats <- misc_stats[-c(1, 2), ]
  
  # Generate a new filename for the cleaned data
  new_file_name <- str_replace(basename(file_path), "Stats_Table_8", "Cleaned_Miscellaneous_Stats")
  
  # Save the cleaned data to a new CSV file in a specific folder
  write_csv(misc_stats, paste0(directory_path, "process_getCSV/", new_file_name))
}

# Output the names of processed files for verification
print(paste("Processed files:", all_files))
