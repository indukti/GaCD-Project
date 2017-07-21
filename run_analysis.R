### 1st point
# Load test data
xTestData <- read.table(file.path(".", "UCI HAR Dataset", "test", "X_test.txt"))
yTestData <- read.table(file.path(".", "UCI HAR Dataset", "test", "y_test.txt"))
subjectTestData <- read.table(file.path(".", "UCI HAR Dataset", "test", "subject_test.txt"))
names(yTestData) <- c("ActivityId")
names(subjectTestData) <- c("SubjectId")
# Combine test data into a single data set
finalTestData <- cbind(xTestData, yTestData)
finalTestData <- cbind(finalTestData, subjectTestData)

# Load training data
xTrainData <- read.table(file.path(".", "UCI HAR Dataset", "train", "X_train.txt"))
yTrainData <- read.table(file.path(".", "UCI HAR Dataset", "train", "y_train.txt"))
subjectTrainData <- read.table(file.path(".", "UCI HAR Dataset", "train", "subject_train.txt"))
names(yTrainData) <- c("ActivityId")
names(subjectTrainData) <- c("SubjectId")
# Combine training data into a single data set
finalTrainData <- cbind(xTrainData, yTrainData)
finalTrainData <- cbind(finalTrainData, subjectTrainData)

# Combine test & training data into a single data set
finalData <- rbind(finalTestData, finalTrainData)


### 2nd point
# Load features.txt file
features <- read.table(file.path(".", "UCI HAR Dataset", "features.txt"), stringsAsFactors=FALSE)
names(features) <- c("FeatureId","Feature")

featureVariables <- data.frame(FeatureId = integer(), Feature = character(), stringsAsFactors = FALSE)
# Extract mean variables and store the values in featureVariables
featureVariables <- rbind(featureVariables, features[grep("mean\\(\\)",features$Feature),])
# Extract std variables and store the values in featureVariables
featureVariables <- rbind(featureVariables, features[grep("std\\(\\)",features$Feature),])
# Add ActivityId and SubjectId columns
featureVariables <- rbind(featureVariables, c(match("ActivityId", names(finalData)), "ActivityId"))
featureVariables <- rbind(featureVariables, c(match("SubjectId", names(finalData)), "SubjectId"))

# Extract only the columns which contain standard deviation or means values (+ ActivityId and SubjectId columns)
finalData <- finalData[as.numeric(featureVariables$FeatureId)]


### 3rd point
# Name the activities in the data set
library(dplyr)
activities <- read.table(file.path(".", "UCI HAR Dataset", "activity_labels.txt"), stringsAsFactors=FALSE)
names(activities) <- c("ActivityId", "Activity")
finalData <- inner_join(finalData, activities)


### 4th point
# Set descriptive variable names
featureVariables$Feature <- gsub("Acc","Acceleration",featureVariables$Feature)
featureVariables$Feature <- gsub("Gyro","Gyroscope",featureVariables$Feature)
featureVariables$Feature <- gsub("std\\(\\)","StandardDeviation",featureVariables$Feature)
featureVariables$Feature <- gsub("mean\\(\\)","Mean",featureVariables$Feature)
featureVariables$Feature <- gsub("-","",featureVariables$Feature)
names(finalData) <- c(featureVariables$Feature, "Activity")
# Get rid of the ActivityId column - it is no longer needed
finalData <- select(finalData, -ActivityId)


### 5th point
# Group data and calculate means
library(tidyr)
tidyDataGathered <- gather(finalData, key = Measure, value = Value, -c(SubjectId, Activity))
tidyDataGrouped <- group_by(tidyDataGathered, SubjectId, Activity, Measure)
tidyData <- summarize(tidyDataGrouped, Mean = mean(Value))

# Write the final values to a file
write.table(tidyData, file.path(".", "UCI HAR Dataset", "result.txt"), row.names = FALSE, sep = ",")
