#' Batch Render Reports for an ADM Level
#'
#' @description Given a data frame of data (df), a specified administrative
#' level (adm_level), the name of the country (country_name), and a specified
#' year (year), generates a batch of reports for every unique entity in the
#' given administrative level
#'
#' @author Kevin Gui
#'
#'
#' @param df A data frame containing population data
#' @param adm_level A numeric specifying ADM level
#' @param country_name A string of the name of the country
#' @param year A numeric specifying year
#'
#' @import quarto
#' @import fs
#' @import here
#' @import jsonlite
#'
#' @returns renders all reports report stored in a folder in the /reports/
#' directory
#'
#' @examples
#' render_all(country_data,1,"USA",2017 )
#'
#'
#' @export

###
# DOES NOT WORK YET
###

render_all <- function(df,adm_level,country_name,year){
  adm_level_match <- paste0("ADM",adm_level)
  for (adm_name in unique(df[[adm_level_match]])){

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
  }

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



