## **CodeBook.md**

**Study Design**
This Getting and Cleaning Data project uses a dataset from a study that evaluated 30 volunteers(subjects) performing six activities while wearing a Samsung Galaxy S II.  During the activities, 561 measurements were collected.  The 30 volunteers were divided into two groups: 
 - 70% in training
 - 30% in test

The original data sets downloaded included variables and values in separate files.
For each training and test group, the following files were used:
 - **X_train.txt, X_test.txt:** the actual variable values collected during the activities
 - **y_train.txt, y_test.txt:** the activity ids associated with the variable values collected 
 - **subject_train.txt, subject_test.txt:** the ids of the subjects who participated in the study

Also provided were two data files containing variable and label names that correspond to the values collected in the `X_train.txt` and `X_test.txt` files:
 - **features.txt:** the variables collected during the study
 - **activity_labels.txt:** descriptive labels corresponding to activities 1-6

An R script `run_analysis.R` was created to download the dataset zip file, create separate training and test data frames, and merge those into one data frame. 

After the data frame was created with descriptive labels for variable names and activities,
only those variables containing either a mean() or std() value were added to a data frame to perform further analysis.  Of the original 561 variables, 66 were included in the final output.

Finally, an output file,  `tidy.txt`, was created based on the average of the subject and activity per variable.

**Instruction List**

***Pre-requisites:***
This project requires the following packages to be installed before execution:

 - `library(dplyr)` 
 - `library(reshape)`

Project output (`tidy.txt`) may be replicated by sourcing and executing the included **run_analysis.R** script.

**Code Book**

6 activities were included in the study:

 - WALKING 
 - WALKING_UPSTAIRS 
 - WALKING_DOWNSTAIRS 
 - SITTING 
 - STANDING 
 - LAYING 

Abbreviations used in variable names include: 

| Abbreviation        | Description           
| ------------- |:-------------:| 
| Acc | Acceleration |
| Freq | Frequency |
| Gyro | Gyroscope |
| Mag | Magnitude |
| Std | Standard Deviation |

66 variables were included in the final output:

 - TimeBodyAccMeanX
 - TimeBodyAccMeanY
 - TimeBodyAccMeanZ
 - TimeBodyAccStdX
 - TimeBodyAccStdY
 - TimeBodyAccStdZ
 - TimeGravityAccMeanX
 - TimeGravityAccMeanY
 - TimeGravityAccMeanZ
 - TimeGravityAccStdX
 - TimeGravityAccStdY
 - TimeGravityAccStdZ
 - TimeBodyAccJerkMeanX
 - TimeBodyAccJerkMeanY
 - TimeBodyAccJerkMeanZ
 - TimeBodyAccJerkStdX
 - TimeBodyAccJerkStdY
 - TimeBodyAccJerkStdZ
 - TimeBodyGyroMeanX
 - TimeBodyGyroMeanY
 - TimeBodyGyroMeanZ
 - TimeBodyGyroStdX
 - TimeBodyGyroStdY
 - TimeBodyGyroStdZ
 - TimeBodyGyroJerkMeanX
 - TimeBodyGyroJerkMeanY
 - TimeBodyGyroJerkMeanZ
 - TimeBodyGyroJerkStdX
 - TimeBodyGyroJerkStdY
 - TimeBodyGyroJerkStdZ
 - TimeBodyAccMagMean
 - TimeBodyAccMagStd
 - TimeGravityAccMagMean
 - TimeGravityAccMagStd
 - TimeBodyAccJerkMagMean
 - TimeBodyAccJerkMagStd
 - TimeBodyGyroMagMean
 - TimeBodyGyroMagStd
 - TimeBodyGyroJerkMagMean
 - TimeBodyGyroJerkMagStd
 - FreqBodyAccMeanX
 - FreqBodyAccMeanY
 - FreqBodyAccMeanZ
 - FreqBodyAccStdX
 - FreqBodyAccStdY
 - FreqBodyAccStdZ
 - FreqBodyAccJerkMeanX
 - FreqBodyAccJerkMeanY
 - FreqBodyAccJerkMeanZ
 - FreqBodyAccJerkStdX
 - FreqBodyAccJerkStdY
 - FreqBodyAccJerkStdZ
 - FreqBodyGyroMeanX
 - FreqBodyGyroMeanY
 - FreqBodyGyroMeanZ
 - FreqBodyGyroStdX
 - FreqBodyGyroStdY
 - FreqBodyGyroStdZ
 - FreqBodyAccMagMean
 - FreqBodyAccMagStd
 - FreqBodyBodyAccJerkMagMean
 - FreqBodyBodyAccJerkMagStd
 - FreqBodyBodyGyroMagMean
 - FreqBodyBodyGyroMagStd
 - FreqBodyBodyGyroJerkMagMean
 - FreqBodyBodyGyroJerkMagStd