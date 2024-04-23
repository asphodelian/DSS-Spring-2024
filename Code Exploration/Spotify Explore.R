#############
# Libraries #
#############

library(readxl)
library(caret)
library(ggplot2)
library(dplyr)

###########
# Read-In #
###########

spotify <- read.csv("C:/Users/knigh/OneDrive/Desktop/Github/DSS-Spring-2024/Possible Datasets/Spotify/playlist_2010to2023.csv")
dim(spotify)

#########
# Names #
#########

names(spotify)
summary(spotify)
