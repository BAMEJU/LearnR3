library(here)
library(fs)
library(tidyverse)
source(here("R/functions.R"))

## code to prepare `mmash` dataset goes here

usethis::use_data(mmash, overwrite = TRUE)


# Download
mmash_link <- "https://physionet.org/static/published-projects/mmash/multilevel-monitoring-of-activity-and-sleep-in-healthy-people-1.0.0.zip"

# download.file(mmash_link, destfile = here("data-raw/mmash-data.zip"))

# Remove previous `mmash/` folder to have clean update
dir_delete(here("data-raw/mmash/"))

# Unzip files
unzip(here("data-raw/mmash-data.zip"),
  exdir = here("data-raw"),
  junkpaths = TRUE
)

Sys.sleep(1)
unzip(here("data-raw/MMASH.zip"),
  exdir = here("data-raw")
)

# Remove/Tidy up left over files
library(fs)
file_delete(here(c(
  "data-raw/MMASH.zip",
  "data-raw/SHA256SUMS.txt",
  "data-raw/LICENSE.txt"
)))
file_move(here("data-raw/DataPaper"), here("data-raw/mmash"))


# Import multiple files
user_info_df <- import_multiple_files("user_info.csv", import_user_info)
user_info_df

saliva_df <- import_multiple_files("saliva.csv",import_saliva)
saliva_df
