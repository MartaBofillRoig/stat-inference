### ========================================
### Introduction to Statistical Inference
### marta.bofill.roig@upc.edu
### Rlab3-Extra: ggplot graphical procedures
### ========================================

# Install and load required packages
# install.packages("ggplot2movies")
# install.packages("ggplot2")

library(ggplot2)
library(ggplot2movies)

# Load the movies dataset
data(movies)
?movies
head(movies)  # Preview the data

# -----------------------------
# 1. Histogram (Distribution of Ratings)
# -----------------------------
# A histogram shows the distribution of a numeric variable.

# Structure of ggplot:
# ggplot(data, aes(mapping)) + geom_*(geometry)
#   - ggplot(): Initializes the plot with the data and mapping of variables.
#   - aes(): Defines aesthetic mappings like x, y, color, size.
#   - geom_*: Specifies the geometry, which defines how the data is visually represented (e.g., histogram, bar, scatter).
#   - labs(): Adds labels (e.g., title, axis labels).
#   - theme_minimal(): Sets a minimalistic theme for the plot.

ggplot(movies, aes(x = rating)) +   # Initialize plot with 'movies' dataset and map 'rating' to x-axis
  geom_histogram(binwidth = 0.5, fill = "lightblue", color = "black") +  # Create a histogram with specified binwidth
  labs(title = "Histogram of Movie Ratings",  # Add title
       x = "Rating",  # Label for x-axis
       y = "Count") +  # Label for y-axis
  theme_minimal()  # Use a minimalistic theme

# -----------------------------
# 2. Bar Plot (Movie Genres)
# -----------------------------
# A bar plot shows the frequency of categories (e.g., genres).
# We need to reshape the data, as genres are in multiple columns.

# Reshape data: We "melt" genre columns into rows for each movie.
library(reshape2)
movies_melted <- melt(movies, id.vars = c("title", "year", "rating"), 
                      measure.vars = c("Action", "Animation", "Comedy", "Drama", 
                                       "Documentary", "Romance", "Short"))

# Filter only TRUE values to get movies by genre
movies_melted <- subset(movies_melted, value == 1)

# In a bar plot, we map the categorical variable (genre) to the x-axis.
ggplot(movies_melted, aes(x = variable)) +   # Map 'variable' (genres) to x-axis
  geom_bar(fill = "lightgreen", color = "black") +  # Create bars with green fill and black borders
  labs(title = "Number of Movies by Genre",  # Add title
       x = "Genre",  # Label for x-axis
       y = "Count") +  # Label for y-axis
  theme_minimal()  # Use a minimalistic theme

# -----------------------------
# 3. Box Plot (Movie Ratings by Genre)
# -----------------------------
# A box plot shows the distribution of a numeric variable (rating) grouped by a categorical variable (genre).

# Filter dataset for selected genres (Action, Comedy, Drama)
movies_genres <- melt(movies, id.vars = c("title", "year", "rating"), 
                      measure.vars = c("Action", "Comedy", "Drama"))
movies_genres <- subset(movies_genres, value == 1)

# Structure of the boxplot:
#   - aes(x = genre, y = rating): Map the genre to x and ratings to y.
#   - geom_boxplot(): Geometry for a box plot.

ggplot(movies_genres, aes(x = variable, y = rating, fill = variable)) +  # Map 'variable' (genre) to x and 'rating' to y, and fill colors by genre
  geom_boxplot() +  # Create the box plot
  labs(title = "Boxplot of Ratings by Genre",  # Add title
       x = "Genre",  # Label for x-axis
       y = "Rating") +  # Label for y-axis
  theme_minimal() +  # Minimal theme
  scale_fill_manual(values = c("lightblue", "lightpink", "lightgreen"))  # Custom colors for the genres

# -----------------------------
# 4. Scatter Plot (Rating vs Votes)
# -----------------------------
# A scatter plot shows the relationship between two numeric variables (rating and votes).

# Structure:
#   - aes(x = votes, y = rating): Map 'votes' to x-axis and 'rating' to y-axis.
#   - geom_point(): Geometry for scatter plot.

