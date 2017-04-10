#' Anonymize ID
#'
#' Create anonymized ID from any vector
#'
#' @param x vector of values
#' @export
#' @examples
#' anonymize_id(c("b", "a", "d", "a"))
#' 


anonymize_id <- function(x) {
  y <- as.factor(x) 
  uns <- unique(x)
  levels(y) <- match(levels(y), as.character(uns))
  as.numeric(as.character(y))
} 
