#Peer Graded Assignment: Getting and Cleaning Data Course Project

##Getting Data from the web
#create name for dta to be downloaded
filename <- "untidy_data.zip"
#Check to see if directory exist if not create it
if(!file.exists("/Tidy_Data")){dir.create("./Tidy_data")}
#change directory to new created folder
setwd("./Tidy_data")
#Website where data is located
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download file
download.file(fileurl, filename)
#unzip datalis
unzip(filename)

#Merge the training and test data

# Reading trainings tables:
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# Reading testing tables:
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table(".//UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table('./UCI HAR Dataset/features.txt')

# Reading activity labels:
activityLabels = read.table('./UCI HAR Dataset/activity_labels.txt')

# Assign column names
colnames(x_train) <- features[,2] 
colnames(y_train) <- "activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

# Merge all tables 
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
testdata <- rbind(mrg_train, mrg_test)

#Review Data 
head(testdata, 5)
tail(testdata, 5)
str(testdata)

# Read all column names
colNames <- colnames(testdata)

# Extracting the meand and standard deviation for each measurement
mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

means_std_dataset <- testdata[ , mean_and_std == TRUE]

#Further tidying of column names from revie of data 

# Where "Acc" can be replaced with "Accelerometer"
# Where "Gyro" can be replaced with "Gyroscope"
# Where "BodyBody" can be replaced with "Body"
# Where "Mag" can be replaced with "Magnitude"
# Where Character "f" can be replaced with F"req"
# Where Character "t" can be replaced with "Time"

names(means_std_dataset)<-gsub("Acc", "Accelerometer", names(means_std_dataset))
names(means_std_dataset)<-gsub("Gyro", "Gyroscope", names(means_std_dataset))
names(means_std_dataset)<-gsub("BodyBody", "Body", names(means_std_dataset))
names(means_std_dataset)<-gsub("Mag", "Magnitude", names(means_std_dataset))
names(means_std_dataset)<-gsub("^t", "Time", names(means_std_dataset))
names(means_std_dataset)<-gsub("^f", "Frequency", names(means_std_dataset))
names(means_std_dataset)<-gsub("tBody", "TimeBody", names(means_std_dataset))
names(means_std_dataset)<-gsub("-mean()", "Mean", names(means_std_dataset), ignore.case = TRUE)
names(means_std_dataset)<-gsub("-std()", "STD", names(means_std_dataset), ignore.case = TRUE)
names(means_std_dataset)<-gsub("-freq()", "Freq", names(means_std_dataset), ignore.case = TRUE)
names(means_std_dataset)<-gsub("angle", "Angle", names(means_std_dataset))
names(means_std_dataset)<-gsub("gravity", "Gravity", names(means_std_dataset))

# Using descriptive activity names to name the activities in the data set
set_D_names <- merge(means_std_dataset, activityLabels,
                              by='activityId',
                              all.x=TRUE)

# Making second data set th the average of each variable for each activity and each subject
secTidySet <- aggregate(. ~subjectId + activityId, set_D_names, mean)
secTidySet <- aggregate(set_D_names[, 3:ncol(set_D_names)],
                       by=list(subjectId = set_D_names$subjectId, 
                               activityType = set_D_names$activityType),
                       mean, na.rm= TRUE)

secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]
# Save second data set as a text file
write.table(secTidySet, "secTidySet.txt", row.name=FALSE)
