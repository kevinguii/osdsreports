render_national <- function(df,country_name,year){
  quarto::quarto_render(
    input = here::here("quarto","report_national.qmd"),
    output_format = "all",
    execute_params = list(
      df = jsonlite::toJSON(df,factor = 'string'),
      country_name = country_name,
      year = year
    )
  )

  output_dir <- fs::dir_create(here::here("reports"))
  file_name = paste0(country_name,"_",year)
  path = here::here("quarto")

  #move to /reports directory in /quarto directory
  files <- fs::dir_ls(here::here("quarto"), regexp = ".html$|.docx$|.pdf$")
  new_file_names <- sapply(files, function(file) rename_file(file,file_name))

  for (i in seq_along(files)) {
    old_path <- files[i]
    new_path <- fs::path(output_dir, new_file_names[i])
    fs::file_move(old_path, new_path)
  }
}
