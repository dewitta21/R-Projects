library(tidyr)
library(tidyverse)
library(ggplot2)

patient_id <- c("003-36-4", "003-36-4", "003-36-2", "003-36-2", "005-36-2", "005-36-2", "005-36-3", "005-36-3", "015-31-2", "015-31-2", "015-36-4", "015-36-4")


Epidermis <- c("epidermis pos nerve pos", "epidermis neg nerve pos", "epidermis pos nerve pos", "epidermis neg nerve pos", "epidermis pos nerve pos", "epidermis neg nerve pos", "epidermis pos nerve pos", "epidermis neg nerve pos", "epidermis pos nerve pos", "epidermis neg nerve pos", "epidermis pos nerve pos", "epidermis neg nerve pos")

volume <- c(88.5, 1909.60, 869.35, 6023.83, 45519.96, 199618.35, 11037.60, 45577.02, 6044.46, 3696.9, 429.37, 353.18)

#Epidermis_pos <- c(88.5, 869.35, 45519.96, 11037.60, 6044.46, 429.37)
#Epidermis_neg <- c(1909.60, 6023.83, 199618.35, 45577.02, 3696.9, 353.18)

volume_data <- data.frame(patient, Epidermis, number)

ggplot(volume_data, aes(patient_id, volume, fill = Epidermis)) + geom_bar(stat = "identity", position = "dodge") + labs(title = "Volume of nerves") + ylab("Volume um3") + xlab("Patient ID") + theme_light() + theme(panel.grid = element_blank(), panel.grid.minor = element_blank()) 
