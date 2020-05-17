library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)


# Find the p-value 
set.seed(1)
N <- 5
dat.ns<- sample(bwt.nonsmoke, N)
dat.s<- sample(bwt.smoke, N)
t.test(dat.ns,dat.s)$p.value

# The p-value os larger than alpha.
reject <- function(N, alpha=0.05){
  dat.ns <- sample(bwt.nonsmoke,N) 
  dat.s <- sample(bwt.smoke,N)
  pval <- t.test(dat.ns,dat.s)$p.value
  pval < alpha
}
# Set the seed at 1, then use the replicate() function to repeat the code used in the exercise above 10,000 times. What proportion of the time do we reject at the 0.05 level?
set.seed(1)
rejections <- replicate(10000, reject(N))
mean(rejections)

# Note that, not surprisingly, the power is lower than 10%. Repeat the exercise above for samples sizes of 30, 60, 90 and 120. Which of those four gives you power of about 80%?
rejections30 <- replicate(10000, reject(30, 0.01))
mean(rejections30)

rejections60 <- replicate(10000, reject(60, 0.01))
mean(rejections60)

rejections90 <- replicate(10000, reject(90, 0.01))
mean(rejections90)
