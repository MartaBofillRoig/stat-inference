### ========================================
### Introduction to Statistical Inference
### marta.bofill.roig@upc.edu
### Rlab0: Distribution functions
### ========================================

# Exercise: Normal Distribution in R
# Assume the heights of adult persons in a certain population follow a Normal distribution with:
# Mean = 175 cm
# Standard deviation = 8 cm
# 
# Questions:
#   
# 1) Probability Calculation (CDF)
# What is the probability that a randomly selected person is shorter than 170 cm?
# What is the probability that a randomly selected person is taller than 185 cm?
# What is the probability that a randomly selected person is between 165 cm and 180 cm?
#   
# 2) Quantiles (Inverse CDF)
# Find the height corresponding to the 90th percentile (i.e., 90% of subjects are shorter than this height).
# Find the height that separates the tallest 5% from the rest.
# 
# 3) Generating Random Samples
# Generate a random sample of 10 people heights from this distribution and display them.
# Compute the sample mean and standard deviation. Does it match the population parameters?

# HINTS:
?pnorm
# pnorm(x, mean, sd): Computes cumulative probability P(X < x)
# 1 - pnorm(x, mean, sd): Computes P(X > x)
# pnorm(b, mean, sd) - pnorm(a, mean, sd): Computes P(a < X < b)
# qnorm(prob, mean, sd): Finds the quantile for a given probability
# rnorm(n, mean, sd): Generates random samples

# 1)
pnorm(170, mean=175, sd = 8)
1-pnorm(185, mean=175, sd = 8)
pnorm(180, mean=175, sd = 8)-pnorm(165, mean=175, sd = 8)

# 2)
qnorm(.90, mean=175, sd = 8)
qnorm(.95, mean=175, sd = 8)

# 3)
mu <- 175  # Mean height
sigma <- 8  # Standard deviation
sample_heights <- rnorm(10, mean=mu, sd=sigma)  # Generate 10 heights
sample_mean <- mean(sample_heights)  # Compute mean
sample_sd <- sd(sample_heights)  # Compute standard deviation
