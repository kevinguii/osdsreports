#' Render a National Report
#'
#' @description Given a data frame containing population data (df), the
#' name of the country (country_name), and the year (yr), return a single
#' national report based on the given parameters
#'
#' @author Kevin Gui

#'
#' @param df A data frame provided
#' @param shp A shape file
#' @param country_name A string of the name of the country
#' @param year A numeric specifying year
#' @param output_file Path to save the rendered document
#'
#' @import quarto
#' @import fs
#' @import here
#' @import jsonlite
#'
#' @returns renders a single national report for the given country
#'
#' @examples
#' render_national(country_data,adm0_shpae,"USA",2017)
#'
#'
#' @export

render_national <- function(df, shp, country_name, year){

  validate_parameters(adm_level=0,df=df,year=year,parameterized = FALSE)

  render_quarto_document(df=df, shp=shp, country_name = country_name, year = year, parameterized = FALSE)

}
