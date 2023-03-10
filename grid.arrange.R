library(gridExtra)
library(grid)
library(ggplot2)
library(lattice)

p1 = qplot(mpg, wt, data = mtcars, colour = cyl)
p2 = qplot(mpg, data = mtcars) + ggtitle("title")
p3 = qplot(mpg, data = mtcars, geom = "dotplot")
p4 = p1 + facet_wrap( ~ carb, nrow = 1) + theme(legend.position = "none") +
  ggtitle("facetted plot")

grid.arrange(p1, p2, nrow = 1)

