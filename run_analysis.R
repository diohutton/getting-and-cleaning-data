# Download a zip file of training and test data and merge the datasets.
# Select mean and std variables from the original data set and 
# create a tidy data set that outputs the mean of each selected variable
# based by subject id and activity
run_analysis <- function() {
  
  #create file and directory variables
  zip_filename <- "dataset.zip"
  download_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
  dataset_directory <- "UCI HAR Dataset"

  #download file and unzip into working directory
  if (!file.exists(zip_filename)){
    download.file(download_url, zip_filename, method="curl")
  }  
  if (!file.exists(dataset_directory)) { 
    unzip(zip_filename) 
  }
  #record date of download
  dateDownloaded <- date()

  #create data frames used by training and test data sets
  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt") 
  variables <- read.table("UCI HAR Dataset/features.txt") 
  
  #Create three dataframes from the training files  
  train_data <- read.table("UCI HAR Dataset/train/X_train.txt") 
  train_activity_ids <- read.table("UCI HAR Dataset/train/y_train.txt") 
  train_subject_ids <- read.table("UCI HAR Dataset/train/subject_train.txt") 

  #rename training columns to descriptive variables
  names(train_data) <- variables$V2
  colnames(train_activity_ids) <- "activity"
  colnames(train_subject_ids) <- "subjectid"

  #merge three training dataframes into one
  train_dataframe <- bind_cols(train_data, train_activity_ids, train_subject_ids)

  #Create three dataframes from the test files 
  test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
  test_activity_ids <- read.table("UCI HAR Dataset/test/y_test.txt") 
  test_subject_ids <- read.table("UCI HAR Dataset/test/subject_test.txt")

  #rename test columns to descriptive variables
  names(test_data) <- variables$V2
  names(test_activity_ids) <- "activity"
  names(test_subject_ids) <- "subjectid"
  test_dataframe <- bind_cols(test_data, test_activity_ids, test_subject_ids)

  #Combine the training and test dataframe rows with rbind 
  merged_dataframe <- rbind(train_dataframe, test_dataframe)
  #Reset the activity variable id with its corresponding label from activity_labels dataframe
  merged_dataframe$activity <- activity_labels[merged_dataframe$activity, 2]
  #Extract the subjectid, activity and variables including mean() or std()
  selected_dataframe <- merged_dataframe[ , grepl("activity|subjectid|mean\\(\\)|std\\(\\)", names(merged_dataframe))]

  #Edit variable names to remove () and - characters
  names(selected_dataframe) <- gsub("std\\(\\)", "Std", names(selected_dataframe))
  names(selected_dataframe) <- gsub("mean\\(\\)", "Mean", names(selected_dataframe))
  names(selected_dataframe) <- gsub("-", "", names(selected_dataframe))
  #Edit t and f variable names to time and frequency
  names(selected_dataframe) <- gsub("^t", "Time", names(selected_dataframe))
  names(selected_dataframe) <- gsub("^f", "Freq", names(selected_dataframe))

  #reshape selected dataframe, creating unique rows for each subjectid-activity combination
  selected_melt <- melt(selected_dataframe, id=c("subjectid", "activity"))
  #find mean of each variable for each subjectid-activity combination
  melted_means <- dcast(selected_melt, subjectid + activity ~ variable, mean)
  #write melted_means dataframe to tidy.txt
  write.table(melted_means, "tidy.txt", quote = FALSE, row.names = FALSE)
  
  
}