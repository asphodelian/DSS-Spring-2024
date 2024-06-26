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

g <- table(gender)
labels <- c("Female", "Male")
colors = c("violetred2", "steelblue3")
pie(g,label = labels, col = colors)
legend("topright", labels, cex = 1.5, fill = colors)

# age histogram

hist(age, main = "Age", xlab = "Age in years", ylab = "Frequency", col = "olivedrab3")

# obesity pie

labels <- c("Insuffucient", "Normal", "Obesity T1", "Obesity T2", "Obesity T3", 
            "Overweight L1", "Overweight L2")
colors = c("goldenrod", "royalblue", "tomato", "violetred", "lightslateblue", 
           "purple2", "seagreen4")
pie(lvl,label = lvl, col = colors)
legend("topright", labels, cex = 1.5, fill = colors)

# scatterplot

plot(age, weight, col = "lightseagreen", main = "Weight vs Age", xlab = "Age", 
     ylab = "Weight (kg)")

plot(height, weight, col = "mediumvioletred", main = "Weight vs Height", 
     xlab = "Height (m)", ylab = "Weight (kg)")
plot(height^2, weight, col = "mediumvioletred", main = "Weight vs Height", 
     xlab = "Height (m2)", ylab = "Weight (kg)")

plot(alcohol, weight, 
     col = c("green4", "chartreuse3", "firebrick", "lightsalmon"),
     main = "Weight vs Alcohol", xlab = "Alcohol Consumption", 
     ylab = "Weight (kg)")
plot(HCfood, weight, col = c("chartreuse3", "firebrick"), 
     main = "Weight vs High Caloric Food", 
     xlab = "High Caloric Food Consumption", ylab = "Weight (kg)")
plot(veggie, weight, col = "mediumseagreen", main = "Weight vs Vegetable", 
     xlab = "Vegetable Consumption", ylab = "Weight (kg)")
plot(main, weight, col = "lightskyblue3", main = "Weight vs Main Meal", 
     xlab = "Amount of Main Meals", ylab = "Weight (kg)")
plot(count, weight, main = "Weight vs Calorie Count", 
     col = c("firebrick", "chartreuse3"), xlab = "Do you calorie count?", 
     ylab = "Weight (kg)")
plot(smoke, weight, col = c("firebrick", "chartreuse3"),
     main = "Weight vs Smoking", xlab = "Do you smoke?", ylab = "Weight (kg)")
plot(water, weight, col = "royalblue2", main = "Weight vs Water", 
     xlab = "Water Consumption", ylab = "Weight (kg)")
plot(history, weight, , col = c("firebrick", "chartreuse3"),
     main = "Weight vs Obesity History", 
     xlab = "Do you have a family history of obesity?", ylab = "Weight (kg)")
plot(exercise, weight, col = "slateblue2", main = "Weight vs Exercise", 
     xlab = "How often do you exercise?", ylab = "Weight (kg)")
plot(screen, weight, col = "goldenrod2", main = "Weight vs Screen Time", 
     xlab = "How long is your screen time?", ylab = "Weight (kg)")
plot(snack, weight,
     col = c("green4", "chartreuse3", "firebrick", "lightsalmon"),
     main = "Weight vs Snacking", xlab = "Do you snack between meals?", 
     ylab = "Weight (kg)")
plot(transport, weight, 
     col = c("violetred3", "springgreen4", "red4", "lightslateblue", "moccasin"),
     main = "Weight vs Mode of Transport", 
     xlab = "Main Mode of Transportation", ylab = "Weight (kg)")

