## Codebook - describes run_analysis.R file.

# This project focuses on gathering data, cleaning and prepare a tidy dataset. The data is collected from
human activity database built from the recordings of 30 individuals (subjects) performing daily activities
such as walking, standing, laying, sitting, walking upstairs and walking downstairs.

## x_train and x_test are the main datasets with 561 variables(columns) that had the time, mean, standard deviation and magnitudes.
   y_train and y_test files contains activity numbers and subject_train and subject_test contains the subject numbers (id's)

## Description of variables
### Please note some of the variable names have been changed as part of assignment. For example,
### t - time
### f- frequency
### Acc - accelerometer


* tBodyAcc-XYZ- Mean of Time body accelerometer for subjects with combination of every activity
* tGravityAcc-XYZ -  Mean of time gravity accelerometer for subjects with combination of every         activity
* tBodyAccJerk-XYZ - Mean of time of body's acceleration jerk signals for subjects with combination of every activity
* tBodyGyro-XYZ - Mean of time body gyro for every activity for all combinations
* tBodyGyroJerk-XYZ - Mean of time body gyro jerk for every possible combination of activities.
* tBodyAccMag - Mean of time body accelerometer magnitude
* tGravityAccMag - Mean of time gravity accelerometer magnitude for each subject in every possible activity

* Subject_ID <-  ID of subjects that come from subject test and subject train data. This ranges from 1- 30
* Activity_ID <- ID of activities that is from y_test and y_train data sets. These ID's ranges from 1-6
* Activity_Description <- Description of activities that are numbered from 1-6.
