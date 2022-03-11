## A function creates a matrix object that will cache its Inverse 
## the Inverse matrix will be stored in the global environment.
## 
makeCacheMatrix <- function(x = matrix()) {
  ##initiate inverse matrix
  inOfMatrix <- NULL
  ##define the set function for the matrix
  set <- function(y){
    x<<-y
    iMatrix<<-NULL
  }##returns matrix through 'get' object
  get<-function() x
  ##sets the inverse matrix
  setInverse <- function(makeInverse) inOfMatrix <<- makeInverse
  ##returns the inverse matrix
  getInverse <- function() inOfMatrix
  list(set=set, 
       get=get,
       setInverse=setInverse,
       getInverse=getInverse)
}
## cacheSolve does the inverse of a matrix returned by makCacheMatrix above, 
##But, if it has already been inverse then it is retrieved from the cache. 

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the Inverse of 'x'
  inOfMatrix <- x$getInverse()
    if(!is.null(inOfMatrix)){
    message(" showing cached data")
    inOfMatrix
  }
  d <- x$get() ##gets the matrix object and stores into 'd' object
  inOfMatrix <- solve(d, ...) ##inverse the matrix and stores in iMatrix object
  x$setInverse(inOfMatrix)
  inOfMatrix
}
