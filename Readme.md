## This is README.MD file

## Downloading Data
  * Download "UCI HAR Dataset" using the link provided in the assignment
  * Unzip the downloaded file and makes sure the working directory is correct

## Read data tables
  * Read "x_train" and "x_test" data sets
  * merge both data tables
  * Read "train_data" and "test_data" to cerate subject_id
  * Read both "y_train" and "y_test" data sets and merge them to crate activity_id
  * Now, merge all the data frames together to create the merged data frame

## Add labels to the column name
  * Add subject_id and activity_id

## Extract only the measurement of mean and standard deviation for each measurement
  * Using "grep" function extract only the columns that has mean and standard deviation

## Add descriptive activity names to the merged data frame
  * load text file "activity_labels" into R
  * Add activity names using "activity_labels" file that is given
  * merge both activity label data frame and already merged data frame with corresponding "ids"
  * Rename added columns as "ActivityDescription" in the data frame

## Label data set with descriptive variable name. Example shown below
  * rename "t" with time
  * rename "f" with frequency
  * rename "acc" with accelerometer

## Group the data by subject_id and activity description to obtain the subset of the data frame. (This will have 180 rows in the data frame)

## Write the tidy data frame into a file
