## A function creates a matrix object that will cache its Inverse 
## the Inverse matrix will be stored in the global environment.
## 
makeCacheMatrix <- function(x = matrix()) {
  ##initiate inverse matrix
  iMatrix <- NULL
  ##define the set function for the matrix
  set <- function(y){
    x<<-y
    iMatrix<<-NULL
  }##returns matrix through 'get' object
  get<-function() x
  ##sets the inverse matrix
  setInverse <- function(makeInverse) iMatrix <<- makeInverse
  ##returns the inverse matrix
  getInverse <- function() iMatrix
  list(set=set, 
       get=get,
       setInverse=setInverse,
       getInverse=getInverse)
}
## cacheSolve does the inverse of a matrix returned by makCacheMatrix above, 
##But, if it has already been inverse then it is retrieved from the cache. 

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the Inverse of 'x'
  iMatrix <- x$getInverse()
  ##message appears if the data is already present and returns the data
  if(!is.null(iMatrix)){
    message("cached data")
    iMatrix
  }
  d <- x$get() ##gets the matrix object and stores into 'd' object
  iMatrix <- solve(d, ...) ##inverse the matrix and stores in iMatrix object
  x$setInverse(iMatrix)
  iMatrix
}
