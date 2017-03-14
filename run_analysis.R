library(dplyr)

#Reading data from the text files
features <- read.table("./Dataset/features.txt")
activity_labels <- read.table("./Dataset/activity_labels.txt")

test_subject <- read.table("./Dataset/test/subject_test.txt")
test_set <- read.table("./Dataset/test/X_test.txt")
test_labels <- read.table("./Dataset/test/y_test.txt")

training_subject <- read.table("./Dataset/train/subject_train.txt")
training_set <- read.table("./Dataset/train/X_train.txt")
training_labels <- read.table("./Dataset/train/y_train.txt")

#Rename columns in datasets

names(test_set) <- features$V2
names(training_set) <- features$V2
names(test_labels) <- "activity"
names(training_labels) <- "activity"
names(test_subject) <- "subject"
names(training_subject) <- "subject"

#1. Merging the training and the test sets to create one data set

#merging test set
test_merged <- cbind(test_subject,test_labels,test_set)
#merging training set
training_merged <- cbind(training_subject,training_labels,training_set)
#Final merging both test and training data sets
merged_final <- rbind(test_merged,training_merged)


#2. Extract only the measurements on the mean and standard deviation for each measurement

#Removing duplicate columns from dataset
merged_final <- merged_final[ ,!duplicated(colnames(merged_final))]
#Select (retaining activity and subject for use in step 3 and 5 respectively)
merged_final <- select(merged_final, subject, activity, matches('mean|std'))


#3. Using descriptive activity names to name the activities in the data set
merged_final <- mutate(merged_final, 
                         activity = as.character(activity_labels$V2[merged_final$activity]))

#4. Labeling the data set with descriptive variable names

names(merged_final)<-gsub("tBodyAcc-",
                          "Body acc (time domain from accelerometer)",
                          names(merged_final))

names(merged_final)<-gsub("tGravityAcc-",
                          "Gravity acc (time domain from accelerometer)",
                          names(merged_final))

names(merged_final)<-gsub("tBodyAccJerk-",
                          "Body acc jerk (time domain from accelerometer)",
                          names(merged_final))

names(merged_final)<-gsub("tBodyGyro-",
                          "Body acc (time domain from gyroscope)",
                          names(merged_final))

names(merged_final)<-gsub("tBodyGyroJerk-",
                          "Body acc jerk (time domain from  gyroscope)",
                          names(merged_final))

names(merged_final)<-gsub("tBodyAccMag-",
                          "Body acc (time domain FFT from accelerometer)",
                          names(merged_final))

names(merged_final)<-gsub("tGravityAccMag-",
                          "Gravity acc (time domain FFT from accelerometer)",
                          names(merged_final))

names(merged_final)<-gsub("tBodyAccJerkMag-",
                          "Body acc jerk (time domain FFT from accelerometer)",
                          names(merged_final))

names(merged_final)<-gsub("tBodyGyroMag-",
                          "Body acc(time domain FFT from gyroscope)",
                          names(merged_final))

names(merged_final)<-gsub("tBodyGyroJerkMag-",
                          "Body acc jerk(time domain FFT from gyroscope)",
                          names(merged_final))

names(merged_final)<-gsub("fBodyAcc-",
                          "Body acc (freq domain from accelerometer)",
                          names(merged_final))

names(merged_final)<-gsub("fBodyAccJerk-",
                          "Body acc jerk(freq domain from accelerometer)",
                          names(merged_final))

names(merged_final)<-gsub("fBodyGyro-",
                          "Body acc (freq domain from gyroscope)",
                          names(merged_final))

names(merged_final)<-gsub("fBodyBodyAccMag-",
                          "Body acc (freq domain FFT from accelerometer)",
                          names(merged_final))

names(merged_final)<-gsub("fBodyAccMag-",
                          "Body acc (freq domain FFT from accelerometer)",
                          names(merged_final))

names(merged_final)<-gsub("fBodyBodyAccJerkMag-",
                          "Body acc jerk(freq domain FFT from accelerometer)",
                          names(merged_final))

names(merged_final)<-gsub("fBodyBodyGyroMag-",
                          "Body acc(freq domain FFT from gyroscope)",
                          names(merged_final))

names(merged_final)<-gsub("fBodyBodyGyroJerkMag-",
                          "Body acc jerk(freq domain FTT from gyroscope)",
                          names(merged_final))

names(merged_final)<-gsub("mean()",
                          "MEAN",
                          names(merged_final))

names(merged_final)<-gsub("std()",
                          "SD",
                          names(merged_final))


#5. Independent tidy data set

Final_Tidy<-merged_final %>%
    group_by(subject,activity) %>%
    summarise_all(mean)
write.table(Final_Tidy, "TidyData.txt", row.name=FALSE)
