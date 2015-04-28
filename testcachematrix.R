testCacheMatrix <- function() {
    # Test cache matrix functions.
    # Requires functions:
    #   makeCacheMatrix()
    #   cacheSolve()
    # Source:
    #   cachematrix.R

    # create a test matrix using cache function
    data = matrix(c(2, 0, 0, 1), nrow = 2, ncol = 2, byrow = TRUE)
    m <- makeCacheMatrix()
    m$set(data)

    # show cached matrix
    print("matrix")
    print(m$get())

    # show inverse of matrix
    m.inv <- cacheSolve(m)
    print("inverse of matrix")
    print(m.inv)

    # compare with expected inverse
    inverse = matrix(c(0.5, 0, 0, 1), nrow = 2, ncol = 2, byrow = TRUE)
    print("is inverse correct?")
    print(m.inv == inverse)
}