ggplot(movies, aes(x = votes, y = rating)) +  # Map 'votes' to x and 'rating' to y
  geom_point(alpha = 0.4, color = "blue") +  # Create scatter plot with points; 'alpha' controls transparency
  labs(title = "Scatter Plot of Votes vs Rating",  # Add title
       x = "Votes",  # Label for x-axis
       y = "Rating") +  # Label for y-axis
  theme_minimal() +  # Minimal theme
  scale_x_log10()  # Use log scale for x-axis (due to large vote range)

# -----------------------------
# 5. Density Plot (Distribution of Votes)
# -----------------------------
# A density plot shows the distribution of a numeric variable (votes).

# Structure:
#   - aes(x = votes): Map 'votes' to x-axis.
#   - geom_density(): Geometry for a density plot.

ggplot(movies, aes(x = votes)) +  # Map 'votes' to x-axis
  geom_density(fill = "lightblue", alpha = 0.7) +  # Create density plot with filled color and transparency
  labs(title = "Density Plot of Movie Votes",  # Add title
       x = "Votes") +  # Label for x-axis
  theme_minimal() +  # Minimal theme
  scale_x_log10()  # Use log scale for better visualization

# -----------------------------
# 6. Violin Plot (Rating by Year)
# -----------------------------
# A violin plot combines a box plot and a density plot to show the distribution of a numeric variable (rating) over time (year).

# Add a decade column for grouping
movies$decade <- floor(movies$year / 10) * 10

# Structure:
#   - aes(x = decade, y = rating): Map 'decade' to x-axis and 'rating' to y-axis.
#   - geom_violin(): Geometry for violin plot.

ggplot(movies, aes(x = factor(decade), y = rating)) +  # Map 'decade' to x and 'rating' to y
  geom_violin(fill = "lightblue", color = "darkblue") +  # Create violin plot with fill and outline color
  labs(title = "Violin Plot of Movie Ratings by Decade",  # Add title
       x = "Decade",  # Label for x-axis
       y = "Rating") +  # Label for y-axis
  theme_minimal()  # Minimal theme

# -----------------------------
# 7. Line Plot (Average Rating by Year)
# -----------------------------
# Line plots are useful for showing trends over time.

# Calculate average rating per year
avg_rating_year <- aggregate(rating ~ year, data = movies, FUN = mean)

# Structure:
#   - aes(x = year, y = rating): Map 'year' to x-axis and 'rating' to y-axis.
#   - geom_line(): Geometry for line plot.

ggplot(avg_rating_year, aes(x = year, y = rating)) +  # Map 'year' to x and 'rating' to y
  geom_line(color = "purple", size = 1) +  # Create a line plot with specified color and size
  labs(title = "Average Movie Rating by Year",  # Add title
       x = "Year",  # Label for x-axis
       y = "Average Rating") +  # Label for y-axis
  theme_minimal()  # Minimal theme

# -----------------------------
# 8. Correlation Heatmap (Votes and Ratings)
# -----------------------------
# A heatmap shows the correlation between numeric variables.

# Calculate correlation matrix
movies_numeric <- movies[, c("rating", "votes", "year")]
cor_matrix <- cor(movies_numeric, use = "complete.obs")

# Load corrplot library for visualization
# install.packages("corrplot")
library(corrplot)

# Structure:
# corrplot(cor_matrix): Creates a heatmap for the correlation matrix.

corrplot(cor_matrix, method = "color",  # Use color shading for heatmap
         main = "Correlation Heatmap",  # Add title
         col = colorRampPalette(c("red", "white", "blue"))(200))  # Custom color palette

# -----------------------------
# 9. Faceted Plots (Rating by Genre Over Time)
# -----------------------------
# Faceting allows creating multiple plots based on subsets of data.

# Structure:
#   - facet_wrap(~variable): Creates small multiples (facets) for each genre.

ggplot(movies_genres, aes(x = year, y = rating)) +  # Map 'year' to x and 'rating' to y
  geom_point(alpha = 0.4, color = "blue") +  # Create scatter plot with transparency
  facet_wrap(~variable, scales = "free") +  # Create facets based on 'variable' (genre), allow scales to vary by
  labs(title = "Scatter Plot of Movie Ratings Over Time by Genre", 
       x = "Year", 
       y = "Rating") +
  theme_minimal()