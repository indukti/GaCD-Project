# Getting and Cleaning Data Course Project - CodeBook

## Variables  
1. xTestData (data frame) - contains test data loaded from X_test.txt file  
2. yTestData (data frame) - contains test data labels (activity identifiers, integers between 1 and 6) loaded from y_test.txt file  
3. subjectTestData (data frame) - contains test data subjects (identifiers of people who performed the activity for each window sample, integers between 1 and 30) loaded from subject_test.txt file  
4. finalTestData (data frame) - contains values from xTestData, yTestData and subjectTestData merged together  
5. xTrainData (data frame) - contains train data loaded from X_train.txt file  
6. yTrainData (data frame) - contains train data labels (activity identifiers, integers between 1 and 6) loaded from y_train.txt file  
7. subjectTrainData (data frame) - contains train data subjects (identifiers of people who performed the activity for each window sample, integers between 1 and 30) loaded from 8. subject_train.txt file  
8. finalTrainData (data frame) - contains values from xTrainData, yTrainData and subjectTrainData merged together  
9. finalData (data frame) - contains values from finalTestData and finalTrainData merged together  
10. features (data frame) - contains values of features' identifiers and names loaded from features.txt file  
11. featuresVariables (data frame) - contains values of features' identifiers and names which are related to standard deviations or means. Two extra rows are added which contains indicies of activities and subject identifiers in a vector of column names of finalData data frame (names(finalData))  
12. activities (data frame) - contains identifiers and names of activities loaded from activities.txt file  
13. tidyData (data frame) - contains tidy data set  
  
## Data
1. X_test.txt - test set  
2. y_test.txt - activity identifiers of test set  
3. subject_test.txt - each row identifies the subject who performed the activity for each window sample (in X_test.txt, y_test.txt). Its range is from 1 to 30  
4. X_train.txt - train set  
5. y_train.txt - activity identifiers of train set  
6. subject_train.txt - each row identifies the subject who performed the activity for each window sample (in X_train.txt, y_train.txt). Its range is from 1 to 30  
7. features.txt - list of all features  
8. activites.txt - links the class labels with their activity name  

## Transformations
1. Reading input data into data frames (xTestData, yTestData, subjectTestData, xTrainData, yTrainData, subjectTrainData, features, activities)  
1. Modification of column names of yTestData, subjectTestData, yTrainData, subjectTrainData, finalData, featureVariables objects  
2. Merging data sets by adding new columns with data (xTestData + yTestData + subjectTestData, xTrainData + yTrainData + subjectTrainData)  
3. Merging data sets by adding new rows with data (finalTestData + finalTrainData)  
4. Selecting only specific columns from finalData data table which represent standard deviations, means and two additional columns with activity and subject ids  
5. Joining activities and finalData data frames on ActivityId column so that ActivityName column is available in finalData data frame  
6. Grouping values of finalData data frame by ActivityName and SubjectId columns and writing the resulting data set to tidyData data frame  
7. Writing tidyData data frame to result.txt file  
