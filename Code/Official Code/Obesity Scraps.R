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

#"Insufficient_Weight", "Normal_Weight", "Obesity_Type_I", "Obesity_Type_II", 
#"Obesity_Type_III", "Overweight_Level_I", "Overweight_Level_II"





# two-fer


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

 
