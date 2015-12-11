#download zipfile
#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl, "dataset.zip")

#unzip it to local working directory
#setwd("./dataset/UCI HAR Dataset/")

# read X train and test datasets and combine 
X_train <- read.table("train/X_train.txt")
X_test <- read.table("test/X_test.txt")
X <- rbind(X_train, X_test)

#read subject train and test datasets and combine
subject_train <- read.table("train/subject_train.txt") 
subject_test <- read.table("test/subject_test.txt") 
Subject <- rbind(subject_train, subject_test) 

#read y train and test datasets and combine
y_train <- read.table("train/y_train.txt") 
y_test <- read.table("test/y_test.txt") 
Y <- rbind(y_train, y_test) 

#read feature.txt to table as a table of feature names
features <- read.table("features.txt")

#select features names that have either mean or std
wanted_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

#select features from X table with either mean or std in them
X <- X[, wanted_features]

#remane X table with appropriate names from feature names
names(X) <- features[wanted_features, 2]

#clean up the feature names to make it more readable
names(X) <- gsub("\\(|\\)", "", names(X))

names(X) <- tolower(names(X))

#rename Subject column name to "subject"
names(Subject) <- "subject"

#read activity_labels.txt to table
activities <- read.table("activity_labels.txt")

#clean up activity names to make it more readable
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))

#get all activity names for values in Y table
Y[,1] = activities[Y[,1], 2]

#reanme Y column to activity
names(Y) <- "activity"

#combine all three datasets
cleaned <- cbind(Subject, Y, X)

#get the total number of columns in cleaned table
numCols = dim(cleaned)[2]

#create a data.table format for cleaned dataset
cleanedDt <- data.table(cleaned)

#calculate average for each column for each subject and activity
finalDt <- cleanedDt[, lapply(.SD, mean, na.rm=FALSE), by=list(subject, activity), .SDcols=c(3:numCols) ] 

#write table out without row names
write.table(finalDt, "final_dataset_for_mean.txt", row.names = FALSE) 
