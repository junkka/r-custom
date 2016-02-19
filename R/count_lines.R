#' Count lines in R files
#'
#' Count lines in all R files in a certain path.
#'
#' @param path directory path
#' @export
#' @examples
#' count_lines()
#' 


count_lines <- function(path = "."){
  x <- system(paste0("find ", path," -name '*.R' | xargs wc -l"), intern = TRUE)
  lines <- as.integer(gsub("^( )*([0-9]*)(.*)", "\\2", x))
  file <- gsub("^( )*[0-9]* ", "", x)
  res <- data.frame(file, lines, stringsAsFactors = FALSE)
  message(paste("Total:", res$lines[nrow(res)]))
  res[-nrow(res), ]
}