### ========================================
### Introduction to Statistical Inference
### marta.bofill.roig@upc.edu
### Rlab: Examples
### ========================================

# EXAMPLE 1
# Data
oxygen_values <- c(2.62, 2.65, 2.79, 2.83, 2.91, 3.57)

# Sample statistics
n <- length(oxygen_values)  # Sample size
mean_Y <- mean(oxygen_values)  # Sample mean
s <- sd(oxygen_values)  # Sample standard deviation
se_Y <- s / sqrt(n)  # Standard error

df <- n - 1  # Degrees of freedom

# 95% Confidence Interval
t_95 <- qt(0.975, df)  # t-value for 95% confidence
i95_lower <- mean_Y - t_95 * se_Y
i95_upper <- mean_Y + t_95 * se_Y
c(i95_lower,i95_upper)

t.test(oxygen_values)

# 90% Confidence Interval
t_90 <- qt(0.95, df)  # t-value for 90% confidence
i90_lower <- mean_Y - t_90 * se_Y
i90_upper <- mean_Y + t_90 * se_Y
c(i90_lower,i90_upper)


# EXAMPLE 2
# data Pig Rations 
ration_A <- c(31, 34, 29, 26, 32, 35, 38, 34, 30, 29, 32, 31)
ration_B <- c(26, 24, 28, 29, 30, 29, 32, 26, 31, 29, 32, 28)

# Perform t-test
test_result <- t.test(ration_A, ration_B, var.equal = TRUE, conf.level = 0.95)
test_result

?t.test

