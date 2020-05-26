X <- matrix(c(1,3,2,1,-2,1,1,1,-1), 3,3)
beta <- c(3,2,1)
X%*%beta

# Solve the following system of equations using R:
# 3a+4b−5c+d=10 
# 2a+2b+2c−d=5 
# a−b+5c−5d=7 
# 5a+d=4

X <- matrix(c(3,2,1,5,4,2,-1,0,-5,2,5,0,1,-1,-5,1),4,4)
y <- matrix(c(10,5,7,4), 4,1)
solve(X)%*%y

# Load the following two matrices into R:
a <- matrix(1:12, nrow=4)
b <- matrix(1:15, nrow=3)

product <- a%*%b
# What is the value in the 3rd row and the 2nd column of the matrix product of a and b?
product[3,2]

# Multiply the 3rd row of a with the 2nd column of b, using the element-wise vector multiplication with *.
# What is the sum of the elements in the resulting vector?
product2 <- a[3,] * b[,2]
sum(product2)

