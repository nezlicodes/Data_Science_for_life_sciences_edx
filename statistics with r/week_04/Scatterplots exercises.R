library(UsingR)
library(dplyr)
data <- nym.2002
View(data)


# Use dplyr to create two new data frames: males and females, with the data for each gender. For males, what is the Pearson correlation between age and time to finish?
males <- filter(data, gender=='Male')
females <- filter(data, gender=='Female')
cor(males$age,males$time)


# For females, what is the Pearson correlation between age and time to finish?
cor(females$age,females$time)

# 
# If we interpret these correlations without visualizing the data, we would conclude that the older we get, the slower we run marathons, regardless of gender. Look at scatterplots and boxplots of times stratified by age groups (20-25, 25-30, etc..).
# After examining the data, what is a more reasonable conclusion?

## Males plots
library(rafalib)
mypar(2,2)
plot(females$age, females$time)
plot(males$age, males$time)
group <- floor(females$age/5) * 5
boxplot(females$time~group)
group <- floor(males$age/5) * 5
boxplot(males$time~group)
