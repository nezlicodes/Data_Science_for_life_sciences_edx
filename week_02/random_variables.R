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


url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- "femaleControlsPopulation.csv"
if (!file.exists(filename)) download(url,destfile=filename)
population <- read.csv(filename)
population <- unlist(population) # turn it into a numeric


View(population)

control_var <- sample(population, 12)
mean(control_var)
