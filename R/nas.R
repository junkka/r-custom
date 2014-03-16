#' Show NA
#' 
#' Get count of NA and non NA in vector
#' @param x A vector
#' @return A table with counts of NA TRUE and FALSE
#' @author Johan Junkka
#' @export
nas <- function(x){
  if (!is.vector(x)) stop("x must be a vector")
  return(table(!complete.cases(x)))
}
