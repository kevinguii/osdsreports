rename_file <- function(file,new_name){
  extension <- tools::file_ext(file)
  final_name <- paste0(new_name,'.',extension)
  return(final_name)
}
