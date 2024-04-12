#### Preamble ####
# Purpose: Simulates the desired data.
# Author: Wentao Sun
# Data: 28 March 2024
# Contact: went.sun@mail.utoronto.ca

#### Workspace setup ####

#install.packages("dplyr")
#install.packages("ggplot2")

library(dplyr)
library(ggplot2)


#### Simulate data ####
set.seed(300) 

n <- 200

simulated_data <- tibble(
  water_id <- rep(1:50, each = 4),
  #Generate pH data, assuming pH follows a normal distribution
  pH_value <- rnorm(n, mean=7.5, sd=0.5),
  #Generate dissolved oxygen data, assuming that dissolved oxygen follows a normal distribution
  dissolved_oxygen <- rnorm(n, mean=8, sd=2),
  #Generate air temperature data, assuming temperatures follow a normal distribution
  air_temp <- rnorm(n, mean=20, sd=5),
  #Generate water temperature data, assuming temperatures follow a normal distribution
  water_temp <- rnorm(n, mean=20, sd=5),
  #Generate salinity data, assuming temperatures follow a normal distribution
  Salinity <- rnorm(n, mean=1, sd=0.5)
)

head(simulated_data)
