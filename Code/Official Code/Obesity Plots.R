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

#############
# Variables #
#############

age <- obese$Age
gender <- obese$Gender
height <- obese$Height
weight <- obese$Weight
alcohol <- obese$Alcohol.Consumption
HCfood <- obese$High.Caloric.Food.Consumption
veggie <- obese$Vegetable.Consumption
main <- obese$Main.Meal.Consumption
count <- obese$Calorie.Count
smoke <- obese$SMOKE
water <- obese$Water.Consumption
history <- obese$Family.History.Overweight
exercise <- obese$Exercise.Activity
screen <- obese$Screen.Time
snack <- obese$Snacking
transport <- obese$Mode.of.Transport
lvl <- table(obese$Obesity.Lvl)

#########
# Plots #
#########

# gender pie

g <- table(obese$Gender)
labels <- c("Female", "Male")
colors = c("violetred2", "steelblue3")
pie(g,label = g, col = colors)
legend("topright", labels, cex = 1.5, fill = colors)

# age histogram

hist(age, main = "Age", ylab = "Age in Years", col = "olivedrab3")

# obesity pie

labels <- c("Insuffucient", "Normal", "Obesity T1", "Obesity T2", "Obesity T3", 
            "Overweight L1", "Overweight L2")
colors = c("goldenrod", "royalblue", "tomato", "violetred", "lightslateblue", 
           "purple2", "seagreen4")
pie(lvl,label = lvl, col = colors)
legend("topright", labels, cex = 1.5, fill = colors)

# scatterplot

plot()

