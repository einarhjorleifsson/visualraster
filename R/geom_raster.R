#' Custom plot for Visual Raster
#'
#' Uses discrete values (maximum 11)
#' @param r \code{Raster*}
#' @param color \code{color} line colors
#' @param size \code{integer} line size
#' @param ... other arguments passed to [ggplot2::geom_tile()].
#' @export
vr_geom_raster = function(r, color = I("#222222"), size = I(0.2), ...) {
  list(
    ggplot2::geom_tile(data = as_data(r),
              ggplot2::aes(x = x, y = y, fill = factor(round(value))),
              color = color, size = size, ...),
    ggplot2::coord_equal()
  )
}

#' Custom visual raster plot for sequential data
#'
#' @param r \code{Raster*}
#' @param color \code{color} line colors
#' @param size \code{integer} line size
#' @details if \code{ncell(r) > 5e2} will use geom_raster by default for
#' performance
#' @param ... other arguments passed to [ggplot2::geom_tile()].
#' @export
vr_geom_raster_seq = function (r, color = I("#222222"), size = I(0.2), ...) {
  if(ncell(r) > 5e2) {
    # use raster if the number of cells is too high
    geo = ggplot2::geom_raster(data = as_data(r), ggplot2::aes(x, y, fill = value))
  } else {
    geo = ggplot2::geom_tile(data = as_data(r),
                    ggplot2::aes(x = x, y = y, fill = value, label = round(value, 1)),
                    color = color, size = size, ...)
  }
  list(
    geo,
    ggplot2::coord_equal()
  )
}

#' Custom visual raster plot for diverging data
#'
#' @param r \code{Raster*}
#' @param ... other arguments passed to \code{\link{vr_geom_raster_seq}}
#' @export
vr_geom_raster_div = function (r, ...) {
  list(
    vr_geom_raster_seq(r, ...),
    scale_fill_diverge()
  )
}

#' Custom visual raster text plot (for raster values and indexes)
#'
#' @param r \code{Raster*}
#' @param color \code{color} line colors
#' @param label to override default labelling (raster values), you can provide
#' a vector of length \code{ncell(r)}
#' @param ... other arguments passed to [ggplot2::geom_text()]
#' @export
vr_geom_text = function (r, color = I("#222222"), label = NULL, ...) {
  dd = as_data(r)
  dd$value = round(dd$value, 1)
  if(is.null(label)) {
    ggplot2::geom_text(data = dd, ggplot2::aes(x = x, y = y, label = value), color = color, ...)
  } else {
    ggplot2::geom_text(data = dd, ggplot2::aes(x = x, y = y), label = label, color = color, ...)
  }
}

#' Custom visual raster point plot
#'
#' @param p \code{data.frame} containing a \code{x} and \code{y} column
#' @param size \code{integer} point size
#' @param color \code{color} line colors
#' @param fill \code{color} fill colors
#' @param shape shape of the point (default 21) see [ggplot2::geom_point()]
#' for details
#' @param ... other arguments passed to [ggplot2::geom_point()]
#' @export
vr_geom_point = function (p, size = 4, shape = 21, color = "#222222", fill = "#22222280", ...) {
  ggplot2::geom_point(data = p, ggplot2::aes(x = x, y = y), size = size, color = color, fill = fill, shape = shape, ...)
}

#' Custom visual raster line plot
#'
#' @param l \code{data.frame} containing a \code{x} and \code{y} column
#' @param size \code{integer} point size
#' @param color \code{color} line colors
#' @param ... other arguments passed to [ggplot2::geom_line()]
#' @export
vr_geom_line = function (l, size = 2, color = "#11111199", ...) {
  ggplot2::geom_line(data = l, ggplot2::aes(x, y), size = size, color = color, ...)
}

#' Custom visual raster polygon plot
#'
#' @param p \code{data.frame} containing at least \code{x} and \code{y} column
#' (see [ggplot2::fortify()] for a transforming spatial polygons)
#' @param size \code{integer} line size
#' @param color \code{color} border colors
#' @param fill \code{color} fill colors
#' @param ... other arguments passed to [ggplot2::geom_polygon]
#' @export
vr_geom_polygon = function (p, size = 1, fill = "#22222280", color = "#11111199", ...) {
  ggplot2::geom_polygon(data = p, ggplot2::aes(x=long, y=lat), size = size, fill = fill, color = color, ...)
}
