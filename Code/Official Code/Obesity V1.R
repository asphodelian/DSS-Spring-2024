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

obese <- read.csv("C:/Users/knigh/OneDrive/Desktop/Github/DSS-Spring-2024/Possible Datasets/Obesity/ObesityDataSet_raw_and_data_sinthetic.csv",
                  stringsAsFactors = TRUE)
dim(obese)

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

###########
# Summary #
###########

summary(obese)
sum(is.na(obese)) # checking for missing values

#######
# Fit #
#######

train <- sample(1:nrow(obese),0.8*nrow(obese))
test <- -train
train.data <- obese[train,]
test.data <- obese[-train,]

maxfit1 <- glm(Obesity.Lvl ~ Age + Gender + Height + Weight + 
                 Alcohol.Consumption + High.Caloric.Food.Consumption + 
                 Vegetable.Consumption + Main.Meal.Consumption + Calorie.Count +
                 SMOKE + Water.Consumption + Family.History.Overweight +
                 Exercise.Activity + Screen.Time + Snacking,
               data = train.data, family = "binomial")
summary(maxfit1)
