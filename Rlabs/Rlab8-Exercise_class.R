### ========================================
### Introduction to Statistical Inference
### marta.bofill.roig@upc.edu
### Rlab: Exercise
### ========================================

# 1) Load and explore the palmerpenguins dataset.
# https://allisonhorst.github.io/palmerpenguins/index.html
# 2) Compute summary statistics and estimate mean values for different groups.
# 3) Perform a simple linear regression to analyze the relationship between variables. 
# Compare Bill dimensions and body mass
# The culmen is the upper ridge of a bird’s bill. In the penguins data, culmen length and depth are renamed as variables bill_length_mm and bill_depth_mm 

# 1)
install.packages("palmerpenguins") 
library(palmerpenguins)

# Load the dataset
penguins <- palmerpenguins::penguins
head(penguins)
str(penguins)

# Remove missing values 

# Count the number of penguins by species 

# Plot the distribution of flipper length  

# Scatter plot of flipper length vs. body mass

# 2) 
# Summary data
# Calculate confidence intervals for body mass (total and by species)

# 3)
# Fit a linear regression model 1: Y = body_mass_g, X = flipper_length_mm

# Compute 95% confidence intervals for regression coefficients

# Fit a linear regression model 2: Y = bill_length_mm, X = species

# Fit a linear regression model 3: Y = bill_length_mm, X = species, Z= sex 





