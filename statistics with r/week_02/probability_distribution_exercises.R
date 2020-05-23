install.packages("gapminder")
library(gapminder)
data(gapminder)
head(gapminder)

# What is the proportion of countries in 1952 that have a life expectancy less than or equal to 40?

library(dplyr)
year1952 <- filter(gapminder, year==1952) %>% select('lifeExp')
mean(year1952$lifeExp <= 40)

# What is the proportion of countries in 1952 that have a life expectancy between 40 and 60 years?
mean(year1952$lifeExp <= 60) - mean(year1952$lifeExp <= 40)

