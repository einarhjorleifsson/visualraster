#' Smooth gradient between two colours
#'
#' Overrides the default continuous gradient as a yellow to red
#' @param low Colour for low end of the gradient
#' @param high Colour for high end of the gradient
#' @param ... Other arguments passed on to [ggplot2::scale_fill_continuous()]
#' @export
scale_fill_continuous = function(low = "#FFFFB3", high = "#FB8072", ...) {
  ggplot2::scale_fill_gradient(low = low, high = high, guide = "none", ...)
}

#' Qualitative colour scale
#'
#' Overrides the default discrete gradient to use color brewer Set 3
#' @param values a set of ggplot2::aesthetic values to map data values to. If this is a
#' named vector, then the values will be matched based on the names. If unnamed,
#'  values will be matched in order (usually alphabetical) with the limits of
#'  the scale. Any data values that don't match will be given na.value.
#' @param ... Other arguments passed on to [ggplot2::scale_fill_manual()]
#' @export
scale_fill_discrete = function(values = RColorBrewer::brewer.pal(11, "Set3"), ...) {
  ggplot2::scale_fill_manual(values = values, guide = "none", ...)
}

#' Smooth gradient for diverging data
#'
#' @param low Colour for low end of the gradient
#' @param high Colour for high end of the gradient
#' @param center Colour for center of the gradient (default very close to white)
#' @param ... Other arguments passed on to [ggplot2::scale_fill_gradientn()]
#' @export
scale_fill_diverge = function(low = "#D53E4F", high = "#3288BD",
                                 center = "#FFFFBF", ...) {
  ggplot2::scale_fill_gradientn(colours = c(low, center, high), guide = "none", ...)
}
