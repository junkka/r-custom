#' Frequency table
#'
#' Generate a frequency table from a vector, containing 
#' frequencies, cumulative frequency and proportional.
#'
#' @param x a vector
#' @author Johan Junkka \email{johan.junkka@@gmail.com}
#' @export
#' @examples
#' x <- sample(LETTERS[1:10], 44, TRUE)
#' freq_t(x)
#' 


freq_t <- function(x){
  tbl <- table(x)
  y <- cbind(freq=tbl, cumul=cumsum(tbl), relative=prop.table(tbl))
  y <- data.frame(group = names(tbl), y)
  rownames(y) <- c(1:nrow(y))
  y
}