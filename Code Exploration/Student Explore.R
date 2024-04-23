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

student <- read.csv("C:/Users/knigh/OneDrive/Desktop/Github/DSS-Spring-2024/Possible Datasets/Drop vs Success/dataset.csv")
dim(student)

#########
# Names #
#########

names(student)

# marriage status of student
# 1 - single
# 2 - married
# 3 - widower
# 4 - Divorced
# 5 - Facto Union
# 6 - Legally seprated
colnames(student)[1] = "Marital Stat"
# method of application
colnames(student)[2] = "App Mode"
# order in which student applies
colnames(student)[3] = "App Order"
# course student took
colnames(student)[4] = "Course"
# day or night class
colnames(student)[5] = "Day/Night Attend"
# before enrolling in higher education, student qualification
colnames(student)[6] = "Prev Qual"
colnames(student)[7] = "Nationality"

# parents' qualifications and jobs
colnames(student)[8] = "Mother Qual"
colnames(student)[9] = "Father Qual"
colnames(student)[10] = "Mother Job"
colnames(student)[11] = "Father Job"

# displaced person or not
colnames(student)[12] = "Displaced"
# learning disabilities
colnames(student)[13] = "Edu Special Needs"
colnames(student)[14] = "Debtor"
colnames(student)[15] = "Up-to-Date Tuition Fees"
colnames(student)[16] = "Gender"
# scholarship holder
colnames(student)[17] = "Scholarship"
colnames(student)[18] = "Enrollment Age"
colnames(student)[19] = "International"

# course credits
colnames(student)[20] = "1st Sem Units Credit"
colnames(student)[21] = "1st Sem Units Enroll"
colnames(student)[22] = "1st Sem Units Eval"
colnames(student)[23] = "1st Sem Units Approved"
colnames(student)[24] = "1st Sem Units Grade"
colnames(student)[25] = "1st Sem Units No Eval"

colnames(student)[26] = "2nd Sem Units Credit"
colnames(student)[27] = "2nd Sem Units Enroll"
colnames(student)[28] = "2nd Sem Units Eval"
colnames(student)[29] = "2nd Sem Units Approved"
colnames(student)[30] = "2nd Sem Units Grade"
colnames(student)[31] = "2nd Sem Units No Eval"


colnames(student)[32] = "Unemployment Rate"
colnames(student)[33] = "Inflation Rate"
colnames(student)[34] = "GDP"
# our Y, dropout or grad
colnames(student)[35] = "Target"
  
names(student)
