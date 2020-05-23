dat <- read.csv("mice_pheno.csv")
chowPopulation <- dat[dat$Sex=="F" & dat$Diet=="chow",3]
mu_chow <- mean(chowPopulation)
print(mu_chow)

N <- 30
chow <- sample(chowPopulation, N)
print(mean(chow))

# The Central Limit Theorem telle us that
# our sample chow follows a normal distribution
# with an average of mu_chow and a std error
# sd(chow)/ sqrt (N)

se <- sd(chow)/sqrt(N)
se

# To find −2≤N−−√(X¯−μX)/sX≤2
Q <- qnorm(1- 0.05/2)

interval <- c(mean(chow) - 2* se, mean(chow) + 2* se )
interval

library(rafalib)
B <- 250
mypar()
plot(mean(chowPopulation)+c(-7,7),c(1,1),type="n",
     xlab="weight",ylab="interval",ylim=c(1,B))
abline(v=mean(chowPopulation))

for (i in 1:B) {
  chow <- sample(chowPopulation,N)
  se <- sd(chow)/sqrt(N)
  interval <- c(mean(chow)-Q*se, mean(chow)+Q*se)
  covered <- 
    mean(chowPopulation) <= interval[2] & mean(chowPopulation) >= interval[1]
  color <- ifelse(covered,1,2)
  lines(interval, c(i,i),col=color)
}

