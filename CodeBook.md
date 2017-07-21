# Getting and Cleaning Data Course Project - CodeBook

## Input Data
1. X_test.txt - the test data set  
2. y_test.txt - activity identifiers of the test set  
3. subject_test.txt - subject identifiers of the test set  
4. X_train.txt - the train set  
5. y_train.txt - activity identifiers of the train set  
6. subject_train.txt - subject identifiers of the train set  
7. features.txt - features' identifiers and their names   
8. activites.txt - activities' identifiers and their names  

## Variables  
1. xTestData (data table) - contains the test data loaded from X_test.txt
2. yTestData (data table) - contains the test data labels (activity identifiers - integers between 1 and 6) loaded from y_test.txt 
3. subjectTestData (data table) - contains the test data subjects (identifiers of people who performed the activities, integers between 1 and 30) loaded from subject_test.txt
4. finalTestData (data table) - contains merged values from xTestData, yTestData and subjectTestData
5. xTrainData (data table) - contains the train data loaded from X_train.txt
6. yTrainData (data table) - contains the train data labels (activity identifiers - integers between 1 and 6) loaded from y_train.txt 
7. subjectTrainData (data table) - contains the train data subjects (identifiers of people who performed the activities, integers between 1 and 30) loaded from subject_train.txt
8. finalTrainData (data table) - contains merged values from xTrainData, yTrainData and subjectTrainData 
9. finalData (data table) - contains merged values from finalTestData and finalTrainData
10. features (data table) - contains values of features' identifiers and names loaded from features.txt
11. featuresVariables (data frame) - contains features' identifiers and names which are related to standard deviations or means. Two extra rows are added which contains indicies of activities and subject identifiers in a vector of column names of finalData data frame (names(finalData))  
12. activities (data table) - contains identifiers and names of the activities loaded from activities.txt
13. tidyData (data table) - contains the final tidy data set  

## Transformations
1.  Read the input data into new data tables (xTestData, yTestData, subjectTestData, xTrainData, yTrainData, subjectTrainData, features, activities)  
2.  Modify column names of the yTestData, subjectTestData, yTrainData, subjectTrainData, finalData, featureVariables objects  
3.  Merge data sets by adding new columns with data (xTestData + yTestData + subjectTestData, xTrainData + yTrainData + subjectTrainData)  
4.  Combine the test and train data sets
5.  Select specific columns from the finalData data table which represent standard deviations, means and two extra columns with activity and subject ids  
6.  Join the activities and finalData data tables on ActivityId so that the ActivityName column is available in the finalData data table  
7.  Group the values of the finalData data table by the ActivityName, SubjectId, Measure columns and calculate mean values 
8.  Write the final tidyData data table to the result.txt file  

# Output Data
The output is saved to result.txt file. The first row is a header with the SubjectId, Activity, Measure and Value strings. The file contains 11880 data rows. The values are separated by commas.