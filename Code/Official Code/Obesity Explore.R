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

# All
fit <- glm(Obesity.Lvl ~ ., data = train.data, family = "binomial")
summary(fit)

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
summary(glm.fit2) # yes
summary(glm.fit3) # maybe
summary(glm.fit4) # yes
summary(glm.fit5) # no
summary(glm.fit6) # yes
summary(glm.fit7) # no
summary(glm.fit8) # yes
summary(glm.fit9) # maybe
summary(glm.fit10) # no
summary(glm.fit11) # yes
summary(glm.fit12) # yes
summary(glm.fit13) # yes
summary(glm.fit14) # yes
summary(glm.fit15) # only certain factors
summary(glm.fit16) # no

# two-fer: Age

agefit1 <- glm(Obesity.Lvl ~ Age*Gender, data = train.data, family = "binomial")
agefit2 <- glm(Obesity.Lvl ~ Age*Height, data = train.data, family = "binomial")
agefit3 <- glm(Obesity.Lvl ~ Age*Weight, data = train.data, family = "binomial")
agefit4 <- glm(Obesity.Lvl ~ Age*Alcohol.Consumption, data = train.data, 
               family = "binomial")
agefit5 <- glm(Obesity.Lvl ~ Age*High.Caloric.Food.Consumption, 
               data = train.data, family = "binomial")
agefit6 <- glm(Obesity.Lvl ~ Age*Vegetable.Consumption, data = train.data, 
               family = "binomial")
agefit7 <- glm(Obesity.Lvl ~ Age*Main.Meal.Consumption, data = train.data, 
               family = "binomial")
agefit8 <- glm(Obesity.Lvl ~ Age*Calorie.Count, data = train.data, 
               family = "binomial")
agefit9 <- glm(Obesity.Lvl ~ Age*SMOKE, data = train.data, family = "binomial")
agefit10 <- glm(Obesity.Lvl ~ Age*Water.Consumption, data = train.data, 
                family = "binomial")
agefit11 <- glm(Obesity.Lvl ~ Age*Family.History.Overweight, data = train.data, 
                family = "binomial")
agefit12 <- glm(Obesity.Lvl ~ Age*Exercise.Activity, data = train.data, 
                family = "binomial")
agefit13 <- glm(Obesity.Lvl ~ Age*Screen.Time, data = train.data, 
                family = "binomial")
agefit14 <- glm(Obesity.Lvl ~ Age*Snacking, data = train.data, family = "binomial")
agefit15 <- glm(Obesity.Lvl ~ Age*Mode.of.Transport, data = train.data, 
                family = "binomial")

summary(agefit1) # yes
summary(agefit2) # yes
summary(agefit3) # no
summary(agefit4) # only certain factors
summary(agefit5) # yes
summary(agefit6) # yes
summary(agefit7) # no
summary(agefit8) # yes
summary(agefit9) # no
summary(agefit10) # no
summary(agefit11) # no
summary(agefit12) # no
summary(agefit13) # no interaction
summary(agefit14) # no
summary(agefit15) # only certain factors

# two-fer: Gender

genfit1 <- glm(Obesity.Lvl ~ Gender*Height, data = train.data, 
               family = "binomial")
genfit2 <- glm(Obesity.Lvl ~ Gender*Weight, data = train.data, 
               family = "binomial")
genfit3 <- glm(Obesity.Lvl ~ Gender*Alcohol.Consumption, data = train.data, 
               family = "binomial")
genfit4 <- glm(Obesity.Lvl ~ Gender*High.Caloric.Food.Consumption, 
               data = train.data, family = "binomial")
genfit5 <- glm(Obesity.Lvl ~ Gender*Vegetable.Consumption, data = train.data, 
               family = "binomial")
genfit6 <- glm(Obesity.Lvl ~ Gender*Main.Meal.Consumption, data = train.data, 
               family = "binomial")
genfit7 <- glm(Obesity.Lvl ~ Gender*Calorie.Count, data = train.data, 
               family = "binomial")
genfit8 <- glm(Obesity.Lvl ~ Gender*SMOKE, data = train.data, 
               family = "binomial")
genfit9 <- glm(Obesity.Lvl ~ Gender*Water.Consumption, data = train.data, 
                family = "binomial")
genfit10 <- glm(Obesity.Lvl ~ Gender*Family.History.Overweight, data = train.data, 
                family = "binomial")
genfit11 <- glm(Obesity.Lvl ~ Gender*Exercise.Activity, data = train.data, 
                family = "binomial")
genfit12 <- glm(Obesity.Lvl ~ Gender*Screen.Time, data = train.data, 
                family = "binomial")
genfit13 <- glm(Obesity.Lvl ~ Gender*Snacking, data = train.data, 
                family = "binomial")
genfit14 <- glm(Obesity.Lvl ~ Gender*Mode.of.Transport, data = train.data, 
                family = "binomial")

summary(genfit1) # only certain factors
summary(genfit2) # only certain factors
summary(genfit3) # no
summary(genfit4) # yes
summary(genfit5) # minus veggie
summary(genfit6) # minus meal
summary(genfit7) # no interact
summary(genfit8) # no
summary(genfit9) # yes
summary(genfit10) # yes
summary(genfit11) # no interact
summary(genfit12) # yes
summary(genfit13) # no
summary(genfit14) # only certain factors


