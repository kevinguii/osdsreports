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

###
# DOES NOT WORK YET
###
render_all <- function(df,adm_level,adm_name,year){
  adm_level <- paste0("ADM",adm_level)
  for (adm in unique(df[[adm_level]])){


      }
}



