library(dplyr)
library(data.table)
library(reshape2)

# Setting Working Directory
setwd("C:/Users/OWNER/Desktop/Data Science/Course 3 - Getting and Cleaning Data")

# Downloading Data For The Project from Website and Extracting it

if(!file.exists("./Project Data")){dir.create("./Project Data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
ProjectDataFilename <- "ProjectData.zip"
download.file(fileUrl, destfile="./Project Data/ProjectData.zip")
unzip("./Project Data/ProjectData.zip", exdir = "./Project Data")

# Re-setting Working Directory
setwd("C:/Users/OWNER/Desktop/Data Science/Course 3 - Getting and Cleaning Data/Project Data/UCI HAR Dataset")

#1. Merging the Training and the Test Sets

# Training Files
X_train <- read.table("./train/X_train.txt")
Y_train <- read.table("./train/Y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

# Test Files
X_test <- read.table("./test/X_test.txt")
Y_test <- read.table("./test/Y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

# Merging Both, Training & Test Files
X_merged_data <- rbind(X_train, X_test)
Y_merged_data <- rbind(Y_train, Y_test)
subject_merged_data <- rbind(subject_train, subject_test)

setwd("C:/Users/OWNER/Desktop/Data Science/Course 3 - Getting and Cleaning Data/Project Data/UCI HAR Dataset")

#4. Matching Features & Activity Label
# Feature Info is in the 2nd Column
features <- read.table("./features.txt")
features[,2] <- as.character(features[,2])

# Activity Labels is in the 2nd Column
activity_labels <- read.table("./activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])

#2. Extracting Only the Measurements on the Mean and Standard Deviation for Each Measurement

extmeasurecols <- grep("-(mean|std).*", as.character(features[,2]))
extmeasure <- features[extmeasurecols, 2]
extmeasure <- gsub("-mean", "Mean", extmeasure)
extmeasure <- gsub("-std", "Std", extmeasure)
extmeasure <- gsub("[-()]", "", extmeasure)

X_merged_data <- X_merged_data[extmeasurecols]

# Merging All the Data
mergedData <- cbind(subject_merged_data, Y_merged_data, X_merged_data)

#3. Using Descriptive Activity Names
colnames(mergedData) <- c("Subject", "Activity", extmeasure)
mergedData$Activity <- factor(mergedData$Activity, levels = activity_labels[,1], labels = activity_labels[,2])
mergedData$Subject <- as.factor(mergedData$Subject)

#5. Creating an Independent Tidy Dataset with the Average of each variable for each activity and each subject
merged_data.melt <-melt(mergedData, id = c('Activity', 'Subject'))
merged_data.tidy <-dcast(merged_data.melt, Subject + Activity ~ variable, mean)

write.table(merged_data.tidy, file = "tidy_dataset.txt", row.names = FALSE)