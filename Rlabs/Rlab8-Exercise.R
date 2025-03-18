### ========================================
### Introduction to Statistical Inference
### marta.bofill.roig@upc.edu
### Rlab: Exercise
### ========================================

# 1) Load and explore the palmerpenguins dataset.
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
penguins_clean <- na.omit(penguins)

# Count the number of penguins by species
table(penguins_clean$species)

# Plot the distribution of flipper length 
boxplot(flipper_length_mm ~ species, data = penguins_clean, 
        col = c("lightblue", "lightgreen", "pink"),
        main = "Flipper Length Distribution by Species", 
        ylab = "Flipper Length (mm)", xlab = "Species")

# Scatter plot of flipper length vs. body mass
species_colors <- c("Adelie" = "red", "Chinstrap" = "green", "Gentoo" = "blue")
plot(penguins_clean$flipper_length_mm, penguins_clean$body_mass_g, 
     col = as.numeric(penguins_clean$species)+1, pch = 19, 
     main = "Body Mass vs Flipper Length",
     xlab = "Flipper Length (mm)", ylab = "Body Mass (g)")
# Add legend
legend("topleft", legend = names(species_colors), col = species_colors, pch = 19, title = "Species")

# 2) 
# Calculate confidence intervals for body mass (total and by species)
summary(penguins_clean)

t.test(penguins_clean$body_mass_g)$conf.int

bodymass_adelie <- subset(penguins_clean, penguins_clean$species=="Adelie")$body_mass_g
bodymass_chinstrap <- subset(penguins_clean, penguins_clean$species=="Chinstrap")$body_mass_g
bodymass_gentoo <- subset(penguins_clean, penguins_clean$species=="Gentoo")$body_mass_g

t.test(bodymass_adelie)$estimate
t.test(bodymass_adelie)$conf.int

t.test(bodymass_chinstrap)$estimate
t.test(bodymass_chinstrap)$conf.int

t.test(bodymass_gentoo)$estimate
t.test(bodymass_gentoo)$conf.int

# 3)
# Fit a linear regression model 1: Y = body_mass_g, X = flipper_length_mm
lm_model <- lm(body_mass_g ~ flipper_length_mm, data = penguins_clean) 
summary(lm_model)
# Compute 95% confidence intervals for regression coefficients
confint(lm_model, level = 0.95)

# Scatter plot of flipper length vs. body mass
plot(penguins_clean$flipper_length_mm, penguins_clean$body_mass_g, 
     col = as.numeric(penguins_clean$species)+1, pch = 19, 
     main = "Body Mass vs Flipper Length",
     xlab = "Flipper Length (mm)", ylab = "Body Mass (g)")

# Add regression line
abline(lm_model, lwd = 2)

# Fit a linear regression model 2: Y = bill_length_mm, X = species
lm_model2 <- lm(bill_length_mm ~ species, data = penguins_clean)
summary(lm_model2)
# Compute 95% confidence intervals for regression coefficients
confint(lm_model2, level = 0.95)

# Fit a linear regression model 2: Y = bill_length_mm, X = species, Z= sex
lm_model3 <- lm(bill_length_mm ~ species + sex, data = penguins_clean)
summary(lm_model3)
# Compute 95% confidence intervals for regression coefficients
confint(lm_model3, level = 0.95)







