#' Concat strings
#' 
#' Concatenate two strings into one similar to paste0
#' 
#' @param x string 1
#' @param y string 2
#' 
#' @export

`%+%` <- function(x, y){
  paste0(x, y)
}
