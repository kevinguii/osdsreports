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

  validate_parameters(adm_level, adm_name, df, year,parameterized=TRUE)

  render_quarto_document(df, adm_level, adm_name, country_name, year,parameterized=TRUE)

  file_name = paste0(toupper(adm_name),"_ADM",adm_level,"_",year)
  output_dir <- fs::dir_create(here::here("reports",file_name))

  move_rendered_files(file_name, output_dir)

}
