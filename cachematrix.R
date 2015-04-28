makeCacheMatrix <- function(x = matrix()) {
        # Cache a matrix and store its inverse.
        # This wraps a matrix and provides accessor functions
        # to return it and the matrix inverse.
        #
        # Args
        #   x: matrix to cache in environment
        #
        # Returns
        #   A list of matrix accessor functions to get and set matrix cache.

        # initialise the matrix and its inverse
        cacheMatrix <<- x
        cacheInverse <<- NULL

        # save matrix to cache
        set <- function(x) {
                cacheMatrix <<- x
                cacheInverse <<- NULL
        }

        # return matrix from cache
        get <- function() {
                return(cacheMatrix)
        }

        # save inverse of matrix to cache
        setInverse <- function(x) {
                cacheInverse <<- x
        }

        # return inverse of matrix from cache
        getInverse <- function() {
                return(cacheInverse)
        }

        # return matrix accessor functions as list
        return(list(set = set, get = get,
                        setInverse = setInverse, getInverse = getInverse))
}

cacheSolve <- function(x, ...) {
        # Calculate matrix inverse.
        #
        # Args
        #   x: a cache matrix generated using makeCacheMatrix()
        #
        # Returns
        #   The solved matrix. i.e. The inverse of this matrix.

        # try to retrieve inverse of matrix x
        inverse <- x$getInverse()

        # if inverse not available then need to solve and save to cache
        # otherwise return with result
        if (is.null(inverse)) {
                inverse <- solve(x$get(), ...)
                x$setInverse(inverse)
        }

        # return a matrix that is the inverse of 'x'
        return(inverse)
}
