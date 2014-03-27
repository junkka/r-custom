#' Show NA
#' 
#' Get counts and proportions of NA and non NA in vector
#' @param x A vector
#' @return A table with counts of NA TRUE and FALSE
#' @author Johan Junkka
#' @export
nas <- function(x){
  if (!is.vector(x)) stop("x must be a vector")
  result <- data.frame(table(!complete.cases(x)))
  result$Prop <- round((result$Freq/sum(result$Freq))*100, 3)
  return(result)
}
