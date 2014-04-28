# Load required libraries
library(dplyr)
devtools::install_github("hadley/dplyr", ref = "colwise")
library(formatR)


# Set directory
setwd("~/Documents/data science course/Reading and Cleaning data")

####### 0.a GET data, prepare directories etc.

# Data source: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Create a directory for this assignment
localDir <- 'assignment1'
if (!file.exists(localDir)) {
  dir.create(localDir)
}

# Download the wearable data
url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
file <- paste(localDir,basename(url),sep='/')
if (!file.exists(file)) {
  download.file(url, file,method="curl")
  unzip(file,exdir=localDir)
}

# Show the unzipped files 
list.files(localDir)

# DirName is the name of the unzipped file(directory) without file type extensions
DirName<- "UCI HAR Dataset"

# Set path to DirName directory
wd<-paste0(getwd(),"/assignment1/UCI HAR Dataset")
setwd(wd)

# Show the local files 
list.files()
list.files("test")
list.files("train")

####### 0.b LOAD test,training, activities name and feature level (sets) files

# function to optimize reading time
readAssign<- function(i,y,z){
  tab5rows <- read.table(y[i], header = FALSE, nrows = 5)
  classes <- sapply(tab5rows, class)
  assign(z[i],read.table(y[i], header = FALSE,colClasses = classes,
                         comment.char=""),envir = .GlobalEnv)
  return(z[i])
}

# filenames and assign varibale names
fileNames<- c("./test/X_test.txt","./test/y_test.txt","./test/subject_test.txt","./train/X_train.txt",
          "./train/y_train.txt","./train/subject_train.txt","activity_labels.txt","features.txt")
varNames<- c("testData","testData_act","testData_sub","trainData","trainData_act","trainData_sub",
             "activities","features")

# load
sapply(1:8,readAssign,fileNames,varNames)

####### 3. USES  to name the recoded activities in the data set

testData_act$V1 <- factor(testData_act$V1,levels=activities$V1,labels=activities$V2)
trainData_act$V1 <- factor(trainData_act$V1,levels=activities$V1,labels=activities$V2)

####### 4. APPROPRIETLY assign labels to the data set with descriptive activity names

colnames(testData)<-features$V2
colnames(trainData)<-features$V2
colnames(testData_act)<-c("activity")
colnames(trainData_act)<-c("activity")
colnames(testData_sub)<-c("subject")
colnames(trainData_sub)<-c("subject")

####### 1. MERGES the training and the test sets to create one data set

testData<- cbind(testData_sub,testData_act,testData)
trainData<- cbind(trainData_sub,trainData_act,trainData)
Data<- rbind(testData,trainData)
Data<- arrange(Data,subject)

####### 2. EXTRACTS only the measurements on the mean and standard deviation & rename

meanstdVars<- colnames(Data)[grep("\\bmean\\b|\\bstd\\b",colnames(Data))]
DataTrim<- select(Data,c(subject,activity,contains("\\bmean\\b|\\bstd\\b")))

patternReplace<- list('-'='','()'='',"mean"="Mean","std"="StandardDeviation","t"="time",
                      "f"="frequency","Freq"="Frequency","Acc"="Acceleration","Mag"="Magnitude")
patternMatch<- "-|\\(\\)|\\bmean\\b|\\bstd\\b|^t|^f|Freq|Acc|Mag"

colnames(DataTrim)<- gsubfn(patternMatch,patternReplace,colnames(DataTrim))


####### 5. CREATES e second, independent tidy data set averaged by activity and subject

tidyData<- DataTrim %.%
           group_by(subject,activity) %.%
           summarise_each(funs(mean))

####### SAVE

dir.create(file.path(dirname(getwd()), "Getting and Cleaning Data Project"))
setwd(file.path(dirname(getwd()), "Getting and Cleaning Data Project"))
write.table(tidyData,"tidyData.txt",sep = ",", col.names = colnames(tidyData))
tidy.source()

