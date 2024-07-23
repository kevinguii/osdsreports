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
#' @param shp A shape file
#' @param adm_level A numeric specifying ADM level
#' @param country_name A string of the name of the country
#' @param year A numeric specifying year
#'
#'
#' @returns renders all reports for an ADM level
#'
#' @examples
#' render_all(country_data,adm_1,shape,1,"USA",2017)
#'
#'
#' @export

render_all <- function(df, shp, adm_level, country_name, year){
  adm_level_match <- paste0("ADM",adm_level)

  #render all unique files
  for (adm_name in setdiff(unique(df[[adm_level_match]]),NA)){

    validate_parameters(adm_level, adm_name, df, year, parameterized=TRUE)

    render_quarto_document(df, shp, adm_level, adm_name, country_name, year, parameterized=TRUE, batch=TRUE)
  }

  #zip all files

  prev_dir <- getwd()
  setwd('./quarto')
  pdf_files <- list.files(pattern = "\\.pdf$", full.names = TRUE)
  zip("report_batch.zip",pdf_files)
  file.remove(pdf_files)
  setwd(prev_dir)

}



