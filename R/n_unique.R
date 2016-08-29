#' Count unique
#'
#' Count unique entries in a vector of in all columns of a
#' data.frame
#'
#' @param x a vector or data.frame
#' @author Johan Junkka \email{johan.junkka@@gmail.com}
#' @export
#' @examples
#' x <- data.frame(
#'  'a' = rep(1:4, 2),
#'  'b' = rep(1:2, 4)
#' )
#' n_unique(x)
#' n_unique(x$a)
#' 


n_unique <- function(x) {
  if (is.vector(x))
    length(unique(x))
  else if (inherits(x, c("matrix", "data.frame")))
    apply(x, 2, function(y) length(unique(y)))
  else return(NA)
}
