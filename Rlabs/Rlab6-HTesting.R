### ========================================
### Introduction to Statistical Inference
### marta.bofill.roig@upc.edu
### Rlab6: Hypothesis testing
### ========================================

# Exercise 1: hypothesis testing for comparing means using t-tests.
# We have two groups of students: one using a traditional study method and another using an interactive learning app. We want to test whether there is a significant difference in their test scores.

# (simulated) sample data
set.seed(355)  # for reproducibility
traditional <- rnorm(30, mean = 75, sd = 10)  # 30 students, mean=75, sd=10
interactive <- rnorm(30, mean = 80, sd = 10)  # 30 students, mean=80, sd=10

# a) Descriptive analysis
summary(traditional)
summary(interactive)

data <- data.frame(score = c(traditional,interactive),
                   method = c(rep("Traditional", 30), rep("Interactive", 30)))

boxplot(score~method, data=data)

# b) Perform test
t_test_result <- t.test(traditional, interactive, var.equal = TRUE)  # Assuming equal variances
(t_test_result)

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
successes <- c(old_success, new_success)
totals <- c(old_total, new_total)

old_rate <- old_success / old_total
new_rate <- new_success / new_total

df <- data.frame(
  Design = c("Old", "New"),
  ConversionRate = c(old_rate, new_rate)
)

# Bar Plot
library(ggplot2)
ggplot(df, aes(x = Design, y = ConversionRate, fill = Design)) +
  geom_bar(stat = "identity", width = 0.5) +
  geom_text(aes(label = paste0(round(ConversionRate * 100, 2), "%")), vjust = -0.5) +
  theme_minimal() +
  labs(title = "Conversion Rate Comparison", y = "Conversion Rate", x = "Website Design")

# b) perform test
prop_test_result <- prop.test(successes, totals, correct = FALSE)  
(prop_test_result) 

