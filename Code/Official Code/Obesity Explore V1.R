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
#fit <- glm(NObeyesdad ~ ., data = train.data, family = "binomial")
#anova(fit)
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
summary(glm.fit3) # yes
summary(glm.fit4) # yes
summary(glm.fit5) # no interact
summary(glm.fit6) # yes
summary(glm.fit7) # no
summary(glm.fit8) # yes
summary(glm.fit9) # yes
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
agefit14 <- glm(Obesity.Lvl ~ Age*Snacking, data = train.data, 
                family = "binomial")
agefit15 <- glm(Obesity.Lvl ~ Age*Mode.of.Transport, data = train.data, 
                family = "binomial")

summary(agefit1) # yes
summary(agefit2) # yes
summary(agefit3) # no
summary(agefit4) # no
summary(agefit5) # yes
summary(agefit6) # yes
summary(agefit7) # no
summary(agefit8) # yes
summary(agefit9) # no
summary(agefit10) # no
summary(agefit11) # no
summary(agefit12) # no
summary(agefit13) # no 
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

summary(genfit1) # minus height
summary(genfit2) # no
summary(genfit3) # no
summary(genfit4) # no
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

# two-fer: Height

hfit1 <- glm(Obesity.Lvl ~ Height*Weight, data = train.data, 
               family = "binomial")
hfit2 <- glm(Obesity.Lvl ~ Height*Alcohol.Consumption, data = train.data, 
               family = "binomial")
hfit3 <- glm(Obesity.Lvl ~ Height*High.Caloric.Food.Consumption, 
               data = train.data, family = "binomial")
hfit4 <- glm(Obesity.Lvl ~ Height*Vegetable.Consumption, data = train.data, 
               family = "binomial")
hfit5 <- glm(Obesity.Lvl ~ Height*Main.Meal.Consumption, data = train.data, 
               family = "binomial")
hfit6 <- glm(Obesity.Lvl ~ Height*Calorie.Count, data = train.data, 
               family = "binomial")
hfit7 <- glm(Obesity.Lvl ~ Height*SMOKE, data = train.data, 
               family = "binomial")
hfit8 <- glm(Obesity.Lvl ~ Height*Water.Consumption, data = train.data, 
               family = "binomial")
hfit9 <- glm(Obesity.Lvl ~ Height*Family.History.Overweight, data = train.data, 
                family = "binomial")
hfit10 <- glm(Obesity.Lvl ~ Height*Exercise.Activity, data = train.data, 
                family = "binomial")
hfit11 <- glm(Obesity.Lvl ~ Height*Screen.Time, data = train.data, 
                family = "binomial")
hfit12 <- glm(Obesity.Lvl ~ Height*Snacking, data = train.data, 
                family = "binomial")
hfit13 <- glm(Obesity.Lvl ~ Height*Mode.of.Transport, data = train.data, 
                family = "binomial")

summary(hfit1) # no interact
summary(hfit2) # no
summary(hfit3) # yes
summary(hfit4) # no
summary(hfit5) # yes
summary(hfit6) # no
summary(hfit7) # no 
summary(hfit8) # no
summary(hfit9) # yes
summary(hfit10) # yes
summary(hfit11) # yes
summary(hfit12) # no
summary(hfit13) # only certain factors

# two-fer: Weight

wfit1 <- glm(Obesity.Lvl ~ Weight*Alcohol.Consumption, data = train.data, 
             family = "binomial")
wfit2 <- glm(Obesity.Lvl ~ Weight*High.Caloric.Food.Consumption, 
             data = train.data, family = "binomial")
wfit3 <- glm(Obesity.Lvl ~ Weight*Vegetable.Consumption, data = train.data, 
             family = "binomial")
wfit4 <- glm(Obesity.Lvl ~ Weight*Main.Meal.Consumption, data = train.data, 
             family = "binomial")
wfit5 <- glm(Obesity.Lvl ~ Weight*Calorie.Count, data = train.data, 
             family = "binomial")
wfit6 <- glm(Obesity.Lvl ~ Weight*SMOKE, data = train.data, 
             family = "binomial")
wfit7 <- glm(Obesity.Lvl ~ Weight*Water.Consumption, data = train.data, 
             family = "binomial")
wfit8 <- glm(Obesity.Lvl ~ Weight*Family.History.Overweight, data = train.data, 
             family = "binomial")
wfit9 <- glm(Obesity.Lvl ~ Weight*Exercise.Activity, data = train.data, 
              family = "binomial")
wfit10 <- glm(Obesity.Lvl ~ Weight*Screen.Time, data = train.data, 
              family = "binomial")
wfit11 <- glm(Obesity.Lvl ~ Weight*Snacking, data = train.data, 
              family = "binomial")
wfit12 <- glm(Obesity.Lvl ~ Weight*Mode.of.Transport, data = train.data, 
              family = "binomial")

summary(wfit1) # no 
summary(wfit2) # no
summary(wfit3) # no 
summary(wfit4) # yes
summary(wfit5) # no
summary(wfit6) # no
summary(wfit7) # no 
summary(wfit8) # yes
summary(wfit9) # yes
summary(wfit10) # no interact
summary(wfit11) # no
summary(wfit12) # only certain factors

###############
# Max attempt #
###############

maxfit1 <- glm(Obesity.Lvl ~ Age + Gender + Height + Weight + 
                 Alcohol.Consumption + High.Caloric.Food.Consumption + 
                 Vegetable.Consumption + Main.Meal.Consumption + Calorie.Count +
                 SMOKE + Water.Consumption + Family.History.Overweight +
                 Exercise.Activity + Screen.Time + Snacking,
               data = train.data, family = "binomial")

maxfit2 <- glm(Obesity.Lvl ~ Age + Gender + Height + Weight + 
                 Alcohol.Consumption + High.Caloric.Food.Consumption + 
                 Vegetable.Consumption + Main.Meal.Consumption + Calorie.Count +
                 SMOKE + Water.Consumption + Family.History.Overweight +
                 Exercise.Activity + Screen.Time + Mode.of.Transport,
               data = train.data, family = "binomial")

maxfit3 <- glm(Obesity.Lvl ~ Age + Gender + Height + Weight + 
                 Alcohol.Consumption + High.Caloric.Food.Consumption + 
                 Vegetable.Consumption + Main.Meal.Consumption + Calorie.Count +
                 SMOKE + Water.Consumption + Family.History.Overweight +
                 Exercise.Activity + Snacking + Mode.of.Transport,
               data = train.data, family = "binomial")

summary(maxfit1) # no
summary(maxfit2) # only weight/alcohol
summary(maxfit3) # yes

#####################
# Linear Based Fits #
#####################

fit.1 <- glm(Obesity.Lvl ~ Age + Gender + Weight + 
               High.Caloric.Food.Consumption + Main.Meal.Consumption + 
               Calorie.Count + Water.Consumption + Family.History.Overweight +
                 Exercise.Activity + Screen.Time + Snacking,
               data = train.data, family = "binomial") 
summary(fit.1) # no

fit.2 <- glm(Obesity.Lvl ~ Age + Weight + Main.Meal.Consumption + 
              Water.Consumption + Snacking,
             data = train.data, family = "binomial") 
fit2.sum <- summary(fit.2) # yes
fit2.sum

data.frame(
  Adj.R2 = fit2.sum$adjr2,
  CP = fit2.sum$cp,
  BIC = fit2.sum$bic
)

