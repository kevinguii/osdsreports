#' Generate Blurb Statistics
#'
#' @description Given a data frame of data (df), generates total population,
#' percentage of males, percentage of females, total population below 5 years of
#' age, and total working class people (age 15-65)
#'
#'
#' @param df A data frame containing population data
#'
#'
#' @returns a list containing total population, percentage of population that is
#' male, percentage of population that is female, total population of individuals
#' below 5 years of age, and total population that is in the working class
#'
#' @examples
#' generate_blurb(country_data)
#'

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
