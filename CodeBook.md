
a.Variables in the final_result.txt file
 
[1] "subject"                   "activity_labels"           "tbodyacc_mean_x"           "tbodyacc_mean_y"          
 [5] "tbodyacc_mean_z"           "tbodyacc_std_x"            "tbodyacc_std_y"            "tbodyacc_std_z"           
 [9] "tgravityacc_mean_x"        "tgravityacc_mean_y"        "tgravityacc_mean_z"        "tgravityacc_std_x"        
[13] "tgravityacc_std_y"         "tgravityacc_std_z"         "tbodyaccjerk_mean_x"       "tbodyaccjerk_mean_y"      
[17] "tbodyaccjerk_mean_z"       "tbodyaccjerk_std_x"        "tbodyaccjerk_std_y"        "tbodyaccjerk_std_z"       
[21] "tbodygyro_mean_x"          "tbodygyro_mean_y"          "tbodygyro_mean_z"          "tbodygyro_std_x"          
[25] "tbodygyro_std_y"           "tbodygyro_std_z"           "tbodygyrojerk_mean_x"      "tbodygyrojerk_mean_y"     
[29] "tbodygyrojerk_mean_z"      "tbodygyrojerk_std_x"       "tbodygyrojerk_std_y"       "tbodygyrojerk_std_z"      
[33] "tbodyaccmag_mean"          "tbodyaccmag_std"           "tgravityaccmag_mean"       "tgravityaccmag_std"       
[37] "tbodyaccjerkmag_mean"      "tbodyaccjerkmag_std"       "tbodygyromag_mean"         "tbodygyromag_std"         
[41] "tbodygyrojerkmag_mean"     "tbodygyrojerkmag_std"      "fbodyacc_mean_x"           "fbodyacc_mean_y"          
[45] "fbodyacc_mean_z"           "fbodyacc_std_x"            "fbodyacc_std_y"            "fbodyacc_std_z"           
[49] "fbodyaccjerk_mean_x"       "fbodyaccjerk_mean_y"       "fbodyaccjerk_mean_z"       "fbodyaccjerk_std_x"       
[53] "fbodyaccjerk_std_y"        "fbodyaccjerk_std_z"        "fbodygyro_mean_x"          "fbodygyro_mean_y"         
[57] "fbodygyro_mean_z"          "fbodygyro_std_x"           "fbodygyro_std_y"           "fbodygyro_std_z"          
[61] "fbodyaccmag_mean"          "fbodyaccmag_std"           "fbodybodyaccjerkmag_mean"  "fbodybodyaccjerkmag_std"  
[65] "fbodybodygyromag_mean"     "fbodybodygyromag_std"      "fbodybodygyrojerkmag_mean" "fbodybodygyrojerkmag_std" 

b.How to create the final_result.txt file
   - download [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to working directory.
   - unzip relevent files (train, test datasets for X, Y and subject)
   - read txt files
   - combine test and train datasets for each of X, Y and subject
   - rename X colnames and select feature names with -mean() or -std()
   - merge Y table with label table to get more descriptive activity name, change variable value to lowercase
   - rename Y and subject colnames
   - clean X colnames so that they are all lowercase, remove (), replace "-" with "_"
   - combine cleaned datasets of X, Y and subject
   - creates an independen, tidy data set with the average of each variable for each activity and each subject
