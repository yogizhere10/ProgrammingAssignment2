## Put comments here that give an overall description of what your
## functions do

####This function Function makeCacheMatrix gets a matrix as an input, set the value of the matrix in set_matrix(),
#get the value of the matrix in get_matrix(), set the inverse Matrix in set_Inverse() and get the inverse Matrix in get_Inverse().

makeCacheMatrix <- function(x = matrix()) {
  imat <- NULL
  set_matrix <- function(b) {
    x <<- b
    imat <<- NULL
    #<<- operator is used to assign a value to an object in an environment that is different
  }
  get_matrix <- function() x                           #get the value of the Matrix
  set_Inverse <- function(inverse) imat <<- inverse     #set the value of the invertible matrix
  get_Inverse <- function() imat                        #get the value of the invertible matrix
  list(set_matrix = set_matrix,
       get_matrix = get_matrix,                   # gives the name 'set_matrix' to the set_matrix() function              
       set_Inverse = set_Inverse,            
       get_Inverse = get_Inverse)             

}

# In order to obtain output of makeCacheMatrix in the form of list. It allows to use $ operator to access function by name rather than [[]] operator.
## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  imat <- x$get_Inverse()
  if (!is.null(imat)) {
    print("Got Cached Inverse of Matrix")
    return(imat)
  }
  mat_dat <- x$get_matrix()
  imat <- solve(mat_dat, ...)
  x$set_Inverse(imat)
  return(imat)
        ## Return a matrix that is the inverse of 'x'
}



