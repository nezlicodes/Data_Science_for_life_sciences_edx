library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if(!file.exists("femaleMiceWeights.csv")) download(url,destfile=filename)
dat <- read.csv(filename)

n=100
set.seed(1)
dieRolls <- replicate(10000, mean(sample(1:6, n, replace=TRUE)==6))
p<-1/6
var<-p*(1-p)/n
z<-(dieRolls - p) / sqrt(p*(1-p)/n)
mypar(2,2)
hist(z)
qqnorm(z)
qqline(z)
mean(abs(z)>2)

n=5
set.seed(1)
dieRolls <- replicate(10000, mean(sample(1:6, n, replace=TRUE)==6))
p<-0.5
var<-p*(1-p)/n
z<-(dieRolls - p) / sqrt(p*(1-p)/n)
mypar(2,2)
hist(z)
qqnorm(z)
qqline(z)

n=30
set.seed(1)
dieRolls <- replicate(10000, mean(sample(1:6, n, replace=TRUE)==6))
p<-0.5
var<-p*(1-p)/n
z<-(dieRolls - p) / sqrt(p*(1-p)/n)
hist(z)
qqnorm(z)
qqline(z)


n=30
set.seed(1)
dieRolls <- replicate(10000, mean(sample(1:6, n, replace=TRUE)==6))
p<-0.01
var<-p*(1-p)/n
z<-(dieRolls - p) / sqrt(p*(1-p)/n)
hist(z)
qqnorm(z)
qqline(z)


n=100
set.seed(1)
dieRolls <- replicate(10000, mean(sample(1:6, n, replace=TRUE)==6))
p<-0.01
var<-p*(1-p)/n
z<-(dieRolls - p) / sqrt(p*(1-p)/n)
hist(z)
qqnorm(z)
qqline(z)

X <- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist
Y <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist

mu_x <- mean(X)
mu_x

# Use the CLT to approximate the probability that our estimate  X¯  is off by more than 2 grams from  μX .
2 * ( 1-pnorm(2/sd(X) * sqrt(12) ) )
se <- sqrt(var(Y)/12 + var(X)/12)
se
diff<-mean(Y)-mean(X)
diff
tstat<-diff/se
tstat

pnorm(2.055174,lower.tail=FALSE)*2
t.test(X,Y)
