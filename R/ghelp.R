#' GitHub help
#'
#' Search GitHub for R code examples.
#'
#' @param topic character. A search string.
#' @param in_cran logical. If TRUE the search is limited to CRAN 
#'   repositories
#' @source \url{https://gist.github.com/hrbrmstr/32e9c140129d7d51db52}
#' @export
#' @import htmltools rvest xml2
#' @examples
#' ghelp('vapply')
#' 


ghelp <- function(topic, in_cran=TRUE) {
  # github search URL base
  base_ext_url <- "https://github.com/search?utf8=%%E2%%9C%%93&type=Code&q=%s+extension%%3AR"
  ext_url <- sprintf(base_ext_url, topic)

  # if searching with user:cran (the default) add that to the URL  
  if (in_cran) ext_url <- paste(ext_url, "+user%3Acran", sep="", collapse="")
  
  pg <- read_html(ext_url)
  res_div <- as.character(html_nodes(pg, "div#code_search_results"))
  
  # clean up the HTML a bit   
  res_div <- gsub('How are these search results\\? <a href="/contact">Tell us!</a>', '', res_div)
  # include a link to the results at the top of the viewer
  res_div <- gsub('href="/', 'href="http://github.com/', res_div)
  # build the viewer page, getting CSS from github-proper and hiding some cruft
  for_view <- sprintf('<html><head><link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github/index-4157068649cead58a7dd42dc9c0f2dc5b01bcc77921bc077b357e48be23aa237.css" media="all" rel="stylesheet" /><style>body{padding:20px}</style></head><body><a href="%s">Show on GitHub</a><hr noshade size=1/>%s</body></html>', ext_url, res_div)
  # this makes it show in the viewer (or browser if you're using plain R)
  html_print(HTML(for_view))
  
} 