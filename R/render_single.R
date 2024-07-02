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

render_single <- function(df,adm_level,adm_name,country_name,year){
  if(adm_level==0){
    stop("Please use render_national function to render a national report")
  }

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

  output_dir <- fs::dir_create(here::here("reports"))
  file_name = paste0(adm_name,"_ADM",adm_level,"_",year)
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
