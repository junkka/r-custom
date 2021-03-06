#' List objects in environment
#'
#' With size and dimensions
#'
#' @param ... pass to \code{.ls.object}
#' @param n integer. Number of objects to display.
#' @source \url{http://stackoverflow.com/questions/1358003}
#' @export

ll <- function(..., n = 20) {
    .ls.objects(..., order.by="Nsize", decreasing=TRUE, head=TRUE, n=n)
}

.ls.objects <- function (pos = 1, pattern, order.by,
                        decreasing=FALSE, head=FALSE, n=5) {
    napply <- function(names, fn) sapply(names, function(x)
                                         fn(get(x, pos = pos)))
    names <- ls(pos = pos, pattern = pattern)
    obj.class <- napply(names, function(x) as.character(class(x))[1])
    obj.mode <- napply(names, mode)
    obj.type <- ifelse(is.na(obj.class), obj.mode, obj.class)
    obj.size <- napply(names, function(x) {
        format(utils::object.size(x), units = "auto") 
    })
    obj.nsize <- napply(names, object.size)
    obj.dim <- t(napply(names, function(x)
                        as.numeric(dim(x))[1:2]))
    vec <- is.na(obj.dim)[, 1] & (obj.type != "function")
    obj.dim[vec, 1] <- napply(names, length)[vec]
    out <- data.frame(obj.type, obj.size, obj.dim, obj.nsize)
    names(out) <- c("Type", "Size", "Rows", "Columns", "Nsize")
    if (!missing(order.by))
        out <- out[order(out[[order.by]], decreasing=decreasing), ]
    if (head)
        out <- head(out, n)
    out
}
