## Functions that are able to cache a matrix and its inverse.
## The cache, containing the inverse of the matrix, can be referenced 
## repetedly, thus avoiding potentially time-consuming computations of
## recalculating the inverse of the matrix.

## makeCacheMatrix(data) takes a matrix and returns a list object 
## containing 4 functions.
## set(), get() functions set/get the matrix data in the parent.env
## setinverse(), getinverse() set/get the inverse of the matrix in the parent.env

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(i) m <<- i
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## cacheSolve() operates on a list object created by makeCacheMatrix.
## If the matrix inverse has already been set in cache, it will return its value.
## If the matrix has not already been set in cache, it will calculate the inverse, 
## store it in cache and return its value.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  message("setting cached data")
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
