### POINT 1
# Loading test data
xTestData <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
yTestData <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
subjectTestData <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
names(yTestData) <- c("ActivityId")
names(subjectTestData) <- c("SubjectId")
# Combine test data into a single data set
finalTestData <- cbind(xTestData,yTestData)
finalTestData <- cbind(finalTestData,subjectTestData)

# Loading training data
xTrainData <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
yTrainData <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
subjectTrainData <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
names(yTrainData) <- c("ActivityId")
names(subjectTrainData) <- c("SubjectId")
# Combine training data into a single data set
finalTrainData <- cbind(xTrainData,yTrainData)
finalTrainData <- cbind(finalTrainData,subjectTrainData)

# Merge test & training data into a single data set
finalData <- rbind(finalTestData,finalTrainData)


### POINT 2
# Load features.txt file
features <- read.table(".\\UCI HAR Dataset\\features.txt", stringsAsFactors=FALSE)
names(features) <- c("FeatureId","FeatureName")

# Extract mean variables and store the values in featureVariables
featureVariables <- features[grep("mean\\(\\)",features$FeatureName),]
# Extract indices of std variables and store the values in featureVariables
featureVariables <- rbind(featureVariables, features[grep("std\\(\\)",features$FeatureName),])
# Add activity and subject columns
featureVariables <- rbind(featureVariables, c(match("ActivityId", names(finalData)),"ActivityId"))
featureVariables <- rbind(featureVariables, c(match("SubjectId", names(finalData)),"SubjectId"))

# Select only columns which contains standard deviations or means (+ activity and subject)
finalData <- finalData[as.numeric(featureVariables$FeatureId)]


### POINT 4 
# Set descriptive variable names
featureVariables$FeatureName <- gsub("Acc","Acceleration",featureVariables$FeatureName)
featureVariables$FeatureName <- gsub("Gyro","Gyroscope",featureVariables$FeatureName)
featureVariables$FeatureName <- gsub("std\\(\\)","StandardDeviation",featureVariables$FeatureName)
featureVariables$FeatureName <- gsub("mean\\(\\)","Mean",featureVariables$FeatureName)
featureVariables$FeatureName <- gsub("-","",featureVariables$FeatureName)
names(finalData) <- featureVariables$FeatureName


### POINT 3
# Name the activities in the data set
activities <- read.table(".\\UCI HAR Dataset\\activity_labels.txt", stringsAsFactors=FALSE)
names(activities) <- c("ActivityId","ActivityName")
finalData <- merge(finalData, activities, by="ActivityId", all=FALSE)
# Get rid of ActivityId column - it is no longer needed
finalData <- finalData[,!(names(finalData) %in% c("ActivityId"))]


### POINT 5
# Group data and calculate means
tidyData <- melt(finalData, id=c("ActivityName", "SubjectId"))
tidyData <- dcast(tidyData, ActivityName + SubjectId ~ variable, mean)

# Write values to a file
write.table(tidyData,".\\UCI HAR Dataset\\result.txt", row.names=FALSE, sep=",")
