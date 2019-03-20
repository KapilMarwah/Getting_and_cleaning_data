##Getting-and-Cleaning-Data-Week-4-Assignment

This project includes four files: README.md, codebook.md, run_analysis.R, tidyDataSet.txt

Following activites are performed in run_analysis.R:

1) Download the dataset ((https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to working directory and unzip.
2) Load the dataset: x_train.txt, x_test.txt, y_train.txt, y_test.txt, subject_train.txt, subject_test.txt, features.txt, activity_labels.txt.
3) Merges the y_train, x_train and subject_train.
4) Merges the y_test, x_test and subject_test.
5) Merges the subject_train and subject_test.
6) Extracts only the measurements on the mean and standard deviation for each measurement.
7) Uses descriptive activity names to name the activities in the data set.
8) Creates a second, independent tidy data set (tidyDataSet.txt) with the average of each variable for each activity and each subject.

Codebook.md contains data to indicate all the variables and summaries calculated, along with units, and any other relevant information.

