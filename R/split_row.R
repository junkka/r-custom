#' Split Rows
#' 
#' Split rows in data.frame if split point falls between start and end of range in data.frame
#' @param df A data.frame
#' @param splitAt A number specifing the point within range to split at
#' @param id The name of id column, default is "id"
#' @param start The name of start of range column, default is "start"
#' @param end The name of end of range column, default is "end"
#' @return A data.frame with new start and end range, group, start_type and end_type
#' @author Johan Junkka
#' @export

split_rows <- function(df, splitAt, id ="id", start = "start", end = "end"){
  
  if (!is.data.frame(df)) stop("df must be a data.frame")

  # Determin if row should be split
  splitRow <- ifelse( df[ ,start] < splitAt & df[ ,end] > splitAt, TRUE, FALSE)
  splitRow[is.na(splitRow)] <- FALSE
  
  # for each row check if split and make new start
  dfid      <- df[ ,id]
  df.end  <- df[ ,end]
  
  rowOne <- data.frame(
    id         = dfid,
    start      = df[ ,start],
    end        = ifelse(splitRow == TRUE, splitAt, df.end),
    group      = ifelse(df[ ,start] < splitAt, 0, splitAt),
    start_type = rep(0, length(df[ ,id])),
    end_type   = ifelse(splitRow == TRUE, 1, 0)
  )
  
  # make new
  new.id <- c()
  new.end <- c()
  
  for (j in 1:length(dfid)){
    # if splitRow is true populate new vectors
    if (splitRow[j] == TRUE) {
      k <- length(new.id)+1
      new.id[k]  <- dfid[j]
      new.end[k] <- df.end[j]
    }
  }
  
  rowTwo <- data.frame(
    id          = new.id,
    start       = rep(splitAt, length(new.id)),
    end         = new.end,
    group       = rep(splitAt, length(new.id)),
    start_type  = rep(1, length(new.id)),
    end_type    = rep(0, length(new.id))
  )
  
  df <- rbind(rowOne,rowTwo)
  
  return(df[order(df$id, df$start), ])
  
}
