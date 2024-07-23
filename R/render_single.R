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
#' @param shp A shape file
#' @param adm_level A numeric specifying ADM level
#' @param adm_name A string specifying the name of the ADM
#' @param country_name A string of the name of the country
#' @param year A numeric specifying year
#'
#' @import quarto
#' @import fs
#' @import here
#' @import jsonlite
#' @import geojsonsf
#'
#' @returns renders a single report
#'
#' @examples
#' render_single(country_data,1,adm_1_shape,"California","USA",2017)
#'
#'
#' @export

render_single <- function(df,shp,adm_level,adm_name,country_name,year){

  #validate the parameters
  validate_parameters(adm_level, adm_name, df, year, parameterized=TRUE)

  #render the document
  render_quarto_document(df, shp, adm_level, adm_name, country_name, year,parameterized=TRUE)

}
