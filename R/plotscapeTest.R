#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
#' @examples
#' scene(mtcars) |>
#'   add_plot_wrapper("scatter", list(x = "wt", y = "mpg")) |>
#'   add_plot_wrapper("histo", list(x = "disp", y = "_indicator"))
scene <- function(data, width = NULL, height = NULL, elementId = NULL) {
  # forward options using x
  x = list(
    data = data,
    types = c(),
    mappings = list()
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'plotscapeTest',
    x,
    width = width,
    height = height,
    package = 'plotscapeTest',
    elementId = elementId
  )
}

#' @export
add_plot_wrapper <- function(scene, type, mapping) {
  scene$x$types <- c(scene$x$types, type)
  scene$x$mappings <- append(scene$x$mappings, list(mapping))
  scene
}

#' Shiny bindings for plotscapeTest
#'
#' Output and render functions for using plotscapeTest within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a plotscapeTest
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name plotscapeTest-shiny
#'
#' @export
plotscapeTestOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'plotscapeTest', width, height, package = 'plotscapeTest')
}

#' @rdname plotscapeTest-shiny
#' @export
renderPlotscapeTest <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, plotscapeTestOutput, env, quoted = TRUE)
}
