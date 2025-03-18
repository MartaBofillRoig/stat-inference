### ========================================
### Introduction to Statistical Inference
### marta.bofill.roig@upc.edu
### Rlab3: Plots
### ========================================

# Part I: Quick introduction to R
# Part II: Descriptive analysis

##########################################
# PART I: Vectors and data.frames
##########################################

# Vectors in R
# Creating a numeric vector
num_vec <- c(10, 20, 30, 40, 50)
(num_vec)

# Vector operations
####################
# Accessing elements
element <- num_vec[3]  # 3rd element of num_vec
print(paste("Third element of num_vec:", element))
print(num_vec[3]) #without saving

# Vector arithmetic (adding 5 to each element)
vec_add <- num_vec + 5
print("Vector after adding 5 to each element:")
print(vec_add)

# Logical vector (comparison)
logical_vec <- num_vec > 25
(logical_vec)

# where? positions in the vector
which(num_vec > 25)

# Data Frames in R
##################
# Creating a simple data frame
name <- c("Alice", "Bob", "Charlie", "David", "Eve")
age <- c(23, 35, 45, 32, 28)
height <- c(165, 170, 175, 180, 160)

df <- data.frame(Name = name, Age = age, Height = height)
head(df)

# Data frame manipulation
# Accessing a specific column
age_column <- df$Age
(age_column)
is.vector(df$Age)
df$Age[1]

# Filtering rows (people older than 30)
df_filtered <- df[df$Age > 30, ]
(df_filtered) 

# Adding a new column (Weight)
df$Weight <- c(60, 75, 70, 80, 55)
(df)

##########################################
# PART II: Univariate descriptive analysis
##########################################

library(datasets)
# data(state) 

tem <- data.frame(state.x77)               # Transform matrix into data frame
states <- cbind(state.abb, tem, state.region) # Combine the three data sets
colnames(states)[1] <- "State"                # Rename first column
colnames(states)[10] <- "Region"              # Rename the 10th column
head(states)
str(states)
dim(states)

library(Hmisc) 
str(states)
summary(states)
# Hmisc::Label(states)

## 1. Numeric variables
## ====================
## See functions mean(), median(), sd(), range(), summary(), etc..

mean(states$Income)
median(states$Income)
summary(states$Income)

# Another important function: quantile()
# --------------------------------------
quantile(states$Income)
quantile(states$Income, c(0.3, 0.9))
quantile(states$Income, 1:4 / 5)  # same as quantile(states$Income, c(0.2, 0.4, 0.6, 0.8))


## 2. Categorical variables
## ========================
## A very simple frequency table
## -----------------------------
table(states$Region)
summary(states$Region)             # Only meaningful if the variable is a factor!

## Relative frequencies
## --------------------
prop.table(table(states$Region))


## Some useful functions from contributed packages:
## ================================================
## (a) Function freq() ("descr")
## -----------------------------
# install.packages("descr")
library(descr)
freq(states$Region)
freq(states$Region, plot = FALSE)

## (b) Function Freq() ("DescTools")
## ---------------------------------
# install.packages("DescTools")
library(DescTools)
Freq(states$Region)

## Each functions represents NAs in different ways:
## ------------------------------------------------
Region <- states$Region
Region[49:50] <- NA
summary(Region)
freq(Region, plot = FALSE)
Freq(Region)
Freq(Region, useNA = "ifany")

## Conversion of a numeric variable into an ordinal variable.
## ==========================================================
## Function cut2() of the "Hmisc" package
## --------------------------------------
library(Hmisc)
states$Income2 <- cut2(states$Income, c(4000, 4500, 5000))
head(states)
summary(states)

## Slight change of the labels
levels(states$Income2)
levels(states$Income2)[c(1, 4)] <- c("< 4000", ">= 5000")
levels(states$Income2)
summary(states)

## See, also, functions cut(), ifelse(), or recode() ("memisc" package).


## PLOTS
## ===============
## 1. Scatterplots
## ===============
plot(Income ~ Population, states, main = "A simple figure")

# The same graph opened in a new graphical window:
# ------------------------------------------------
windows()
plot(Income ~ Population, states, main = "A simple figure", xlab = "Population",
     ylab = "Income")

