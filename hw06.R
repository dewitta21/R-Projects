library(plotly)
library(tidyverse)
library("FactoMineR")
library(factoextra)
library(MASS)
# not recognized?? library(ggm)

tobacco <- load('C:/Users/annad/OneDrive/Documents/R_projects/data/tobacco_clr.Rdata')

#PCA

sigmahat <- 1/5*t(tobacco_clr$data)%*%tobacco_clr$data
sigmahat.pca <- eigen(sigmahat)
tobacco_eigenv <- sigmahat.pca$vectors
cord1 <- as.matrix(tobacco_clr$data)%*%tobacco_eigenv[,1]
cord2 <- as.matrix(tobacco_clr$data)%*%tobacco_eigenv[,2]
plot(cord1, cord2, xlab = 'PC 1', ylab = 'PC 2', col = tobacco_clr$sample.color, pch = tobacco_clr$sample.pch, main = "PCA PLOT")

#co-inertia

x <- tobacco_clr$data
y <- tobacco_clr$H
CoIA <- svd(t(x)%*%y)
x1 <- x%*%CoIA$u[,1]
y1 <- y%*%CoIA$v[,1]

plot(x1, y1, col = tobacco_clr$sample.color, pch = tobacco_clr$sample.pch)
