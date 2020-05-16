library(rafalib)
mypar(1,2)

qqnorm(treatment)
qqline(treatment,col=2)

qqnorm(control)
qqline(control,col=2)

ttest <- t.test(treatment, control)

# To see just the p-value, we can use the $ extractor:
ttest$p.value

library(dplyr)
dat <- read.csv("mice_pheno.csv")
control <- filter(dat,Diet=="chow") %>% select(Bodyweight) 
treatment <- filter(dat,Diet=="hf") %>% select(Bodyweight) 
t.test(treatment,control)

