library(rvest)
library(dplyr)

# Function to fetch and save all tables from a given player URL and name
fetch_player_stats <- function(name, url) {
  webpage <- read_html(url)
  
  # Fetch all tables
  tables <- webpage %>%
    html_nodes("table") %>%
    html_table()
  
  # Check the number of tables and save them
  if (length(tables) > 0) {
   # for (i in 1:min(length(tables), 10)) {  # Limit to at most 10 tables for safety
      
    for (i in 6:8) {  # Focus only on tables 6, 7, and 8
      df <- as.data.frame(tables[[i]])
      # Use the provided name for the file name
      file_name <- sprintf("%s_Stats_Table_%d.csv", (name), i)
      write.csv(df, file_name, row.names = FALSE)
      print(paste("Data saved to", file_name))
    }
  } else {
    print("No tables found on the page.")
  }
}




library(rvest)

# Define the URL for the home run leaders
url <- "https://www.baseball-almanac.com/yearly/top25.php?s=HR&l=NL&y=2024"

# Read the HTML content from the webpage
webpage <- read_html(url)

# Extract the table
table <- html_nodes(webpage, "table") %>% html_table(fill = TRUE)

# Extract links from the 'Name' column
links <- html_nodes(webpage, "table") %>%
  html_nodes("tr td:nth-child(2) a") %>%
  html_attr("href")


links <- gsub("\\.\\.", "", links)  # Correctly remove the '../' from the links

# Prepend the base URL to make the links absolute
links <- paste0("https://www.baseball-almanac.com", links)

# Extract names from the 'Name' column
names <- html_nodes(webpage, "table") %>%
  html_nodes("tr td:nth-child(2)") %>%
  html_text()

# Print the names and the links (for checking)
names <- names[-1]  # This drops the first entry
names <- names[-length(names)]
print(names)

print(links)
# Create a named vector where names are keys and links are values
#player_links <- setNames(links, names)

# Print the named vector for checking
#print(player_links)


# Extract the top three URLs
#top_three_urls <- player_links[1:3]
#print(top_three_urls)
#print(unname(top_three_urls))
## Extract the keys (names) for the top three URLs
#top_three_names <- names(top_three_urls)
#print(top_three_names)


## Assuming player_links is already defined and contains at least three URLs
##player_links <- c("https://www.baseball-almanac.com/players/player.php?p=ozunama01", 
#                  "https://www.baseball-almanac.com/players/player.php?p=alonspe01", 
#                  "https://www.baseball-almanac.com/players/player.php?p=gormano01")
#
#print(player_links)
print("print(player_linksplayer_linksplayer_linksplayer_links")

# Extract the top three URLs and their corresponding names
#top_three_urls <- links[1:3]
#top_three_names <- c("Marcell Ozuna", "Pete Alonso", "Nolan Gorman")  # Assume you know these names or extract similarly

# Fetch and save data for the top three players using names and URLs
mapply(fetch_player_stats, names[1:5], links[1:5])

