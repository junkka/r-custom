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

#' Proportion NA in data.frame by column
#'
#' Calculates proportion of NA values by column in a data.frame
#'
#' @param x a data.frame
#' @author Johan Junkka \email{johan.junkka@@gmail.com}
#' @export
#' @examples
#' x <- data.frame(
#'   'a' = c(1:180, rep(NA, 20)), 
#'   'b' = c(1:160, rep(NA, 40)), 
#'   'c' = c(1:200)
#' )
#' nas_c(x)
#' 

nas_c <- function(x) {
  if (!inherits(x, 'data.frame')) stop('x must be a data.frame')
  if (nrow(x) < 1) stop('x is empty')

  nas_v <- function(x) {
    xx <- round((count(is.na(x))[2,2]/length(x))*100, 2)
    if (is.na(xx)) xx <- 'Non'
    return(xx)
  }
  y <- ldply(x, .fun=nas_v)
  return(y)
}