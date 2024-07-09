#' Move Rendered Files
#'
#' @description Move the rendered files to the appropriate directory.
#'
#' @param file_name The base name for the output files
#' @param output_dir The output directory

move_rendered_files <- function(file_name, output_dir) {
  files <- fs::dir_ls(here::here("quarto"), regexp = ".html$|.docx$|.pdf$")
  new_file_names <- sapply(files, function(file) rename_file(file, file_name))

  for (i in seq_along(files)) {
    old_path <- files[i]
    new_path <- fs::path(output_dir, new_file_names[i])
    fs::file_move(old_path, new_path)
  }
}
