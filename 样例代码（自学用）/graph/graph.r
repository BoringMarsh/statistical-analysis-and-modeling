setwd("C:/Users/CHEMISTRYMASTER/Desktop/RProjects/graph")
rm(list = ls())

res <- read.csv("./faithful.csv")
courses <- read.csv("./courses.csv")
wait.max <- max(res$waiting)
wait.min <- min(res$waiting)
erupt.max <- max(res$eruptions)
erupt.min <- min(res$eruptions)

wait.color <- function(waiting) {
  return((waiting - wait.min) / (wait.max - wait.min) * 255)
}

erupt.color <- function(eruption) {
  return((erupt.max - eruption) / (erupt.max - erupt.min) * 255)
}

plot(x = res$eruptions,
     y = res$waiting,
     xlim = c(0, 5),
     ylim = c(30, 100),
     main = "main title",
     # sub = "sub title",
     xlab = "eruptions",
     ylab = "waiting",
     # ann = TRUE,
     # axes = T,
     pch = 19,
     col = rgb(wait.color(res$waiting), erupt.color(res$eruptions), 128, 255, maxColorValue = 255),
     
     )

# hist(courses$grade)

print(summary.data.frame(res))

files <- read.csv("./record2014.csv")
hour.max <- max(files$X)
hour.min <- min(files$X)
size.max <- max(files$size)
size.min <- min(files$size)

hour.color <- function(hour) {
  return((hour - hour.min) / (hour.max - hour.min) * 128 + 127)
}

size.color <- function(size) {
  return(255 -(size.max - size) / (size.max - size.min) * 128)
}

plot(x = files$X,
     y = files$size / 1048576,
     # xlim = c(4900, 5100),
     # ylim = c(0, 1.5),
     main = "Size of files in 2011",
     # sub = "sub title",
     xlab = "hour",
     ylab = "size(MB)",
     # ann = TRUE,
     # axes = T,
     pch = 20,
     col = rgb(64, 200, 160, 255, maxColorValue = 255),
     
)

save.image("./graph.Rdata")