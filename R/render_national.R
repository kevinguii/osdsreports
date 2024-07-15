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
#' @param output_file Path to save the rendered document
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

render_national <- function(df,country_name,year,output_dir){

  validate_parameters(adm_level=0,df=df,year=year,parameterized = FALSE)

  render_quarto_document(df=df,country_name = country_name, year = year, parameterized = FALSE)

  # output_dir <- fs::dir_create(output_dir)
  #
  # move_rendered_files(output_dir)

}
