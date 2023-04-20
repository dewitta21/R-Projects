library(plotly)
library(tidyverse)
library(MASS)
library(mvtnorm)
library(ppcor)
library(igraph)

# not recognized?? library(ggm)

tobacco_data <- load('C:/Users/annad/OneDrive/Documents/R_projects/data/tobacco_clr.Rdata')

sigma_est = cov(tobacco_clr$data[,1:10])

omega_est = ginv(sigma_est)

network <- (pcor(tobacco_clr$data[,1:10])$p.value <= 0.05)*1

diag(network)

network.plot <- graph_from_adjacency_matrix(network)

plot(network.plot)


                                                                                          