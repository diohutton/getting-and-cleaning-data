## **Getting And Cleaning Data Course Project**

This project uses R libraries to apply data science techniques to retrieve a set of raw data files
and manipulate the data into a Tidy Data result. These steps are performed with the included R script `run_analysis.R`

The raw data files are from a study of 30 subjects performing 6 different activities while wearing a Samsung Galaxy S II on their waist. 561 measure variables were recorded during the study and included in the raw data files.  

**Project Expectations**

The requirements for the R scripts included:
- Merging the training and the test sets to create one data set.
- Extracting only the measurements on the mean and standard deviation for each measurement.
- Using descriptive activity names to name the activities in the data set
- Labeling the data set with descriptive variable names.
- Creating an independent tidy data set with the average of each variable for each activity and each subject.

**Project Output Files**
 - `CodeBook.md`: an overview of the Study Design, variables and instructions on how the Tidy Data was created. 
 - `run_analysis.R`: the R script used to retrieve the data and create the end result.
 - `tidy.txt`: the Tidy Data file created by the R script

**Pre-requisites:**
This project requires the following packages to be installed before execution:

 - `library(dplyr)` 
 - `library(reshape)`


