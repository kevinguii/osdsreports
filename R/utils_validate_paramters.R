#' Validate Parameters
#'
#' @description Validate the provided parameters to ensure they are correct.
#'
#' @param adm_level A numeric specifying ADM level
#' @param adm_name A string specifying the name of the ADM
#' @param df A data frame provided
#' @param year A numeric specifying year
#'
#' @returns nothing; stops execution if parameters are invalid
#'

validate_parameters <- function(adm_level=0, adm_name=NULL, df=NULL, year=NULL, parameterized=TRUE) {

  if (!(year %in% unique(df$YR))) {
    stop("Invalid year provided")
  }
  if (parameterized){
    if(adm_level == 0){
      stop("Please use render_national function to render a national report")
    }
    if (!(adm_level %in% unique(df$ADM_LEVEL))) {
      stop("Invalid ADM level provided")
    }
    if (!(toupper(adm_name) %in% df[[paste0("ADM", adm_level)]])) {
      stop("Invalid ADM name provided")
    }
  }



}
