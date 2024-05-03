#obese$Gender <- replace(obese$Gender, obese$Gender <-<- "Female", 0)
#obese$Gender <- replace(obese$Gender, obese$Gender <-<- "Male", 1)

#obese$Gender <- as.factor(obese$Gender)
#obese$`Alcohol Consumption` <- as.factor(obese$`Alcohol Consumption`)
#obese$`High Caloric Food Consumption` <- as.factor(obese$`High Caloric Food Consumption`)
#obese$`Calorie Count` <- as.factor(obese$`Calorie Count`)
#obese$SMOKE <- as.factor(obese$SMOKE)
#obese$family_history_with_overweight <- as.factor(obese$family_history_with_overweight)
#obese$Snacking <- as.factor(obese$Snacking)
#obese$`Mode of Transport` <- as.factor(obese$`Mode of Transport`)
#obese$`Obesity Lvl` <- as.factor(obese$`Obesity Lvl`)

summary(obese)
sum(is.na(obese)) # checking for missing values

#"Insufficient_Weight", "Normal_Weight", "Obesity_Type_I", "Obesity_Type_II", 
#"Obesity_Type_III", "Overweight_Level_I", "Overweight_Level_II"

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

# two-fer
glm.fit17 <- glm(Obesity.Lvl ~ Age*a, 
                 data = train.data, family = "binomial")
summary(glm.fit17)

glm.fit18 <- glm(Obesity.Lvl ~ Gender*a, 
                 data = train.data, family = "binomial")
summary(glm.fit18)

glm.fit19 <- glm(Obesity.Lvl ~ Height*a, 
                 data = train.data, family = "binomial")
summary(glm.fit19)

glm.fit20 <- glm(Obesity.Lvl ~ Weight*a, 
                 data = train.data, family = "binomial")
summary(glm.fit20)

glm.fit21 <- glm(Obesity.Lvl ~ Alcohol.Consumption*a, 
                 data = train.data, family = "binomial")
summary(glm.fit21)

glm.fit22 <- glm(Obesity.Lvl ~ High.Caloric.Food.Consumption*a, 
                 data = train.data, family = "binomial")
summary(glm.fit22)

glm.fit23 <- glm(Obesity.Lvl ~ Vegetable.Consumption*a, 
                 data = train.data, family = "binomial")
summary(glm.fit23)

glm.fit24 <- glm(Obesity.Lvl ~ Main.Meal.Consumption*a, 
                 data = train.data, family = "binomial")
summary(glm.fit24)

glm.fit25 <- glm(Obesity.Lvl ~ Calorie.Count*a, 
                 data = train.data, family = "binomial")
summary(glm.fit25)

glm.fit26 <- glm(Obesity.Lvl ~ SMOKE*a, 
                 data = train.data, family = "binomial")
summary(glm.fit26)

glm.fit27 <- glm(Obesity.Lvl ~ Water.Consumption*a, 
                 data = train.data, family = "binomial")
summary(glm.fit27)

glm.fit28 <- glm(Obesity.Lvl ~ Family.History.Overweight*a, 
                 data = train.data, family = "binomial")
summary(glm.fit28)

glm.fit29 <- glm(Obesity.Lvl ~ Exercise.Activity*a, 
                 data = train.data, family = "binomial")
summary(glm.fit29)

glm.fit30 <- glm(Obesity.Lvl ~ Screen.Time*a, 
                 data = train.data, family = "binomial")
summary(glm.fit30)

glm.fit31 <- glm(Obesity.Lvl ~ Snacking*a, 
                 data = train.data, family = "binomial")
summary(glm.fit31)

glm.fit32 <- glm(Obesity.Lvl ~ Mode.of.Transport*a, 
                 data = train.data, family = "binomial")
summary(glm.fit32)

Age                           
Gender                       
Height                        
Weight                        
Alcohol.Consumption          
High.Caloric.Food.Consumption
Vegetable.Consumption         
Main.Meal.Consumption         
Calorie.Count                 
SMOKE                         
Water.Consumption             
Family.History.Overweight
Exercise.Activity         
Screen.Time                  
Snacking                   
Mode.of.Transport 
