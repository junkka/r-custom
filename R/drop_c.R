#' Drop column from data.frame
#' 
#' Drops specified column from data.frame
#' @param df A data.frame
#' @param columns A character of vector of characters representing column names
#' @author Johan Junkka
#' @export

drop_c <- function(df, columns){
  if (!is.data.frame(df)) {
    stop("df must be a data.frame")
  } else if (!is.character(columns)) {
    stop("columns must be a character or vector of characters")
  } else {
    for (j in 1:length(columns)) {
      if ( with(df, !exists(columns[j]) )) {
        stop(paste("Column", columns[j], "not in data.frame"))
      }
    }    
  }
  
  df <- df[ ,!(names(df) %in% columns)]
  
  return(df)
  
}