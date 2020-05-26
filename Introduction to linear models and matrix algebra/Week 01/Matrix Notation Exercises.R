# Create the matrix from the vector 1:1000
# What is the entry in row 25, column 3 ?
X = matrix(1:1000,100,10)
# 
# Using the function cbind(), create a 10 x 5 matrix with first column x=1:10. Then use 2*x, 3*x, 4*x and 5*x respectively in columns 2 through 5.
# 
# What is the sum of the elements of the 7th row?
X[25,3]
x=1:10
X=cbind(x, x*2, x*3,x*4,x*5)
sum(X[7,])
