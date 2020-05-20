time = sort(nym.2002$time) %>% unlist

# What is the fastest time divided by the median time?
min(time)/median(time)


# What is the slowest time divided by the median time?
max(time)/median(time)


plot(time/median(time), ylim=c(1/4,4))
abline(h=c(1/2,1,2))


plot(log2(time/median(time)),ylim=c(-2,2))
abline(h=-1:1)
