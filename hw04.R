library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggpubr)

data <- read.table('/Users/homework/data1_LSC598.txt', header = T)

#linear regression for healthy participants

ggplot(data, aes(x = age_month, y = vitD_level)) + geom_point(aes(color = group)) + geom_smooth(method = lm, se = F) + facet_wrap(~ group) + stat_cor(method = "pearson")


Corr <- cor(age_month, VitD_level)

