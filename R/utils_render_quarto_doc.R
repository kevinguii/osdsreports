#' Render Quarto Document
#'
#' @description Render the Quarto document with the given parameters.
#'
#' @param df A data frame provided
#' @param shp A shape file
#' @param adm_level A numeric specifying ADM level
#' @param adm_name A string specifying the name of the ADM
#' @param country_name A string of the name of the country
#' @param year A numeric specifying year
#' @param parameterized Whether asking for a parameterized report or not
#' @param batch Whether asking for a batch report or not
#'
#'
render_quarto_document <- function(df=NULL, shp=NULL, adm_level=NULL, adm_name=NULL, country_name=NULL, year=NULL, parameterized=TRUE, batch = FALSE) {

  #BATCH REPORTING: runs parameterized report then renames each file
  if (batch){
    quarto::quarto_render(
      input = here::here("quarto", "report_parameterized.qmd"),
      execute_params = list(
        df = jsonlite::toJSON(df, factor = 'string'),
        shp = geojsonsf::sf_geojson(shp),
        adm_level = adm_level,
        adm_name = adm_name,
        country_name = country_name,
        year = year
      )
    )
    new_file_name <- paste0(here::here("quarto"),"/",adm_name,"_ADM",adm_level,".pdf")
    file.rename(here::here("quarto","report_parameterized.pdf"),new_file_name)

  }
  #SUBNATIONAL REPORT: runs single parameterized report
  else if (parameterized){
    quarto::quarto_render(
      input = here::here("quarto", "report_parameterized.qmd"),
      execute_params = list(
        df = jsonlite::toJSON(df, factor = 'string'),
        shp = geojsonsf::sf_geojson(shp),
        adm_level = adm_level,
        adm_name = adm_name,
        country_name = country_name,
        year = year
      )
    )
  }
  #NATIONAL REPORT: runs single national report
  else{
    quarto::quarto_render(
      input = here::here("quarto","report_national.qmd"),
      execute_params = list(
        df = jsonlite::toJSON(df,factor = 'string'),
        shp = geojsonsf::sf_geojson(shp),
        country_name = country_name,
        year = year
      )
    )  }

}
