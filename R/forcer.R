#' Create Force Directed Graph
#'
#' @param data \code{json} format as described in \url{https://github.com/vasturiano/react-force-graph#input-json-syntax}.
#'    Use \code{d3r::d3_igraph} to convert \code{igraph} networks into the proper format.
#' @param forcetype \code{string} one of \code{"ForceGraph2D"}, \code{"ForceGraph3D"}, or \code{"ForceGraphVR"}
#' @param ... other props for the force graph; see \url{https://github.com/vasturiano/react-force-graph#api-reference}
#' @param width,height \code{string} valid \code{CSS} size unit
#' @param elementId \code{string} valid \code{CSS} selector id
#'
#' @example inst/examples/examples_quick.R
#' @import htmlwidgets
#'
#' @export
forcer <- function(
  data = NULL,
  forcetype = c("ReactForce2D", "ReactForce3D", "ReactForceVR"),
  ...,
  width = NULL, height = NULL, elementId = NULL
) {

   # describe a React component to send to the browser for rendering.
  component <- reactR::reactMarkup(reactR::component(
    forcetype[1],
    list(graphData = data, ...)
  ))

  # create widget
  htmlwidgets::createWidget(
    name = 'forcer',
    component,
    width = width,
    height = height,
    package = 'forcer',
    elementId = elementId
  )
}

#' Shiny bindings for forcer
#'
#' Output and render functions for using forcer within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a forcer
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name forcer-shiny
#'
#' @export
forcerOutput <- function(outputId, width = '100%%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'forcer', width, height, package = 'forcer')
}

#' @rdname forcer-shiny
#' @export
renderForcer <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, forcerOutput, env, quoted = TRUE)
}

#' Called by HTMLWidgets to produce the widget's root element.
#' @rdname forcer-shiny
forcer_html <- function(id, style, class, ...) {
  htmltools::tagList(
    # Necessary for RStudio viewer version < 1.2
    reactR::html_dependency_corejs(),
    reactR::html_dependency_react(),
    reactR::html_dependency_reacttools(),
    htmltools::tags$div(id = id, class = class)
  )
}
