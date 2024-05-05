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

maxfit3 <- glm(Obesity.Lvl ~ Age + Gender + Height + Weight + 
                 Alcohol.Consumption + High.Caloric.Food.Consumption + 
                 Vegetable.Consumption + Main.Meal.Consumption + Calorie.Count +
                 SMOKE + Water.Consumption + Family.History.Overweight +
                 Exercise.Activity + Snacking + Mode.of.Transport, 
               data = train.data, family = "binomial")
summary(maxfit3)

max.probs <- predict(maxfit1, test.data, type = "response")
max.pred <- rep("no",nrow(test.data))
max.pred[max.probs > 0.5] <- "yes"
table(max.pred, test.data$Obesity.Lvl)
mean(max.pred == test.data$Obesity.Lvl)

###################################
# Quadratic Discriminant Analysis #
###################################

qda.fit <- qda(Obesity.Lvl ~ Age + Gender + Height + Weight + 
                 Alcohol.Consumption + High.Caloric.Food.Consumption + 
                 Vegetable.Consumption + Main.Meal.Consumption + Calorie.Count +
                 SMOKE + Water.Consumption + Family.History.Overweight +
                 Exercise.Activity + Snacking + Mode.of.Transport,
               data = train.data)

# Error in qda.default(x, grouping, ...) : 
# rank deficiency in group Insufficient_Weight

qda.fit
qda.class <- predict(qda.fit, test.data)$class
table(qda.class, test.data$Obesity.Lvl)
mean(qda.class == test.data$Obesity.Lvl)



