#### Preamble ####
# Purpose: Test simulated data.
# Author: Wentao Sun
# Data: 2 April 2024
# Contact: went.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Create simulated data.
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)

#### Test data ####
# test 1
simulated_data$Read_Date |>
  class() == "character"

# test 2
simulated_data$Site_Id |>
  max() == 50

# test 3
simulated_data$Year |>
  class() == "integer"

# test 4
# variable
num_uniq <-
  simulated_vocab_data$production |>
  unique()
length(num_uniq) == 2
