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

  validate_parameters(adm_level=0,df=df,year=year,parameterized = FALSE)

  render_quarto_document(df=df,country_name = country_name, year = year, parameterized = FALSE)

  # file_name = paste0(toupper(country_name),"_ADM0_",year)
  # output_dir <- fs::dir_create(here::here("reports",file_name))
  #
  # move_rendered_files(file_name, output_dir)

}
