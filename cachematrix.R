## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## MakeCacheMatrix function expects a valid matrix object as the first argument and builds a list object out of it 
## using the four functions set, get, setinverse, getinverse and return the object to the caller

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inv) m <<- inv
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## cacheSolve function uses the list object and evaluates whether the matrix attribute m is a non null value
## If it is, it simply returns the matrix 
## However, if it was not initialized yet, the get attribute function is called which returns the original matrix
## the Matrix object is then passed to the R solve function which return the inverse of the matrix
## setinverse attribute function is then called to store the inverse matrix and the matrix returned to the caller

cacheSolve <- function(x, ...) {
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