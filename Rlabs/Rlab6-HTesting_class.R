### ========================================
### Introduction to Statistical Inference
### marta.bofill.roig@upc.edu
### Rlab6: Hypothesis testing
### ========================================

# Exercise 1: hypothesis testing for comparing means using t-tests.
# We have two groups of students: one using a traditional study method and another using an interactive learning app. We want to test whether there is a difference in their test scores.

# (simulated) data
set.seed(355)  # for reproducibility
traditional <- rnorm(30, mean = 75, sd = 10)  # 30 students, mean=75, sd=10
interactive <- rnorm(30, mean = 80, sd = 10)  # 30 students, mean=80, sd=10

# a) Descriptive analysis


# b) Perform test



# Exercise 2: hypothesis testing for comparing proportions using prop.test.
# A company launches a new website design and wants to test if the conversion rate (purchase rate) is significantly different between the old and new designs.
# 
# Old Design: 200 users, 50 made a purchase
# New Design: 250 users, 80 made a purchase
# 
# H0 (Null Hypothesis): The conversion rates are the same.
# H1 (Alternative Hypothesis): The conversion rates are different.

# Data
old_success <- 50  # Purchases with old design
old_total <- 200   # Total users with old design

new_success <- 80  # Purchases with new design
new_total <- 250   # Total users with new design

# a) descriptive analysis

# b) perform test

?prop.test

