# Cleaning_Data_Project
Contains the submission of final project of Cleaning Data course under the Data Science Specialization (Coursera)

Title: "README.md"
m ini
The project is based on data collected from the accelerometers  from the samsung galaxy smarphone. Full description of the dataset is available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Files in this repo

* README.md -> explains the analysis
* CodeBook.md -> describes variables, the data and transformations
* run_analysis.R -> original R code

## Description of the DATA
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

## Description of abbreviations of measurements
*leading t or f is based on time or frequency measurements.
*Body = related to body movement.
*Gravity = acceleration of gravity
*Acc = accelerometer measurement
*Gyro = gyroscopic measurements
*Jerk = sudden movement acceleration
*Mag = magnitude of movement
*mean and SD are calculated for each subject for each activity for each mean and SD measurements.


## Run_analysis.R

This is the main script that is called to performed the cleaning and tidying of the dataset as described in the excercise and listed below.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This file assumes that datazip file has been downloaded and unzipped.
