set.seed(1)
set.seed(1)

# Let's start by creating an outcome.
# Set the seed at 1, then use rnorm() to generate a random sample of size 5,  X1,.,X5  from a standard normal distribution, then compute the t-statistic  t=5-???X¯/s  with  s  the sample standard deviation. What value do you observe?

testGenerator <- function(N=5) {
  X <- rnorm(N)
  t <- (sqrt(N)*mean(X))/sd(X)
  return(t)
}

testGenerator()

# You have just performed a Monte Carlo simulation using rnorm() , a random number generator for normally distributed data. Gosset's mathematical calculation tells us that the t-statistic defined in the previous exercises, a random variable, follows a t-distribution with  N???1  degrees of freedom. Monte Carlo simulations can be used to check the theory: we generate many outcomes and compare them to the theoretical result. Set the seed to 1, then generate  B=1000  t-statistics as done in exercise 1. What proportion is larger than 2?
set.seed(1)
B <- 1000
ttests <- replicate(B, testGenerator())
mean(ttests > 2)
qqplot(qt(ps,df=4), ttests)
abline(0,1)



for (i in seq(5,30,5)){
  ttests <- replicate(B, testGenerator(5))
  qqplot(qt(ps,df=4), ttests)
  abline(0,1)
}

