#' A minimalist ggplot2 theme for ploting rasters
#'
#' Adapted from \href{https://github.com/hadley/ggplot2/wiki/Themes}{ggplot2 wiki}
#' @param base_size \code{numeric} base font size
#' @param base_family \code{character} base font family
#'
#' @return An object of class [ggplot2::theme()].
#' @export
theme_fullframe = function (base_size = 12, base_family = ""){
  ggplot2::theme_grey(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      plot.subtitle = element_text(margin = margin()),
      axis.line = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_blank(),
      axis.ticks.length = grid::unit(0, "lines"),
      #legend.position = "none",
      panel.background = ggplot2::element_blank(),
      panel.border = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      panel.spacing = grid::unit(0, "lines"),
      plot.background = ggplot2::element_blank(),
      strip.background = ggplot2::element_rect(colour = "#ffffff", fill="#eeeeee")
    )
}


#' A minimalist ggplot2 theme for ploting geographic rasters
#'
#' Alters \code{\link{theme_fullframe}} by adding x axis elements to indicate
#' longitude. This theme is used for illustrating [raster::rotate()]
#' @param base_size \code{numeric} base font size
#' @param base_family \code{character} base font family
#'
#' @return An object of class [ggplot2::theme()].
#' @export
theme_geographic = function (base_size = 12, base_family = ""){
  theme_fullframe(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(axis.text.x = ggplot2::element_text(),
          axis.ticks = ggplot2::element_line(colour = "#aaaaaa", size = 0.2),
          axis.ticks.length = grid::unit(1, "mm")
    )
}
