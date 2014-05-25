## Peer assessment Getting and Cleaning Data Project (Coursera course)
   * Present goal of the project is to summarize type of activity a person is engaged in: e.g., sitting, walking, etc, based on motion sensor signals obtained from a smartphone. Experimental data were collected from 30 subjects engaged in 6 possible activities. Sensor signals were processed and tabulated through 561 features. 70% of the data were assigned to the training set and the remainder for test set

### _OVERALL LAYOUT_
 
#### Input Data 
    * Task is to extract features containing 'mean()' or 'std()' in their descriptive activity strings from the training and testing sets; combine the extracted information across the two datasets, and create a new dataset with the average of each of the extracted features, by subject and activity

#### Final output tidy data
    * The final table has 130 rows and 68 columns
    * Subject ID [1-30], activity label [1-6 as'WALKING','STANDING' etc]
    * 66 mean() and std() features obtained from the feature descriptor strings

#### Script
    * The script 'Run Analysis.R' produces a tidy motion data collected from smartphones
    * Logical flow of the script is divided into chunks as: 0.a->0.b->3->4->1->2->5

### _VARIABLES_

#### directory paths
    * wd: path for local directory

#### all variable names (mentioning only the train set; test set has same characterizations)
    * varNames: Contains all variable names
    * fileNames: Contains all file names to read
    * testData: Data-frame containing 7352 rows and 563 columns (subject, activity and 561 features)
    * testData_act: Data-frame containing 7352 rows and 1 column showing different activities
    * testData_sub: Data-frame containing 7352 rows and 1 column showing subject id
    * Data: Data-frame with 10299 rows and 563 columns. This is the test-train merged dataset arranged w.r.t. subject id
 
#### feature variables
    * features: a two column data-frame consisting of feature index and list of features

#### activity variables
    * activity: a two column data-frame consisting of the activity index and the corresponding label e.g. 1->WALKING

#### Extraction and renaming part
    * meanstdVars: All features (i.e. the columns) containing 'mean()' or 'std()' as substring among the 561 features(i.e. 561 columns)
    * patternMatch: Variable containing patterns need to matched in order to replace for renaming default descriptive feature names
    * patternReplace: Variable containing patterns to replaced with in order to replace for renaming default descriptive feature names accordingly
    * DataTrim: Extracted data-frame with 10299 rows and 68 columns containing 'mean()' or 'std()' as substring along with subject id and activity levels
    * trainData_act$V1: converted activity numbers (1 through 6) into activity labels ('WALKING', 'SITTING', etc)

#### Final Data
    * tidyData: Final processed dataset, saved to directory as .txt file


### _Functions used_
    * readAssign (1:8,fileNames,varNames) (See chunk 0.b)
     _This_ is a function to efficiently read all the relevant files. This is used through sapply() command to load all files at one go!
    * gsubfn (patternMatch,patternReplace,colnames(DataTrim)) (See chunk 2.)
     _This_ is a gsub extension function used to replace and rename default descriptive feature names into appropriate  self-explanatory feature names
    * DataTrim %.% group_by(subject,activity) %.% summarise_each(funs(mean)) (See chunk 5.)
     _This_ dplyr styling has been used to summarize the Data

