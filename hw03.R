library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggpubr)

data <- read.table('/Users/homework/data1_LSC598.txt', header = T)

#construct a boxplot comparing gender and vitamin D levels
data %>%
  ggplot(aes(x=gender, y=vitD_level, fill=gender)) + geom_boxplot() 

#Construct a scatter plot for age and vitamin D level and calculate the correlation coefficient

ggplot(data, aes(x=age_month, y=vitD_level)) + geom_point(size=1) + stat_cor(method = "pearson")

#Perform hypothesis testing to examine whether the vitamin D levels differ between females and males. Interpret your results. 
t.test(data$vitD_level, alternative = "two.sided")

#Perform hypothesis testing to examine whether the vitamin D levels differ between healthy and disease participants. Interpret your results. 

t.test(data$vitD_level, data$group)
