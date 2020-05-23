library(downloader)
url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- basename(url)
download(url,filename)


femaleMiceWeights <- read.csv(filename)
head(femaleMiceWeights)



## View entire dataset
View(femaleMiceWeights)


library(dplyr)
control <- filter(femaleMiceWeights,Diet=="chow") %>% select(Bodyweight) %>%  unlist
treatment <- filter(femaleMiceWeights,Diet=="hf") %>% select(Bodyweight) %>%  unlist
mean(control)
mean(treatment)
obs <- mean(treatment) - mean(control)

url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- "femaleControlsPopulation.csv"
if (!file.exists(filename)) download(url,destfile=filename)
population <- read.csv(filename)
population <- unlist(population) # turn it into a numeric


View(population)

control_var <- sample(population, 12)
mean(control_var)


## defining a vector variabe
n <-10000
null <- vector('numeric', n)
for (i in 1:n) {
  control <- sample( population,12,)
  treatment <- sample ( population,12)
  null[i] <- mean(treatment) - mean(control)
}
length(null)
mean(femaleMiceWeights$Bodyweight)


hist(null)


sum(null > obs) / n
# And that is the p-value
# The p-value is the answer to the question, what
# is the probability that an outcome from the null distribution
# is bigger than what we observed when the null hypothesis is true.