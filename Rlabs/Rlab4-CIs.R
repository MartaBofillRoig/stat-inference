### ========================================
### Introduction to Statistical Inference
### marta.bofill.roig@upc.edu
### Rlab4: Confidence intervals
### ========================================

# Set seed for reproducibility
set.seed(1425)

# Confidence Interval for a Mean
#################################
# By hand
n <- 30
mu <- 200
sd <- 12
x <- rnorm(n,mu,sd)

xbar <- mean(x) # Sample mean
s <- sd(x) #Sample standard deviation

margin <- qt(0.975,df=n-1)*s/sqrt(n) #1-0.05/2
lowerinterval <- xbar - margin
upperinterval <- xbar + margin
c(lowerinterval,upperinterval)  


# Confidence Interval for a Difference in Means
#################################
n1 <- 20
xbar1 <- 250
s1 <- 13
n2 <- 20
xbar2 <- 280
s2 <- 11.9

sp = ((n1-1)*s1^2+(n2-1)*s2^2)/(n1+n2-2)
sp

margin <- qt(0.975,df=n1+n2-1)*sqrt(sp/n1 + sp/n2)
margin

lowerinterval <- (xbar1-xbar2) - margin
upperinterval <- (xbar1-xbar2) + margin
c(lowerinterval,upperinterval)

# Confidence Interval for a Difference in Means
# using t.test
#################################
# Generate two independent samples
n1 <- 30
n2 <- 35
mu1 <- 50
mu2 <- 55
sd1 <- 10
sd2 <- 12

sample1 <- rnorm(n1, mean = mu1, sd = sd1)
sample2 <- rnorm(n2, mean = mu2, sd = sd2)

# Perform t-test to get confidence interval
t_result <- t.test(sample1, sample2, var.equal = FALSE)  # Welch's t-test
(t_result)


# Other references and sources
#################################
# Confidence interval using the R package confintr
# https://cran.r-project.org/web/packages/confintr/confintr.pdf

# Confidence intervals using R
# https://www.r-bloggers.com/2021/11/calculate-confidence-intervals-in-r/
