#' Render a National Report
#'
#' @description Given a data frame containing population data (df), the
#' name of the country (country_name), and the year (yr), return a single
#' national report based on the given parameters
#'
#' @author Kevin Gui

#'
#' @param df A data frame provided
#' @param country_name A string of the name of the country
#' @param year A numeric specifying year
#'
#' @import quarto
#' @import fs
#' @import here
#' @import jsonlite
#'
#' @returns renders a single national report stored in the /reports/ directory
#'
#' @examples
#' render_national(country_data,"USA",2017)
#'
#'
#' @export

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
  file_name = paste0(country_name,"_",year)
  output_dir <- fs::dir_create(here::here("reports",file_name))
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
