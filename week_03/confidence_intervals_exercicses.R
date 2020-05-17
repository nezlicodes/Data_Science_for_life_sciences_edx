library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

library(dplyr)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)

# what do we add and subtract to obtain a 99% confidence interval 
set.seed(1)
N<-25
dat.ns <- sample(bwt.nonsmoke, N) 
dat.s <- sample(bwt.smoke, N)
qt(0.995,48)*sqrt( sd( dat.ns)^2/N + sd( dat.s)^2/N )


set.seed(1)
N<-5
dat.ns <- sample(bwt.nonsmoke, N) 
dat.s <- sample(bwt.smoke, N)
t.test(dat.ns,dat.s)$p.value
