#############
# Libraries #
#############

library(caret)
library(class) # KNN
library(dplyr)
library(ggplot2)
library(glmnet) # ridge regress & LASSO
library(leaps) # best subset
library(MASS) # QDA & LDA
library(readxl)
library(stats)

###########
# Read-In #
###########

obesity <- read.csv("C:/Users/knigh/OneDrive/Desktop/Github/DSS-Spring-2024/Possible Datasets/Obesity/ObesityDataSet_raw_and_data_sinthetic.csv",
                  stringsAsFactors = TRUE)
dim(obesity)

#########
# Names #
#########

names(obesity)

colnames(obesity)[5] <- "Alcohol.Consumption"
colnames(obesity)[6] <- "High.Caloric.Food.Consumption"
colnames(obesity)[7] <- "Vegetable.Consumption"
colnames(obesity)[8] <- "Main.Meal.Consumption"
colnames(obesity)[9] <- "Calorie.Count"
colnames(obesity)[11] <- "Water.Consumption"
colnames(obesity)[12] <- "Family.History.Overweight"
colnames(obesity)[13] <- "Exercise.Activity"
colnames(obesity)[14] <- "Screen.Time"
colnames(obesity)[15] <- "Snacking"
colnames(obesity)[16] <- "Mode.of.Transport"
colnames(obesity)[17] <- "Obesity.Lvl"

###########
# Summary #
###########

summary(obesity)
sum(is.na(obesity)) # checking for missing values

###############
# Edited Data #
###############

obese <- obesity[!(obesity$Obesity.Lvl %in% "Insufficient_Weight"),]
summary(obese)
sum(is.na(obese))

#######
# Fit #
#######

ob.train <- sample(1:nrow(obesity),0.8*nrow(obesity))
ob.test <- -ob.train
train.data1 <- obesity[ob.train,]
test.data1 <- obesity[-ob.train,]

#o.train <- sample(1:nrow(obese),0.8*nrow(obese))
#o.test <- -o.train
#train.data2 <- obese[o.train,]
#test.data2 <- obese[-o.train,]

#ob.fit1 <- glm(Obesity.Lvl ~ Age + Gender + Height + Weight +
#                 High.Caloric.Food.Consumption + Main.Meal.Consumption + 
#                 Calorie.Count + Water.Consumption + Family.History.Overweight +
#                 Exercise.Activity + Snacking,
#               data = train.data1, family = "binomial")
#ob.fit1 <- glm(Obesity.Lvl ~ Age + Weight + Main.Meal.Consumption + 
#               Water.Consumption + Snacking,
#               data = train.data1, family = "binomial") 
#ob.fit1 <- glm(Obesity.Lvl ~ Age + Gender + Weight + 
#               High.Caloric.Food.Consumption + Main.Meal.Consumption + 
#               Calorie.Count + Water.Consumption + Family.History.Overweight +
#               Exercise.Activity + Screen.Time + Snacking,
#             data = train.data1, family = "binomial") 
#summary(ob.fit1)

#ob.fit2 <- glm(Obesity.Lvl ~ Age + Weight,
#             data = train.data1, family = "binomial")
#o.fit <- glm(Obesity.Lvl ~ Age + Weight,
#              data = train.data2, family = "binomial") 
ob.fit2 <- glm(Obesity.Lvl ~ Weight + Height,
               data = train.data1, family = "binomial")
summary(ob.fit2)
#summary(o.fit)

ob.probs <- predict(ob.fit2, test.data1, type = "response")
ob.pred <- rep("no",nrow(test.data1))
ob.pred[ob.probs > 0.5] <- "yes"
table(ob.pred, test.data1$Obesity.Lvl)
mean(ob.pred == test.data1$Obesity.Lvl)

# runs into errors
#o.probs <- predict(o.fit, test.data1, type = "response")
#o.pred <- rep("no",nrow(test.data2))
#o.pred[o.probs > 0.5] <- "yes"
#table(ob.pred, test.data2$Obesity.Lvl)
#mean(ob.pred == test.data2$Obesity.Lvl)

###################################
# Quadratic Discriminant Analysis #
###################################

qda.fit1 <- qda(Obesity.Lvl ~ Age + Weight + Main.Meal.Consumption + 
                 Water.Consumption + Snacking, data = train.data1)

# Error in qda.default(x, grouping, ...) : 
# rank deficiency in group Insufficient_Weight

# with "insufficient weight no longer there, some group is now too small for qda

qda.fit1
qda.class1 <- predict(qda.fit1, test.data1)$class
table(qda.class1, test.data1$Obesity.Lvl)
mean(qda.class1 == test.data1$Obesity.Lvl)


qda.fit2 <- qda(Obesity.Lvl ~ Weight + Height, data = train.data1)
qda.fit2
qda.class2 <- predict(qda.fit2, test.data1)$class
table(qda.class2, test.data1$Obesity.Lvl)
mean(qda.class2 == test.data1$Obesity.Lvl)

################################
# Linear Discriminant Analysis #
################################

lda.fit1 <- lda(Obesity.Lvl ~ Age + Weight + Main.Meal.Consumption +
                 Water.Consumption + Snacking, data = train.data1) 
lda.fit1
plot(lda.fit1)
lda.class <- predict(lda.fit1, test.data1)$class
table(lda.class1, test.data1$Obesity.Lvl)
mean(lda.class1 == test.data1$Obesity.Lvl)


lda.fit2 <- lda(Obesity.Lvl ~ Weight + Height, data = train.data1) 
lda.fit2
plot(lda.fit1)
lda.class <- predict(lda.fit1, test.data1)$class
table(lda.class1, test.data1$Obesity.Lvl)
mean(lda.class1 == test.data1$Obesity.Lvl)

########################
# K-Nearest Neighbors ##
########################

# skip

train.X <- obesity[ob.train,]
test.X <- obesity[-ob.train,]
y.train <- train.data1$Obesity.Lvl
set.seed(1)
knn.pred <- knn(train.X, test.X, y.train, k = 1)
table(knn.pred, test.data1$Obesity.Lvl)
mean(knn.pred == test.data1$Obesity.Lvl)

knn.pred = knn(train.X, test.X, y.train, k = 5)
table(knn.pred, test.data1$Obesity.Lvl)
mean(knn.pred==test.data1$Obesity.Lvl)

#########################
# Best Subset Selection #
#########################

regfit.full <- regsubsets(Obesity.Lvl ~., data = obesity, nvmax = 16)
reg.summary <- summary(regfit.full)
reg.summary

data.frame(
  Adj.R2 = which.max(reg.summary$adjr2),
  CP = which.min(reg.summary$cp),
  BIC = which.min(reg.summary$bic)
)
