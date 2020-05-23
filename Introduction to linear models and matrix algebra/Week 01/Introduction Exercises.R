library(UsingR)
data("father.son")

#What is the average height of the sons (don't round off)?
data
mean(father.son$sheight)

# Using the father.son dataset described above, we want to know the expected height of sons if we condition on the father being 71 inches. Create a list of son heights for sons that have fathers with heights of 71 inches (round to the nearest inch).
#What is the mean of the son heights for fathers that have a height of 71 inches (don't round off your answer)?
mean(father.son$sheight[round(father.son$fheight) == 71])