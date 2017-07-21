## Getting and Cleaning Data Course Project - README

In order to create the final tidy data set it is necessary to run the run_analysis.R script. It was implemented and tested in R Studio 1.0.143 and R 3.4.1 for Linux (Xubuntu 16.04). The script loads and utilizes the dplyr and tidyr packages.

The following input files should be available (where . represents the current working directory):  
.\UCI HAR Dataset\test\X_test.txt  
.\UCI HAR Dataset\test\y_test.txt  
.\UCI HAR Dataset\test\subject_test.txt  
.\UCI HAR Dataset\test\X_train.txt  
.\UCI HAR Dataset\test\y_train.txt  
.\UCI HAR Dataset\test\subject_train.txt  
.\UCI HAR Dataset\features.txt  
.\UCI HAR Dataset\activity_labels.txt  


The output file is result.txt (.\UCI HAR Dataset\result.txt where . represents the current working directory).  

The script performs the following actions:  
1.  Read the input data into new data tables (xTestData, yTestData, subjectTestData, xTrainData, yTrainData, subjectTrainData, features, activities)  
2.  Modify column names of the yTestData, subjectTestData, yTrainData, subjectTrainData, finalData, featureVariables objects  
3.  Merge data sets by adding new columns with data (xTestData + yTestData + subjectTestData, xTrainData + yTrainData + subjectTrainData)  
4.  Combine the test and train data sets
5.  Select specific columns from the finalData data table which represent standard deviations, means and two extra columns with activity and subject ids  
6.  Join the activities and finalData data tables on ActivityId so that the ActivityName column is available in the finalData data table  
7.  Group the values of the finalData data table by the ActivityName, SubjectId, Measure columns and calculate mean values 
8.  Write the final tidyData data table to the result.txt file  
