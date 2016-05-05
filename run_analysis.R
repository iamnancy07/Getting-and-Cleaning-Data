###Merges the training and the test sets to create one data set###

#download zipfile
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./project.zip")

#unzip files
unzip("./project.zip",c("UCI HAR Dataset/train/X_train.txt","UCI HAR Dataset/train/y_train.txt"))
unzip("./project.zip",c("UCI HAR Dataset/test/y_test.txt","UCI HAR Dataset/test/X_test.txt"))
unzip("./project.zip",c("UCI HAR Dataset/features.txt", "UCI HAR Dataset/activity_labels.txt"))
unzip("./project.zip",c("UCI HAR Dataset/train/subject_train.txt", "UCI HAR Dataset/test/subject_test.txt"))
#read feature data from txt file
train_x = read.table("./UCI HAR Dataset/train/X_train.txt")
test_x = read.table("./UCI HAR Dataset/test/X_test.txt")


#combine features datasets
X = rbind(train_x, test_x)

#read activity label data from txt file
train_y = read.table("./UCI HAR Dataset/train/y_train.txt")
test_y = read.table("./UCI HAR Dataset/test/y_test.txt")
#combine activity datasets
Y = rbind(train_y, test_y)

#read subject from txt file
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
#combine subject datasets
subject <- rbind(train_subject, test_subject)
#combine feature and label datasets

dataset = cbind(X, Y, subject)

###Extracts only the measurements on the mean and standard deviation for each measurement.###

#read feature names and label names from txt
features = read.table("./UCI HAR Dataset/features.txt")
labels = read.table("./UCI HAR Dataset/activity_labels.txt")

#rename variable names in dataset

colnames(X) = features$V2

#select variable names that have mean and std 
mean_std_features <- grep("-mean\\(\\)|-std\\(\\)", features$V2)

#extract data with selected feature columns
selected_features <- X[, mean_std_features]


####Uses descriptive activity names to name the activities in the data set######

#merge with labels to get descriptive activity name 

activity_labels <- tolower(merge(Y, labels, by.x = "V1", by.y = "V1", all = TRUE)[,2])
names(subject) <- "subject"
####Appropriately labels the data set with descriptive variable names.######

#lower case all variable names
names(selected_features) <- tolower(names(selected_features))
#remove () from variable names
names(selected_features) <- gsub("\\(|\\)", "", names(selected_features))
names(selected_features) <- gsub("-", "_", names(selected_features))


clean_dataset <- cbind(selected_features, activity_labels, subject)


####From the data set in step 4, creates a second, independent
####tidy data set with the average of each variable for each activity and each subject.####

summarize_dataset <- clean_dataset %>% group_by(subject, activity_labels) %>% summarize_each(funs(mean))

write.table(summarize_dataset, "./final_result.txt", row.names = FALSE)


