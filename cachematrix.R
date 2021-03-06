#1st function create a matrix which is really a list containing a function to
#set the value of the vector
#get the value of the vector
#set the value of the mean
#get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y 
    inv <<- NULL 
  }
  get <- function() x 
  setinverse <- function(inverse) inv <<- inverse 
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


#2nd function calculates the inverse of the matrix from the 1st step
cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}
