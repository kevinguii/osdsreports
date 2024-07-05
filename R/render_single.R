#' Render a Single Parameterized Report
#'
#' @description Given a data frame containing population data (df), a specified
#' administrative level (adm_level), the name of the region (adm_name), the
#' name of the country (country_name), and the year (yr), return a single
#' report based on the given parameters
#'
#' @author Kevin Gui
#'
#' @param df A data frame provided
#' @param adm_level A numeric specifying ADM level
#' @param adm_name A string specifying the name of the ADM
#' @param country_name A string of the name of the country
#' @param year A numeric specifying year
#'
#' @import quarto
#' @import fs
#' @import here
#' @import jsonlite
#'
#' @returns renders a single report stored in the /reports/ directory
#'
#' @examples
#' render_single(country_data,1,"California","USA",2017)
#'
#'
#' @export

render_single <- function(df,adm_level,adm_name,country_name,year){
  if(adm_level==0){
    stop("Please use render_national function to render a national report")
  }

  quarto::quarto_render(
    input = here::here("quarto","report_parameterized.qmd"),
    output_format = "all",
    execute_params = list(
      df = jsonlite::toJSON(df,factor = 'string'), # Serialize the data frame
      adm_level = adm_level,
      adm_name = adm_name,
      country_name = country_name,
      year = year
    )
  )
  file_name = paste0(adm_name,"_ADM",adm_level,"_",year)
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
