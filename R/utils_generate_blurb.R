#' Generate blurb statistics
#'
#' @description Given a dataframe, generate the statistics for the blurb at the top of the report
#'
#'
#' @param df data provided
#'
#' @import
#'
#' @returns 5 statistics
#'
#' @export

generate_blurb <- function(df){

    total_pop <- sum(df$POP_TOTAL)
    formatted_total_pop <- format(total_pop, big.mark=',', scientific=FALSE)

    percent_male <- round(sum(df$POP_TOTAL[df$SEX == 'M']) / total_pop, 2) * 100
    percent_female <- round(sum(df$POP_TOTAL[df$SEX == 'F']) / total_pop, 2) * 100

    total_less5 <- sum(df$POP_TOTAL[df$AGE_CAT == '0_4'])
    formatted_total_less5 <- format(total_less5, big.mark=',', scientific=FALSE)

    working_class_range <- c("15_19", "20_24", "25_29", "30_34", "35_39", "40_44", "45_49", "50_54", "55_59", "60_64")
    total_working <- sum(df$POP_TOTAL[(df$AGE_CAT %in% working_class_range)])
    formatted_total_working <- format(total_working, big.mark=',', scientific=FALSE)

    return(c(formatted_total_pop, percent_male, percent_female, formatted_total_less5, formatted_total_working))
}
