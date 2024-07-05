#' Batch Render Reports for an ADM Level
#'
#' @description
#'
#' @author Kevin Gui

#'
#' @import sf
#' @import ggplot2
#' @import tidyverse
#' @import patchwork
#' @import png
#' @import ggpubr
#' @import showtext
#' @import gridtext
#' @import grid
#'
#' @returns
#'
#' @examples

theme_map_pyr <- function(...){
  theme(
    plot.title.position = "plot",
    text = element_text(family = "Lato"),

    # background colors
    plot.background = element_rect(fill = "transparent",
                                   color = NA),
    panel.background = element_rect(fill = "transparent",
                                    color = NA),
    legend.background = element_rect(fill = "transparent",
                                     color = NA),
    # borders and margins
    panel.border = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),

    # titles
    legend.text = element_text(size = 13,
                               color = "black",
                               family = "Lato"),
    plot.title = element_text(size = 14,
                              color = "black"),
    plot.subtitle = element_text(size = 10,
                                 color = "black"),
    ...
  )
}
