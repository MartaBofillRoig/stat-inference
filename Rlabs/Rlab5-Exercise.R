### ========================================
### Introduction to Statistical Inference
### marta.bofill.roig@upc.edu
### Rlab: Exercise
### ========================================

# Exercise: Analyzing Delivery Data
# Explore the dataset Delivery Data by performing descriptive analysis, calculating summary statistics, and computing confidence intervals for delivery time under different traffic conditions.
# 
# 1) Descriptive Analysis
# We will use various visualizations to understand the distribution of key variables:
#   
#   - Histogram of Delivery Time: Create a histogram to visualize the distribution of delivery times across all deliveries.
# - Boxplot of Delivery Time by Traffic Density: Generate a boxplot to compare delivery times across different levels of road traffic density (e.g., low, medium, jam).
# - Bar Plot of Multiple Deliveries: Display the counts of deliveries made per trip by delivery personnel.
# - Histogram of Delivery Person Ratings: Show the distribution of ratings given to delivery personnel.
# 
# 2) Summary Statistics for Delivery Time
# 
# - Compute the sample mean and sample standard deviation of delivery time to summarize its central tendency and variability.
# 
# 3) Confidence Interval for Delivery Time under Different Traffic Conditions
# Calculate the 95% confidence interval (CI) for the difference of means in delivery times under:
# - Low traffic
# - Jam traffic
# Interpret the results.



# load("DeliveryData.RData")
fooddelivery_data$traffic <- as.factor(fooddelivery_data$traffic)
fooddelivery_data$traffic <- factor(fooddelivery_data$traffic, levels = c("Low", "Medium", "High", "Jam"))

# 1)
windows(width = 12, height = 8) 
par(mfrow = c(1, 4), lwd = 2, font.lab = 2, font.axis = 1, las = 1)

hist(fooddelivery_data$deliverytime, breaks = 10, 
     xlab= "Delivery Time (min)", main= "Distribution of Delivery Time",
     xlim = c(0,60),
     ylim = c(0, 8000),
     col = "lightgreen") 
axis(2, at = c(2000, 4000, 6000, 8000))
boxplot(fooddelivery_data$deliverytime ~ fooddelivery_data$traffic, frame.plot = FALSE,
        main = "Time versus versus Traffic",
        ylab="Delivery Time (min)",
        xlab="Road traffic density", ylim=c(10,60))
barplot(table(fooddelivery_data$multipledeliveries), 
        xlab="Multiple Deliveries", ylab="Counts", main="Distribution of Multiple Deliveries",
        ylim = c(0, 30000),
        col="red")
hist(fooddelivery_data$ratings,
     xlab="Ratings", main="Delivery Person Ratings",
     col="lightblue")

dev.off()

# 2)
mean(fooddelivery_data$deliverytime)
sd(fooddelivery_data$deliverytime)

# 3)
time_low <- subset(fooddelivery_data, fooddelivery_data$traffic=="Low")$deliverytime
time_jam <- subset(fooddelivery_data, fooddelivery_data$traffic=="Jam")$deliverytime
t.test(time_jam,time_low)
