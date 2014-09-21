# ==================================================================
#         Human Activity Recognition Using Smartphones Dataset
#         Version 1.0
# ==================================================================
# setwd("~/Dropbox/Coursera/DataCleaning/proj1/UCI HAR Dataset")

# libraries to manipulate data frames
library(plyr)

# the relevant data sets for our analysis  (as deduced from the README.txt file) are
# 
# 'train/X_train.txt': Training set.
# 'train/y_train.txt': Training labels.
# 'test/X_test.txt': Test set.
# 'test/y_test.txt': Test labels.
# 'train/subject_train.txt': each row identifies one of the 30 volunteers. Range=1:30
# 'test/subject_test.txt': each row identifies one of the 30 volunteers. Range=1:30
# 'activity_labels.txt': Links the class labels with their activity name.
# 'features.txt': List of all features.

# read all input files 

# training measurements
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")

# training labels identifying the type of activity
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")

# subject identifier tag
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

# activity labels
act <- read.table("UCI HAR Dataset/activity_labels.txt")

# description of the measurements
feat <- read.table("UCI HAR Dataset/features.txt")

# Points of the assignment project
# merge columns containing info about the subject identifier and the activity type 
test <- cbind(subjectTest, yTest, xTest)
train <- cbind(subjectTrain, yTrain, xTrain)
rm(subjectTest,subjectTrain,yTest,yTrain,xTest,xTrain)
gc()

# merge train and test
data <- rbind(train, test)


# Appropriately label the data set with descriptive variable names
# get the descriptive var names from features.txt
names(data) <- c("subjectId","activity", as.character(feat$V2))
rm(train, test,feat)
gc()

# Use descriptive activity names to name the activities in the data set
# get the activity descriptive label from activity_labels.txt
data$activity = factor(data$activity, labels = act$V2 )

# Extract only the measurements on the mean and standard deviation for each measurement. 
#
data <- data[,c(grep("subjectId|activity|mean|std",names(data)))]

# From the previous dataset, create a second, independent tidy data set with the average of each 
# variable for each activity and each subject.
# 
cdata <- ddply(data, c("subjectId","activity"), numcolwise(mean))

write.table(cdata,file="tidyDataset.txt",row.names=F)

# rm(list=ls())
# check <-read.table("tidyDataset.txt",header=T)
