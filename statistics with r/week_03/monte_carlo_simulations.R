# We will use a monte Carlo simultaion the CLT to the t-distribution approximation for different sample sizes.

library(dplyr)
dat <- read.csv("mice_pheno.csv")
controlPopulation <- filter(dat,Sex == "F" & Diet == "chow") %>%  
  select(Bodyweight) %>% unlist


## Function that will generation a t-stat under the null hypothesis for any sample size of n.
ttestgenerator <- function(n) {
  cases <- sample(controlPopulation, n)
  controls <- sample(controlPopulation,n)
  tstat <- (mean(cases) - mean(controls)) / sqrt(var(cases)/n + var(controls)/n)
  return(tstat)
  }
ttests <- replicate(1000, ttestgenerator(10))

hist(ttests)
qqnorm(ttests)
abline(0,1)


ttests <- replicate(1000, ttestgenerator(3))
qqnorm(ttests)
abline(0,1)

ps <- (seq(0,999)+0.5)/1000
qqplot(qt(ps,df=2*3-2),ttests,xlim=c(-6,6),ylim=c(-6,6))
abline(0,1)

# In practice we run parametric Parametric Simulations for the Observations
# And we do this only by replacing sample() with rnorm(data, mean, sd)
