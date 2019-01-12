
<!-- README.md is generated from README.Rmd. Please edit that file -->

**For demonstration purposes** - easy enough to turn into a CRAN-worthy
package; let me know if you have interest

# forcer

`forcer` is a quickly assembled `htmlwidget` for Vasco Asturiano’s
[`react-force-graph`](https://github.com/vasturiano/react-force-graph).
The package is designed to work but also primarily to demonstrate how to
use `reactR::scaffoldWidget` to create an `htmlwidget` from a `React`
component. Please see the tutorial [htmlwidgets with
reactR](https://react-r.github.io/reactR/articles/intro_htmlwidgets.html)
for the steps to go from `React` component to fully functioning
`htmlwidget`.

## Installation

Install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("react-R/forcer")
```

## Example

Here are some very quick examples to demonstrate the three types of
force-directed graphs provided.

``` r
library(d3r)
library(igraph)
#> Warning: package 'igraph' was built under R version 3.4.4
#> 
#> Attaching package: 'igraph'
#> The following objects are masked from 'package:stats':
#> 
#>     decompose, spectrum
#> The following object is masked from 'package:base':
#> 
#>     union
library(forcer)

# VR crashed my RStudio so open in real browser
options(viewer = NULL)

# 2D
forcer(
  data = d3r::d3_igraph(igraph::make_tree(60,3,mode="in")),
  forcetype = "ForceGraph2D",
  nodeColor = list("#0f0"),
  linkCurvature = 0.25
)
#> Warning: package 'bindrcpp' was built under R version 3.4.4
```

<img src="man/figures/README-example-1.png" width="100%" />

… and for 3d and a-frame VR …

``` r
# 3D
forcer(
  data = d3r::d3_igraph(igraph::make_tree(60,3)),
  forcetype = "ForceGraph3D"
)

# VR
forcer(
  data = d3r::d3_igraph(igraph::make_tree(60,3)),
  forcetype = "ForceGraphVR"
)
```
