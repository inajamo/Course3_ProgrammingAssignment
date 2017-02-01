library(data.table)
library(dplyr)

#1. Merges the  x training and the test sets to create one data set
# Read Data tables "x_train" and "x_test" 
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")

# Merge both x_train and x_test dataframes

merged_x <- rbind(xTrain,xTest)


# Add "subject_train" and "subject_test" as columns intot the merged dataframe to get the subject_id

# fisrt, read both data sets
trainData <- read.table("UCI HAR Dataset/train/subject_train.txt")
testData <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge these data sets to create a dataframe that can be added as a column in "merged_df"

mergedTestData <- rbind(trainData, testData)


# Add activity by merging "y_train" and "y_test" data frames
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")

# Merge yTest and yTrain to later merge into the "merge_df" data frame

merged_y <- rbind(yTrain, yTest)


# Now rename the rest of the columns using the "features" file
# Read features data set

features <- read.table("UCI HAR Dataset/features.txt")

#colnames(merged_df)[1] <- "Subject_ID"
#colnames(merged_df)[2] <- "Activity_ID"
#colnames(merged_df)[-(1:2)]<- as.character(features[,2])

names(merged_x) <- features$V2 
names(mergedTestData) <- c("Subject_ID") 
names(merged_y) <- c("Activity_ID") 


# Now, merge all data frames created above ("merged_x", "mergedTestData", "merged_y") to have the subject, activity and xtrain and xtest data frame

merged_df <- cbind(merged_y, mergedTestData)
merged_df <- cbind(merged_x, merged_df)

## 2. Extracts the data that has only the mean or std. 

keep <- features$V2[grep("mean\\(|std\\(",features$V2)]

keep <- c(as.character(keep), "Activity_ID", "Subject_ID")

Dataset <- subset(merged_df, select=keep)


## 3 Uses descriptive activity names to name the acitivites in the data set

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activityLabels) <- c("Activity_ID", "ActivityDescription")

finalMerge <- merge(Dataset, activityLabels, by='Activity_ID',all.x=TRUE);
# Drop 'Activity_ID" as it is repeating

finalMerge <- select(finalMerge, -Activity_ID);

# 4. Appropriately labels the data set with descriptive variable names - ex: "t" can be replaced as time, etc..

names(finalMerge)<-gsub("^t", "Time", names(finalMerge))
names(finalMerge)<-gsub("^f", "Frequency", names(finalMerge))
names(finalMerge)<-gsub("Acc", "Accelerometer", names(finalMerge))
names(finalMerge)<-gsub("Mag", "Magnitude", names(finalMerge))
names(finalMerge)<-gsub("Gyro", "Gyroscope", names(finalMerge))


# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each acitivity and each subject
# Group the data by Activity_ID and Subject_ID 
tidy_Data <- aggregate(.~ Subject_ID + ActivityDescription, finalMerge, mean)


# Now, write the data set into a file.
write.table(tidy_Data, file = "data/tidy_data.txt", row.name = FALSE)




