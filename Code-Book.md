Getting and Cleaning Data Course Project - Code Book
----------------------------------------------------

Data Manipulated
================

These eight data are used for this project:

-   ‘features.txt’: List of all features.

-   ‘activity\_labels.txt’: Links the class labels with their activity
    name.

-   ‘train/X\_train.txt’: Training set.

-   ‘train/y\_train.txt’: Training labels.

-   ‘train/subject\_train.txt’: Each row identifies the subject who
    performed the activity for each window sample.

-   ‘test/X\_test.txt’: Test set.

-   ‘test/y\_test.txt’: Test labels.

-   ‘test/subject\_test.txt’: Each row identifies the subject who
    performed the activity for each window sample.

Analysis
========

1.  Dataset was downloaded from this weblink [UCI HAR
    Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
    and then extracted to the Project Data folder.
2.  Merging the dataset to create one data set. First: Merging training,
    test sets and subject dataset by row:
    -   Merging training and test for X-plane
    -   Merging training and test for Y-plane
    -   Merging training and test for both subjects Second: Merging all
        above merged files by column.
3.  Matching features and activity labels, both are in the second
    column.
4.  Extracting only the measurements on the mean and standard deviation
    for each measurement.
5.  Using descriptive activity names to name the activities in the data
    set where the names are extracted from *activity\_labels.txt* file.
6.  Appropriately labels the data set with descriptive variable names
    where the variable names are extracted from *features.txt* file.
7.  Creating an independent tidy data set with the average of each
    activity and each subject.

Feature Selection
=================

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
signals (prefix ‘t’ to denote time) were captured at a constant rate of
50 Hz. Then they were filtered using a median filter and a 3rd order low
pass Butterworth filter with a corner frequency of 20 Hz to remove
noise. Similarly, the acceleration signal was then separated into body
and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3
Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the ‘f’ to
indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for
each pattern:  
‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ tGravityAcc-XYZ tBodyAccJerk-XYZ tBodyGyro-XYZ
tBodyGyroJerk-XYZ tBodyAccMag tGravityAccMag tBodyAccJerkMag
tBodyGyroMag tBodyGyroJerkMag fBodyAcc-XYZ fBodyAccJerk-XYZ
fBodyGyro-XYZ fBodyAccMag fBodyAccJerkMag fBodyGyroMag fBodyGyroJerkMag
