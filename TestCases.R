## TestCases (cachematrix.R)
source('~/ProgrammingAssignment2/cachematrix.R')

## Create a square matrix of random normal variabes
s <- 3
m <- matrix(rnorm(s*s),nrow=s,ncol=s)
var <- makeCacheMatrix(m)

## Verify that cache is NULL
print(var$getinverse())

## Cache the inverse of the matrix
print(cacheSolve(var))

## Make sure cache is used when cache is set
print(cacheSolve(var))

## Verify that the cache is identical to the inverse of the original matrix
print(paste("Identical:",identical(var$getinverse(),solve(m))))
