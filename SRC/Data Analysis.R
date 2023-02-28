# Importing the required libraries into R
library(ggplot2)
library(dplyr)

# Importing the cleaned data set and creating a data frame
sp_df <- read.csv("C:/Users/tarun/OneDrive/Desktop/UMKC/Spring 2023/COMP_SCI5530/Assignment - 1/Student Performance/CleanedData/Cleaned_StudentPerformance_Data.csv")

# Viewing the data frame
View(sp_df)

# Checking the top five rows of the data frame
head(sp_df)

# Checking the last five rows of the data frame
tail(sp_df)

# Checking the number of rows in the data frame
nrow(sp_df)

# Checking the number of columns in the data frame
ncol(sp_df)

# Checking the data type pf each variable in the data frame
str(sp_df)

# Checking the data frame for null values
colSums(is.na(sp_df))

# Analyzing the student performance data frame

# Plot1
# Creating the first visualization based on student's age and their scores in maths, reading, and writing
# Calculating average of Math Scores
Average = mean(sp_df$Math_Score)

# Plotting the visualization
ggplot(sp_df, mapping = aes(Average, fill = Gender)) + geom_bar(position = "dodge") +
  ggtitle("Average of Maths Scores by Gender") + xlab("Average Score") + ylab("Count") + labs (fill = "Gender")

# The above visualization shows the information about the average of maths scores by gender in student performance data set. A bar plot is used to show
# the averages by gender. The female gender is colored with red and the male gender is colored with blue. From the analysis,
# it is observed that the females have highest average in maths when compared with the males. This plot is useful for the 
# analyst who wants to analyze the average of maths scores. It is used show the patterns or trends quickly.


# Plot 2
# Creating second visualization based on the relationship between reading score and writing score
ggplot(sp_df, aes(x = Reading_Score, y = Writing_Score)) + 
  geom_point()+ geom_smooth() + 
  ggtitle("Relationship between Reading and Writing Scores") + xlab("Reading Score") + ylab("Writing Score")

# The above visualization shows the information about the relationship between reading and writing scores. 
# A scatter plot is used to show the relationship between them. The x - axis represents the reading score and the 
# y - axis represents the writing score. It is observed that there is a positive relationship between the reading and writing scores.
# This visualization is helpful for the analyst who wants to compare the relationship among two variables.


# Plot 3
# Creating third visualization based on the parental education level and reading scores
Viz3 <- sp_df %>% 
  group_by(Parental_Level_of_Education) %>%
  summarise(Read_Total = sum(Reading_Score))

Viz3 %>% ggplot(data = ., aes(x = Parental_Level_of_Education, y = Read_Total, 
                                fill = Parental_Level_of_Education)) + geom_bar(stat = "identity") + 
  labs(title="Parental Education Level and Reading Scores", x = "Parental Education Level", y = "Scores", fill = "Parental Education Level") +
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

# The above visualization shows the information about the parental education level and the reading scores. A bar plot is used to
# show the variation. Each bar represents the total score of each individual parental level of education. Each parental 
# level of education is represented with different color. It is observed that the 'some college' have high reading scores when compared to the other.
# These kind of plots were used to present data in visual form to recognize the hidden patterns 


# Plot 4
# Creating fourth visualization based on the variation of writing scores among different groups
boxplot(sp_df$Writing_Score ~ sp_df$Race_or_Ethnicity, main = "Variation of Writing Scores among the Groups", 
        xlab = "Groups", ylab = "Averages", col = "red")

# The above visualization shows the information about the variation in writing scores among the groups. 
# A box plot is used to show the variation. The boxes were colored in red. The thick black line in the middle of the boxes
# shows the average of each group. By observing the line it conveys that the group E has highest writing score when compared among the other groups. 
# This visualization helpful in analysing the variables among different groups. These plots used to show the distribution of numeric data vlaues.

# Plot 5
# Creating fifth visualization
ggplot(sp_df, aes(x=factor(1), fill = Lunch))+
  geom_bar(width = 1)+ labs(title = "Distribution of lunch types among the students") +
  coord_polar("y")

# The above plot shows the information about the distribution of lunch types among the students. A pie chart is used to display the information.
# The standard is colored in blue and the free/reduced is colored in red. It is observed that there is more standard lunch type than the othe.
# These kind of charts helpful in showing the percentages of data in whole.

# Plot 6
# Creating sixth visualization based on whether completing the test preparation has better chance to be eligible in graduation
ggplot(sp_df, aes(x = Race_or_Ethnicity, fill = Test_Preparation_Course , order = Test_Preparation_Course)) + 
  theme_bw() + geom_bar(position = position_stack(reverse = TRUE)) + 
  ggtitle("Checking whether more practice makes eligible for graduation?") + xlab("Race group") + ylab("Samples") + labs(fill = "Test preaparation")+
  theme(panel.grid.minor = element_blank(), axis.text.x = element_text(angle = 45, hjust = 1))

# The above visualization shows the information about students that more practice makes elgible for graduation among different groups. 
# A stacked bar plot is used to show the information. The Preparation completed is colored in red and the other is colored in blue.
# It is observed from the analysis, the group c makes highest in the prepared candidates. 
# This visualization is helpful in comparing the categories

# Plot7
# Creating seventh visualization which shows the distribution of reading score data
# Plotting the histogram
hist(sp_df$Reading_Score, main = "Distribution of Reading Score", xlab = "Reading Score", ylab = "Count", col = "green")

# The above plot shows the information about the distribution of reading score variable. A histogram is used to show the skewness of data.
# The histogram is colored in green. It is observed that the data is distributed more between 60 and 80.
# These kind of visualizations is used to show the distribution of data. 

