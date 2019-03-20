## Course: Getting and Cleaning Data
## Author: Kapil Marwah
## Date:   20-Mar-2019

library(dplyr)

#Download the dataset
if(!file.exists("./getCleanDataProject")){dir.create("./getCleanDataProject")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./getCleanDataProject/projectdataset.zip")

#Unzip the downloaded dataset
unzip(zipfile = "./getCleanDataProject/projectdataset.zip", exdir = "./getCleanDataProject")

setwd("./getCleanDataProject")

#Read the unzipped data & assign variable names
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## a) 
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

## b) 
colnames(x_test) <- features[,2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

## c) 
colnames(activity_labels) <- c("activityID", "activityType")

#Now we have the data in tables to process as per directions:

##### 1. Merges the training and the test sets to create one data set.
combined_train <- cbind(y_train, subject_train, x_train)
combined_test <- cbind(y_test, subject_test, x_test)
merged_dataset <- rbind(combined_train, combined_test)


##### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

mean_std <- (grepl("activityID", colnames(merged_dataset)) |
             grepl("subjectID", colnames(merged_dataset)) |
             grepl("mean", colnames(merged_dataset)) |
             grepl("std", colnames(merged_dataset)))

mean_std_dataset <- merged_dataset[, mean_std == TRUE]


##### 3.Uses descriptive activity names to name the activities in the data set

activity_names_dataset <- merge(mean_std_dataset, activity_labels, by = "activityID", all.x = TRUE)


##### 4.Appropriately labels the data set with descriptive variable names.
      ## Already done in steps a) , b) and c).


##### 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
#####   each activity and each subject.

tidy_data <- activity_names_dataset %>% group_by(activityID, subjectID) %>% summarize_all(mean)

#Write the Tidy dataset into a file
write.table(tidy_data, "./tidyDataSet.txt", row.names = FALSE, col.names = TRUE)

