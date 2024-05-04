#############
# Libraries #
#############

library(readxl)
library(caret)
library(ggplot2)
library(dplyr)
library(plotrix)

###########
# Dataset #
###########

obese <- read.csv("C:/Users/knigh/OneDrive/Desktop/Github/DSS-Spring-2024/Possible Datasets/Obesity/ObesityDataSet_raw_and_data_sinthetic.csv",
                  stringsAsFactors = TRUE)

#########
# Names #
#########

names(obese)

colnames(obese)[5] <- "Alcohol.Consumption"
colnames(obese)[6] <- "High.Caloric.Food.Consumption"
colnames(obese)[7] <- "Vegetable.Consumption"
colnames(obese)[8] <- "Main.Meal.Consumption"
colnames(obese)[9] <- "Calorie.Count"
colnames(obese)[11] <- "Water.Consumption"
colnames(obese)[12] <- "Family.History.Overweight"
colnames(obese)[13] <- "Exercise.Activity"
colnames(obese)[14] <- "Screen.Time"
colnames(obese)[15] <- "Snacking"
colnames(obese)[16] <- "Mode.of.Transport"
colnames(obese)[17] <- "Obesity.Lvl"

#########
# Plots #
#########

# gender pie

x <- table(obese$Gender)
labels <- c("Female", "Male")
colors = c("violetred2", "steelblue3")
pie(x,label = x, col = colors)
legend("topright", labels, cex = 1.5, fill = colors)


