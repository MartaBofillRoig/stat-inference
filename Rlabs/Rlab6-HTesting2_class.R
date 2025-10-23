### ========================================
### Introduction to Statistical Inference
### marta.bofill.roig@upc.edu
### Rlab6: Hypothesis testing
### Type 1 and 2 errors
### ========================================

############################################################
# Exercise 1: Basic simulation parameters
############################################################ 
# In this first step, we define the basic parameters for our simulation:
# - n: sample size
# - sigma: population standard deviation
# - alpha: significance level for our hypothesis test
# - n_sim: number of simulated experiments
# Set a random seed for reproducibility

set.seed(123)

# Define parameters
n <- 30           # sample size
sigma <- 1        # population standard deviation
alpha <- 0.05     # significance level
n_sim <- 10000    # number of simulated experiments


############################################################
# Exercise 2: Simulating when the null hypothesis (H0) is true
############################################################
# Here, we assume that the null hypothesis is true:
#   H0: μ = 0
# We draw a random sample of size n from a normal distribution
# with mean = 0 and standard deviation = sigma.
# Then we perform a one-sample t-test to test if the mean = 0.
# Run the code and look at the output: What is the p-value?
# Would you reject H0 at α = 0.05? 
mu_true <- 0

# Run one example
x <- rnorm(...)
t.test(...)

############################################################
# Exercise 3: Estimating the Type I error rate
############################################################
# Now we repeat this experiment many times (n_sim times).
# Each time, we generate new random data and perform a t-test.
# We record whether the null hypothesis is rejected.
# The proportion of rejections when H0 is true is our
# estimated Type I error rate (false positive rate).
# What do you expect this rate to be?

type1_results <- ...

# Estimate the Type I error rate
type1_error_rate <- mean(...)
type1_error_rate


############################################################
# Exercise 4: Simulating when the null hypothesis is FALSE
############################################################
# Now let’s assume the null hypothesis is false.
# We’ll set the true mean to a different value (say, μ = 1).
# This means the population really is different from 0.
# We’ll repeat the t-test many times again, but now we record
# how often we FAIL to reject H0 — that’s a Type II error

# Now set a true mean different from 0
mu_false <- 1  # Effect size of 1 SD

# Simulate under H1
...

# Estimate Type II error and power 
...

type2_error_rate
power

############################################################
# Exercise 5: Exploring the effect of sample size
############################################################
# In this step, we explore how the sample size affects power.
# We’ll repeat the simulation for different n values.
# As sample size increases, what do you expect to happen
# to the power of the test?

sample_sizes <- c(10, 20, 50, 100)

...

############################################################
# Exercise 6: Visualizing the distributions under H0 and H1
############################################################
# To understand why these errors happen, let’s visualize
# the sampling distributions under H0 and H1.
# The two curves overlap — that overlap area corresponds to
# possible Type I and Type II errors.


