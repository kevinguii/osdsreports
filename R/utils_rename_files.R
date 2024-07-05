#' Rename a file
#'
#' @description Given a file (file) and what you want to rename it
#' to (new_name), renames a file
#'
#'
#' @param file The file that you want to rename
#' @param new_name The name that you want to rename the original file to
#'
#' @import tools
#'
#' @returns the new name of the file
#'
#' @examples
#' rename_file("country1.pdf","country2")
#'
#'
rename_file <- function(file,new_name){
  extension <- tools::file_ext(file)
  final_name <- paste0(new_name,'.',extension)
  return(final_name)
}
