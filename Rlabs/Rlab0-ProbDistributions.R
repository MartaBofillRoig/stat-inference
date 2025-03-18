### ========================================
### Introduction to Statistical Inference
### marta.bofill.roig@upc.edu
### Rlab0: Distribution functions
### ========================================

windows(width = 20, height = 12)
par(mfrow = c(2,4))

# 1. Normal Distribution
?dnorm

x <- seq(-4, 4, length=100)
y <- dnorm(x, mean=0, sd=1)
plot(x, y, type="l", col="blue", lwd=2, main="Normal PDF",
     xlab="x", ylab="Density")
legend("topright", legend="Mean=0, SD=1", col="blue", lwd=2)

y_cdf <- pnorm(x, mean=0, sd=1)
plot(x, y_cdf, type="l", col="blue", lwd=2, main="Normal CDF",
     xlab="x", ylab="Cumulative Probability")
legend("bottomright", legend="Mean=0, SD=1", col="blue", lwd=2)

# 2. Binomial Distribution
?dbinom

x <- 0:10
y <- dbinom(x, size=10, prob=0.5)
plot(x, y, type="h", col="red", lwd=2, main="Binomial PMF",
     xlab="Number of Successes", ylab="Probability")
points(x, y, pch=16, col="red")
legend("topright", legend="n=10, p=0.5", col="red", lwd=2)

y_cdf <- pbinom(x, size=10, prob=0.5)
plot(x, y_cdf, type="s", col="red", lwd=2, main="Binomial CDF",
     xlab="Number of Successes", ylab="Cumulative Probability")
legend("bottomright", legend="n=10, p=0.5", col="red", lwd=2)

# 3. Poisson Distribution
?dpois

x <- 0:15
y <- dpois(x, lambda=4)
plot(x, y, type="h", col="green", lwd=2, main="Poisson PMF",
     xlab="Occurrences", ylab="Probability")
points(x, y, pch=16, col="green")
legend("topright", legend="Lambda=4", col="green", lwd=2)

y_cdf <- ppois(x, lambda=4)
plot(x, y_cdf, type="s", col="green", lwd=2, main="Poisson CDF",
     xlab="Occurrences", ylab="Cumulative Probability")
legend("bottomright", legend="Lambda=4", col="green", lwd=2)

# 4. Exponential Distribution
?dexp

x <- seq(0, 5, length=100)
y <- dexp(x, rate=1)
plot(x, y, type="l", col="purple", lwd=2, main="Exponential PDF",
     xlab="x", ylab="Density")
legend("topright", legend="Rate=1", col="purple", lwd=2)

y_cdf <- pexp(x, rate=1)
plot(x, y_cdf, type="l", col="purple", lwd=2, main="Exponential CDF",
     xlab="x", ylab="Cumulative Probability")
legend("bottomright", legend="Rate=1", col="purple", lwd=2)



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

