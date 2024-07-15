#' Move Rendered Files
#'
#' @description Move the rendered files to the appropriate directory.
#'
#' @param file_name The base name for the output files
#' @param output_dir The output directory

move_rendered_files <- function(output_dir) {

  cur_file <- fs::dir_ls(here::here("quarto"), regexp = ".html$|.docx$|.pdf$")
  fs::file_move(cur_file, output_dir)

}
