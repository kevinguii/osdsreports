#' Render Quarto Document
#'
#' @description Render the Quarto document with the given parameters.
#'
#' @param df A data frame provided
#' @param adm_level A numeric specifying ADM level
#' @param adm_name A string specifying the name of the ADM
#' @param country_name A string of the name of the country
#' @param year A numeric specifying year
#'
render_quarto_document <- function(df=NULL, shp=NULL, adm_level=NULL, adm_name=NULL, country_name=NULL, year=NULL, parameterized=TRUE) {

  if (parameterized){
    quarto::quarto_render(
      input = here::here("quarto", "report_parameterized.qmd"),
      execute_params = list(
        df = jsonlite::toJSON(df, factor = 'string'),
        shp = sf_geojson(shp),
        adm_level = adm_level,
        adm_name = adm_name,
        country_name = country_name,
        year = year
      )
    )
  } else{
    quarto::quarto_render(
      input = here::here("quarto","report_national.qmd"),
      execute_params = list(
        df = jsonlite::toJSON(df,factor = 'string'),
        country_name = country_name,
        year = year
      )
    )  }

}
