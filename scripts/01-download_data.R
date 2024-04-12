#### Preamble ####
# Purpose: Downloads and saves the data from Data.gov(U.S. Government Data Platform)
# Author: Wentao Sun
# Data: 29 March 2024
# Contact: went.sun@mail.utoronto.ca

#### Workspace setup ####

library(tidyverse)
library(readr)

#### Download data ####
# read in the datasets
# full child by word (in American Sign Language) raw data
raw_waterquality_data <- 
  read_csv(
    file = "https://ecos.fws.gov/ServCat/Reference/Profile/117348"
    )

#### Save data ####
write_csv(raw_waterquality_data, "data/raw_data/Raw_Data_WaterQuality.csv") 
