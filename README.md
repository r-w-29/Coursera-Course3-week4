# Coursera-Course3-week4
This is for the project submission for week 4 : Coursera : Getting and Cleaning Data

### --- Steps to follow--- 
* Download and unzip the data file to a directory (working) .
* Download the R source code to the R working directory.
* Execute the R source code file in order to obtain the tidy data file.

### ---Data Description---
* The variables in the data X are the different sensor signals measured with the waist bound smartphones as produced by 30 subjects. 
* The variable in the data Y indicates the different activities that were performed by the subjects during the experiment.

### ----Code Description---
The code combined the training with the testing data set and obtains required variables only in order to form a dataset with the mean for each variable and activity respectively.


### --- New Dataset---
The new intermediate dataset contains variables calculated based only on the mean and standard deviation. Remaining variables have been excluded. One row of this data is an average of each activity type for all subjects.

### This project was carried out as per the instruction of this assignment
Read training and test dataset into R environment.
Read variable names into R envrionment.
Read subject index into R environment.

* Merges the training and the test sets to create one data set.

* Extracts only the measurements on the mean and standard deviation for each measurement.

* Uses descriptive activity names to name the activities in the data set

* Appropriately labels the data set with descriptive variable names.

* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
