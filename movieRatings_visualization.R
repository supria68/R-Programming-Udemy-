# R Programming Assignment - 7
# Description:
# You have been approached as an analytics consultant by a movie reviews website.
# They are writing up an article analysing movie ratings by critics and audience as well as movie budgets for the years 2007-2011.
# This is the first time they are doing this analysis and they don’t know exactly what they need. They have asked you to look into the data and provide them with 5 graphs
# that tell a story about the data.
# However, there is one chart the CEO specifically requested - a diagram showing how
# the correlation between audience and critic ratings has evolved throughout the years
# by genre. This is in addition to the other 5. See the next page for the CEO’s “Vision”.

# Solution:
getwd()
setwd("/home/supriya/Documents/projects/R_programming/Udemy_R/")
stats <- read.csv("P2-Movie-Ratings.csv")
head(stats)
colnames(stats)
# Renaming few columns
colnames(stats) <- c("Film", "Genre", "criticRating", "audienceRating", "budgetMillions", "Year")
head(stats)

# Check the structure
str(stats)
# Factoring the column 'Year'
stats$Year <- factor(stats$Year)
summary(stats) # Now "Year" is also a categorical column!!

library(ggplot2)

# Plot - 1 (Normal distribution of audience rating)
t <- ggplot(data = stats)
t + geom_histogram(binwidth = 10, aes(x = audienceRating), fill = "White", color = "Black")

# Plot - 2 (Uniform distribution of critic rating)
t + geom_histogram(binwidth = 10, aes(x = criticRating), fill = "White", color = "Blue")

# plot - 3 (Movie Budget Distribution)
n <- ggplot(data = stats, aes(x = budgetMillions))
oo <- n + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")
# Better formatting!!
oo + xlab('Budget in Millions') + 
  ylab('Number of Movies') + 
  ggtitle('Movie Budget Distribution') +
  theme(axis.title.x = element_text(size = 20, color = "Blue"),
        axis.title.y = element_text(size = 20, color = "Red"),
        plot.title = element_text(size = 30, color = "Black"),
        axis.text.x = element_text(size = 10), # -- for x ticks
        axis.text.y =  element_text(size = 10), # -- for y ticks
        legend.title = element_text(size = 20), #- legend title
        legend.text = element_text(size = 10), # - legend texts
        legend.position = c(1,1),
        legend.justification = c(1,1))

# Plot - 4
p <- ggplot(data = stats, aes(x = criticRating, y = audienceRating))
q <- p + geom_point(aes(color = Genre, size = budgetMillions))
q + xlab('Critics Rating') + ylab('Audience Rating') + ggtitle('Audience Vs Critics Rating') +
  theme(axis.title.x = element_text(size = 20, color = "Blue"),
        axis.title.y = element_text(size = 20, color = "Red"),
        plot.title = element_text(size = 30, color = "Black"))

# Plot - 5 (Audience Critic Ratings for different Years and Genre)
w <- ggplot(data = stats, aes(x = criticRating, y = audienceRating, color = Genre))
w + geom_point(aes(size = budgetMillions)) + geom_smooth() + facet_grid(Genre~Year) +
  coord_cartesian(ylim = c(0,100))

# Plot -6 ( Audience Rating Vs Movie Budget)
ggplot(data = stats, 
       aes(x = budgetMillions, y = audienceRating, color = Genre)) + 
  geom_point() + facet_grid(Genre~Year)

# Plot - 7 (Box Plot for Audience Rating)
u <- ggplot(data = stats, aes(x = Genre, y = audienceRating, color = Genre))
u + geom_jitter() + geom_boxplot(alpha = 0.5) # -- Analysis: Audience like more 
#of thriller movies than any other genre! The mean of Thriller is approx 70!! Poorest likes are for Horror movies!