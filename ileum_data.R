library(plotly)
library(ggplot2)
library(tidyverse)
library(ggpubr)
library(hrbrthemes)

intestine_data <- read.csv('C:/Users/annad/OneDrive/Documents/R_projects/intestine_demo/intestine_length_all.xlsm - Sheet1.csv')

intestine_data %>%
  ggplot(aes(x = Villi, y = length, fill = Villi)) +
  geom_bar(stat = "identity")
intestine_data %>%
  ggplot(aes(x = Villi, y = length)) + geom_line(color=) + geom_point()


min(intestine_data$length)
max(intestine_data$length)
mean(intestine_data$length)
sd(intestine_data$length)

print(intestine_data)
