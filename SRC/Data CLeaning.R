# Importing the required libraries
library(dplyr)
library(ggplot2)

# Importing the student performance data set into R and creating a data frame
sp_df <- read.csv("C:/Users/tarun/OneDrive/Desktop/UMKC/Spring 2023/COMP_SCI5530/Assignment - 1/Student Performance/RawData/StudentsPerformance.csv")

# Checking the top five rows of the data frame
head(sp_df)

# Checking the last five rows of the data frame
tail(sp_df)

# Checking the number of rows in the data frame
nrow(sp_df)

# Checking the number of columns in the data frame
ncol(sp_df)

# Checking the data frame whether it has null values
is.na(sp_df)

# Printing columns with their total null values
colSums(is.na(sp_df))

# Checking the total number of null values in the data frame
sum(is.na(sp_df))

# There are no values in the student performance data set

# Checking the variable names of the student performance data set
names(sp_df)

# Changing the names of the data frame into our coding convenience
sp_df <- rename(sp_df, Gender = gender, Race_or_Ethnicity = race.ethnicity, Parental_Level_of_Education = parental.level.of.education,
                Lunch = lunch, Test_Preparation_Course = test.preparation.course, Math_Score = math.score, Reading_Score = reading.score,
                Writing_Score = writing.score)

# Checking the top five rows of the data frame after changing the variable names
head(sp_df)

# Saving the cleaned data frame to disk
write.csv(sp_df, "C:/Users/tarun/OneDrive/Desktop/UMKC/Spring 2023/COMP_SCI5530/Assignment - 1/Student Performance/CleanedData/Cleaned_StudentPerformance_Data.csv")



















