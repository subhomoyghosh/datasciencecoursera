##Data Scientist's Toolbox

##Getting & Cleaning Data Project
* run_analysis.R
  * [Download data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Human+Activity+Recognition+Using+Smartphones")
  * Extract the data inside of data folder in working directory
  * [execute R script] ()
  > * Get data, prepare directories etc
  > * Load test,training, activities name and feature level files
  > * Use descriptive activity names to name the recoded activities in the data set
  > * Assign labels to the data set using descriptive activity names
  > * Merge training and test data sets
  > * Extract the 66 features with mean() or std() in their descriptor string
  > * Modify feature names with proper description
  > * Average each feature by subject and activity
  > * Create a new tidy data set with the average values
  * Summary of averages will be stored as an output to "tidyData" variable and saved in working directory as tidy_data.csv 