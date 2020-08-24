# R programming Assignment - 7
# Description: MOVIE DOMESTIC % GROSS
# Create a box plot between Gross % US and Genre(action, adventure, comedy, animation, drama) 
# based on Studio(Buena Vista Studios, WB, Fox, Universal, Sony, Paramount Pictures) and Budget.

getwd()
setwd("/home/supriya/Documents/projects/R_programming/assignments/")
mov <- read.csv("data/movie_gross_data.csv")

# Data Exploration
head(mov)
str(mov) # structure of the dataset
summary(mov) # column summary

# Activate ggplot
library(ggplot2)

# Filtering out the dataset for Genre and Studio that we are interested in!
filt <- (mov$Genre == "action") | (mov$Genre == "adventure") | 
  (mov$Genre == "animation") | (mov$Genre == "comedy") | (mov$Genre == "drama")

filt2 <- (mov$Studio == "Buena Vista Studios") | (mov$Studio == "WB") | (mov$Studio == "Fox") | 
  (mov$Studio == "Universal") | (mov$Studio == "Sony") | (mov$Studio == "Paramount Pictures")
# option -2 
# filt2 <- mov$Studio %in% c("Buena Vista Studios", "WB","Sony","Universal","Paramount Pictures","Fox")

# Applying row filters
mov2 <- mov[filt & filt2,]

# Plotting data
colnames(mov2) # column names

p <- ggplot(data = mov2, aes(x = Genre, y = Gross...US))
q <- p + geom_jitter(aes(size = Budget...mill., color = Studio)) + 
  geom_boxplot(alpha = 0.7, outlier.colour = NA) +
  ggtitle('Domestic Gross % by Genre') +
  xlab('Genre') +
  ylab("Gross % US")

q

# Themes
q <- q + theme(
  text = element_text(family = 'Comic Sans MS'), # alters all text to one font
  
  #Axes titles:
  axis.title.x = element_text(colour="Blue", size=25),
  axis.title.y = element_text(colour="Blue", size=25),
  
  #Axes texts:
  axis.text.x = element_text(size=15),
  axis.text.y = element_text(size=15),  
  
  #Plot title:
  plot.title = element_text(colour="Black", size=35),
  
  #Legend title:
  legend.title = element_text(size=15),
  
  #Legend text
  legend.text = element_text(size=12)
)

q

# Change the label of size 
q$labels$size = "Budget $M"
q