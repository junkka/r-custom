#' List Objects 
#' 
#' Shows objects name and class in local environment. An extention of base::ls.
#' @return A matrix containing name and class of objects
#' @author Johan Junkka
#' @export

lis <- function(){
  xobjectsinenv <- cbind(sapply(ls(envir=.GlobalEnv),function(xaobject){class(get(xaobject))})) 
  if (nrow(xobjectsinenv) <= 0) xobjectsinenv <- 'Empty environment'
  return(xobjectsinenv)
}