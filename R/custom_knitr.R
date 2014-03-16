#' Knit HTML with template
#' 
#' Compile .Rmd file to html with custom bootstrap template. Naming convention filename/filename.Rmd
#' @param file Name of .Rmd file
#' @param title Title in meta
#' @param homeD Name of root dirctory of project
#' @param preview Logical, if true will show html in Google Chrome
#' @export

knitHTML <- function(file, title=file, homeD = homeD, preview = TRUE){
  x <- getwd()
  on.exit(setwd(x))
  setwd(paste0(homeD, file))
  
  template_loc <- paste0(system.file(package="rcustom"), '/template/bootstrap-tmpl.html')
  knitr::knit2html(paste0(file, ".Rmd"), template=template_loc, title=file)
  
  if (preview) system(paste0("google-chrome ", file, ".html", " &"))
}

#' Knit PDF with Pandoc
#' 
#' Compile .Rmd file to .pdf with knitr and pandoc. Naming convention filename/filename.Rmd
#' @param file Name of .Rmd file
#' @param homeD Name of root dirctory of project
#' @param preview Logical, if true will show html in Google Chrome
#' @export


knitPDF <- function(file, homeD, preview = TRUE){
  x <- getwd()
  on.exit(setwd(x))
  setwd(paste0(homeD, file))
  
  knitr::knit(paste0(file, ".Rmd")); 
  system(paste0("pandoc -o ", file, ".pdf -s ", file, ".md"))
  # Convert to utf-8
  # system(iconv -t utf-8 "myfile.md" | pandoc -o "myfile.docx"| iconv -f utf-8);
  #system(paste("iconv -t utf-8 \"", file, ".md\" | ", 
  #  " pandoc -o \"", file, ".pdf\" | iconv -f utf-8", sep=""))  
  if (preview) system(paste0("evince ", file, ".pdf", " &"))
}