# Instead of argument "data = states", we can also use function with():
# ---------------------------------------------------------------------
with(states, plot(Income ~ Population, xlab = "Population", ylab = "Income"))
title("A simple scatterplot")

# We can close the active graphics window with function dev.off():
dev.off()



## 2. Histograms
## =============
windows(width = 8)
par(font.lab = 2, font.axis = 4, las = 1)
hist(states$Income)

# We can improve the figure a little bit:
# ---------------------------------------
hist(states$Income, xlab = "Dollars", breaks = 15, col = 2,
     main = "Distribution of average Income in the USA (1977)")

# If we change the y-axis, it is possible to add a smoothed curve
# ---------------------------------------------------------------
hist(states$Income, xlab = "Dollars", breaks = 15, col = "steelblue",
     freq = FALSE, main = "Distribution of average Income in the USA (1977)")
lines(density(states$Income), lwd = 3)

# Would like some more colours? Choose among...
colours()

# Or, what about the rainbow colours?
hist(states$Income, xlab = "Dollars", breaks = 15, col = rainbow(20),
     main = "Distribution of average Income in the USA (1977)")

## Only plotting the estimated density function:
windows(width = 8)
par(font.lab = 2, font.axis = 4, las = 1)
plot(density(states$Income), lwd = 3)


## How to save a graph?
## --------------------
# (I) Use of function savePlot() [Under Mac, use: quartz.save()]:
# ---------------------------------------------------------------
savePlot("IncomeHisto", type = "pdf")
savePlot("IncomeHisto", type = "png")
dir()

# (II) Function pdf() can be used to create a pdf file
#      that contains one or more graphs.
# ----------------------------------------------------
pdf("Histograma.pdf", width=8)
par(font.lab = 2, font.axis = 4, las = 1)
hist(states$Income, xlab = "Dollars", breaks = 15, col = 2,
     main = "Distribution of average Income in the USA (1977)")

hist(states$Income, xlab = "Dollars", breaks = 15, col = "steelblue",
     freq = FALSE, main = "Distribution of average Income in the USA (1977)")
lines(density(states$Income), lwd = 3)

hist(states$Income, xlab = "Dollars", breaks = 15, col = rainbow(20),
     main = "Distribution of average Income in the USA (1977)")
dev.off()

# PS: Similar functions exist for other formats: png(), tiff(), etc.


# Close all graph devices (if you want)
graphics.off()


## 3. Boxplots
## ===========
## Values to be passed to function par():
myPar <- list(font.lab = 2, font.axis = 4, las = 1)

windows()
par(myPar)
boxplot(states$Income)
boxplot(Income ~ Region, data = states, xlab = "Region", ylab = "Dollar",
        col = 3, pch = 16)
boxplot(Income ~ Region, states, xlab = "Region", ylab = "Dollar", col = 2:5,
        pch = 16, main = "Average Income")

## Maybe add a beeswarm?
# install.packages("beeswarm")
library(beeswarm)
beeswarm(Income ~ Region, states, col = 2:5, pch = 16, main = "Average Income")
# Put the bees in a box
boxplot(Income ~ Region, states, xlab = "Region", ylab = "Dollar", col = 2:5,
        pch = 16, main = "Average Income")
beeswarm(Income ~ Region, states, pch = 16, add = TRUE)



## 4. Pie charts 
## ==================================== 
pie(table(states$Income2))
pie(table(states$Income2), col = 1:4, main = "Average Income")

## 5. Barplots: for some better examples, see help(barplot)
## ========================================================
barplot(table(states$Income2))
with(states, barplot(tapply(Income, Region, median), col = 1:4,
                     main = "Median Income per state"))
with(states, barplot(table(Income2, Region), col = 1:4, ylab = "Number of states",
                     legend = TRUE))
with(states, barplot(table(Income2, Region), beside = TRUE, col = 1:4,
                     ylab = "Number of states", legend = TRUE))
dev.off()


## 6. Instead of a barplot, better use a mosaicplot
## ================================================
windows(width = 8)
par(myPar)
mosaicplot(Region ~ Income2, states, col = 1:4, xlab = "Region", ylab = "Dollars",
           main = "Income per Region", cex.axis = 1)


## Closing all open graphics devices 
dev.off()

