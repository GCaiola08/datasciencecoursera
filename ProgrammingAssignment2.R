##Greg Caiola R Programming HW2


###DEMO FUNCTIONS
makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

 

 ## This is a function that takes a matrix as an input and caches the inverse of that matrix (via the solve function)
 

 makeCacheMatrix <- function(x = matrix()) { 
   m <- NULL
   set <- function(y) {
     x <<- y
     m <<- NULL
   }
   get <- function() x
   setinverse <- function(solve) m <<- mean
   getinverse <- function() m
   list(set = set, get = get,
        setinverse = setinverse,
        getinverse = getinverse)
  
 } 
 


 ## This function function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
 #If the inverse has already been calculated (and the matrix has not changed), 
 #then the cachesolve should retrieve the inverse from the cache
 

 cacheinverse <- function(x, ...) { 
         ## Return a matrix that is the inverse of 'x' 
   m <- x$getinverse()
   if(!is.null(m)) {
     message("getting cached data")
     return(m)
   }
   data <- x$get()
   m <- solve(data, ...)
   x$setinverse(m)
   m
 } 

