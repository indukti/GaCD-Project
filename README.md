## Getting and Cleaning Data Course Project - README

In order to create the tidy data set it is necessary to run the run_analysis.R script. It was implemented in tested in R Studio 0.98 and R 3.2.2 for Windows.

It was assumed that the following input files are available ("." represents the current working directory):
.\UCI HAR Dataset\test\X_test.txt
.\UCI HAR Dataset\test\y_test.txt
.\UCI HAR Dataset\test\subject_test.txt
.\UCI HAR Dataset\test\X_train.txt
.\UCI HAR Dataset\test\y_train.txt
.\UCI HAR Dataset\test\subject_train.txt
.\UCI HAR Dataset\features.txt
.\UCI HAR Dataset\activity_labels.txt


The output file is result.txt (.\UCI HAR Dataset\result.txt - "." represents the current working directory).

The script performs the following actions:
1. Reading input data into new data frames (xTestData, yTestData, subjectTestData, xTrainData, yTrainData, subjectTrainData, features, activities)
1. Modification of column names of yTestData, subjectTestData, yTrainData, subjectTrainData, finalData, featureVariables objects
2. Merging data sets by adding new columns with data (xTestData + yTestData + subjectTestData, xTrainData + yTrainData + subjectTrainData)
3. Merging data sets by adding new rows with data (finalTestData + finalTrainData)
4. Selecting only specific columns from finalData data table which represent standard deviations, means and two extra columns with activity and subject ids
5. Joining activities and finalData data frames on ActivityId column so that ActivityName column is available in finalData data frame
6. Grouping values of finalData data frame by ActivityName and SubjectId columns and writing the resulting data set to tidyData data frame
7. Writing tidyData data frame to result.txt file
