#### Preamble ####
# Purpose: Model.
# Author: Wentao Sun
# Data:4 April 2024
# Contact: went.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Create simulated data.
# Any other information needed? None.

set.seed(6607)

# Sample 80% of the data indices for training
train_samp <- sample(seq_len(nrow(water_cleaneddata)), size = floor(0.8 * nrow(water_cleaneddata)))

# Split data into training and testing sets
train <- water_cleaneddata[train_samp, ]


train <-water_cleaneddata %>% 
  mutate(year_1999 = ifelse(as.numeric(as.character(year)) >= 1999,1,0)) %>% 
  select(!c(Air.Temp,Water.Depth,year))


# Run a linear model using the transformed year variable and other predictors
lin_model <- lm(Oxygen ~ Salinity + pH + Depth + Water.Temp + year_1999,
                data = train)

# Diagnostic plots for the linear model
par(mfrow = c(2, 2))
plot(lin_model)

#### Save model ####
saveRDS(
  lin_model,
  file = "models/first_model.rds"
)


