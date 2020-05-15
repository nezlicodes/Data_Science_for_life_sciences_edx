library(downloader)
url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- basename(url)
download(url,filename)


femaleMiceWeights <- read.csv(filename)
head(femaleMiceWeights)



## View entire dataset
View(femaleMiceWeights)
