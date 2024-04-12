#### Preamble ####
# Purpose: Cleans the raw dataset
# Author: Wentao Sun
# Data: 1 April 2024
# Contact: went.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Must have raw data downloaded.
# Any other information needed? None.

#### Workspace setup ####

library(tidyverse)
library(lubridate)


#### Clean data ####
### import raw data ###
water_raw <- read_csv("data/raw_data/Raw_Data_WaterQuality.csv",
                                    na.strings = c("N/A",""))


### Filter columns based on percentage of missing values ###
na_prop <- apply(water_raw, 2, function(x) sum(is.na(x)))/nrow(water_raw)
na_prop[na_prop>0.8] %>% names()
na_prop[na_prop<=0.8] %>% names()


### select variables of interest ###

cleaned_water <- water_raw %>% 
  # select variables of interest
  select(Site_Id, Salinity..ppt.,
         Dissolved.Oxygen..mg.L.,
         pH..standard.units.,Secchi.Depth..m.,
         Water.Depth..m.,Water.Temp...C., Air.Temp...F. ,
         Read_Date) %>% 
  # renamed column names for better comprehension
  rename(Oxygen = Dissolved.Oxygen..mg.L.,
         pH = pH..standard.units.,
         Depth = Secchi.Depth..m.,
         Salinity = Salinity..ppt.,
         Water.Depth = Water.Depth..m.,
         Water.Temp = Water.Temp...C., 
         Air.Temp = Air.Temp...F. ) %>% 
  na.omit() %>% 
  mutate(Read_Date = mdy(Read_Date),
         year = year(Read_Date) %>% factor(),
         month = month(Read_Date) %>% factor()) %>% 
  select(!Read_Date)

#### Check data ####
apply(cleaned_water,2,function(x) sum(is.na(x)))

#### Save data ####
write_csv(cleaned_water, "data/cleaned_data/cleaned_waterquality_data.csv")
