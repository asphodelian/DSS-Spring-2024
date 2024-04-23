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

obese <- read.csv("C:/Users/knigh/OneDrive/Desktop/Github/DSS-Spring-2024/Possible Datasets/Obesity/ObesityDataSet_raw_and_data_sinthetic.csv")
dim(obese)

#########
# Names #
#########

names(obese)

colnames(obese)[5] = "Alcohol Consumption"
colnames(obese)[6] = "High Caloric Food Consumption"
colnames(obese)[7] = "Vegetable Consumption"
colnames(obese)[8] = "Main Meal Consumption"
colnames(obese)[9] = "Calorie Count"
colnames(obese)[11] = "Water Consumption"
colnames(obese)[13] = "Exercise Activity"
colnames(obese)[14] = "Screen Time"
colnames(obese)[15] = "Snacking"
colnames(obese)[16] = "Mode of Transport"
colnames(obese)[17] = "Obesity Lvl"

##############
# Conversion #
##############

#obese$Gender <- replace(obese$Gender, obese$Gender == "Female", 0)
#obese$Gender <- replace(obese$Gender, obese$Gender == "Male", 1)

obese$Gender <- as.factor(obese$Gender)
obese$`Alcohol Consumption` <- as.factor(obese$`Alcohol Consumption`)
obese$`High Caloric Food Consumption` <- as.factor(obese$`High Caloric Food Consumption`)
obese$`Calorie Count` <- as.factor(obese$`Calorie Count`)
obese$SMOKE <- as.factor(obese$SMOKE)
obese$family_history_with_overweight <- as.factor(obese$family_history_with_overweight)
obese$Snacking <- as.factor(obese$Snacking)
obese$`Mode of Transport` <- as.factor(obese$`Mode of Transport`)
obese$`Obesity Lvl` <- as.factor(obese$`Obesity Lvl`)

summary(obese)
