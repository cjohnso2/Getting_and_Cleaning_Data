# Getting_and_Cleaning_Data
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
1. Download all files and merge into one data set
2-Extracts only the measurements on the mean and standard deviation for each measurement by selceting column names that contains "means" or "std

3-Uses descriptive activity names to name the activities in the data set by merging previous table using columns test_label in global file and corresponding column in activity_labels_df file and reorganizing column to have activity number and activity names side by side.

4-Appropriately labels the data set with descriptive variable names. Already done previously for tables . Just renaming activityname and Activityindex

5-From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
