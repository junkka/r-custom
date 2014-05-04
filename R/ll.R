#' List Objects in Environment
#'
#' Shows objects name and class in local environment. An extention of base::ls.
#' @param order_by = "class" Order by "class" or "object"
#' @export
#' @return A matrix containing name and class of objects
#' @author Johan Junkka

ll <- function (order_by="class") 
{
    xobjectsinenv <- as.data.frame(cbind(sapply(ls(envir = .GlobalEnv), 
      function(xaobject) {
        x <- class(get(xaobject))
        x[1]
      }
    )))
    if (nrow(xobjectsinenv) <= 0)
      xobjectsinenv <- "Empty environment"
    x <- data.frame("object" = rownames(xobjectsinenv), "class" = xobjectsinenv[,1])
    x <- x[order(x[,c(order_by)]), ]
    print(x, row.names=FALSE)
}