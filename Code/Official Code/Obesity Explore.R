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
                  stringsAsFactors <- TRUE)
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

# linear
glm.fit1 <- glm(Obesity.Lvl ~ Age, data = train.data, 
                family = "binomial")
glm.fit2 <- glm(Obesity.Lvl ~ Gender, data = train.data, 
                family = "binomial")
glm.fit3 <- glm(Obesity.Lvl ~ Height, data = train.data, 
                family = "binomial")
glm.fit4 <- glm(Obesity.Lvl ~ Weight, data = train.data, 
                family = "binomial")
glm.fit5 <- glm(Obesity.Lvl ~ Alcohol.Consumption, data = train.data, 
                family = "binomial")
glm.fit6 <- glm(Obesity.Lvl ~ High.Caloric.Food.Consumption, data = train.data, 
                family = "binomial")
glm.fit7 <- glm(Obesity.Lvl ~ Vegetable.Consumption, data = train.data, 
                family = "binomial")
glm.fit8 <- glm(Obesity.Lvl ~ Main.Meal.Consumption, data = train.data,
                family = "binomial")
glm.fit9 <- glm(Obesity.Lvl ~ Calorie.Count, data = train.data, 
                family = "binomial")
glm.fit10 <- glm(Obesity.Lvl ~ SMOKE, data = train.data, 
                 family = "binomial")
glm.fit11 <- glm(Obesity.Lvl ~ Water.Consumption, data = train.data, 
                 family = "binomial")
glm.fit12 <- glm(Obesity.Lvl ~ Family.History.Overweight, data = train.data, 
                 family = "binomial")
glm.fit13 <- glm(Obesity.Lvl ~ Exercise.Activity, data = train.data, 
                 family = "binomial")
glm.fit14 <- glm(Obesity.Lvl ~ Screen.Time, data = train.data, 
                 family = "binomial")
glm.fit15 <- glm(Obesity.Lvl ~ Snacking, data = train.data, 
                 family = "binomial")
glm.fit16 <- glm(Obesity.Lvl ~ Mode.of.Transport, data = train.data, 
                 family = "binomial")

summary(glm.fit1) # yes
summary(glm.fit2) # no
summary(glm.fit3) # yes
summary(glm.fit4) # yes
summary(glm.fit5) # no
summary(glm.fit6) # yes
summary(glm.fit7) # maybe
summary(glm.fit8) # maybe
summary(glm.fit9) # yes
summary(glm.fit10) # maybe
summary(glm.fit11) # yes
summary(glm.fit12) # yes
summary(glm.fit13) # yes
summary(glm.fit14) # no
summary(glm.fit15) # yes?
summary(glm.fit16) # yes