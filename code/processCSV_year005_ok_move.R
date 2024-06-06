# Load necessary library
library(stringr)

# Define source and destination directories
source_directory <- "process_getCSV/"
destination_directory <- "process_getCSV_year/"

# Ensure the destination directory exists, create if it doesn't
if (!dir.exists(destination_directory)) {
  dir.create(destination_directory)
}

# List all files in the source directory that contain 'Hitting_Stats' in their names
hitting_stats_files <- list.files(source_directory, pattern = "Hitting_Stats\\.csv$", full.names = TRUE)

# Copy each file to the destination directory
file.copy(hitting_stats_files, destination_directory)

# Optional: print the files to confirm they have been copied
list.files(destination_directory)
