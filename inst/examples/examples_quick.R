library(d3r)
library(igraph)
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
