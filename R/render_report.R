#' Render a Report for a given ADM, ADM_LVL and YR
#'
#' @description Given an ADM shapefile (adm_sf) and population data (pop_data),
#' returns a choropleth plot containing scaled population values. Defaults to
#' log transformed population.
#'
#'
#' @param df data provided
#' @param adm_level A numeric specifying ADM level
#' @param adm_name A string specifying the name of the ADM
#' @param year A numeric specifying year
#'
#' @import quarto
#' @import fs
#' @import here
#'
#' @returns A population pyramid
#'
#' @export

render_report <- function(df,adm_level,adm_name,year){
  quarto::quarto_render(
    input = here::here("quarto","report1.qmd"),
    execute_params = list(
      df = jsonlite::toJSON(df,factor = 'integer'), # Serialize the data frame
      adm_level = adm_level,
      adm_name = adm_name,
      year = year
    )
  )


  #move to /reports directory in /quarto directory
  output_dir <- fs::dir_create(here::here("reports"))
  files <- fs::dir_ls(here::here("quarto"), regexp = ".html$|.docx$")
  fs::file_move(
    path = files,
    new_path = output_dir
  )


}
