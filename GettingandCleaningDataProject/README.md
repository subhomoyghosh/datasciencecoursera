## Data Scientist's Toolbox

### Getting & Cleaning Data Project
* run_analysis.R
  * [Download data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Human+Activity+Recognition+Using+Smartphones")
  * Extract the data and save data folder in working directory
  * [execute R script] (https://github.com/subhomoyghosh/datasciencecoursera/blob/master/GettingandCleaningDataProject/run_analysis.R)
    * _Get_ data, prepare directories etc
    * _Load_ test,training, activities name and feature level files
    * Use _descriptive activity_ names to _name_ the _recoded activities_ in the data set
    * _Assign labels_ to the data set using descriptive activity names
    * _Merge_ training and test data sets
    * _Extract_ the _66_ features with mean() or std() in their descriptor string
    * _Modify_ feature names with proper description
    * _Average_ each feature by _subject_ and _activity_
    * Create a _new tidy data_ set with the _average values_
    * _Summary_ of averages will be stored as an output to "_tidyData_" variable and saved in working directory as tidy_data.txt 