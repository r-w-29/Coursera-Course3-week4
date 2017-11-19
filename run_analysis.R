library(dplyr)
setwd("/home/resham/Desktop/COURSERA/COURSE3R/Project")
# urlToZip<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(urlToZip,"data.zip")
# 
# if(file.exists("data.zip"))
# {
#         unzip("data.zip")
# }
# 


# Reading the training data sets : X, Y and subjects

train.X <- read.table("./UCI HAR Dataset/train/X_train.txt")
train.Y <- read.table("./UCI HAR Dataset/train/y_train.txt")
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Reading the testing data sets : X, Y and subjects

test.X <- read.table("./UCI HAR Dataset/test/X_test.txt")
test.Y <- read.table("./UCI HAR Dataset/test/y_test.txt")
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Reading the feature values from the file
features <- read.table("./UCI HAR Dataset/features.txt")


# Reading the activity labels from the file
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#####
# Merging testing and training data's respective data sets
###

combined.X <- rbind(train.X, test.X)
combined.Y <- rbind(train.Y, test.Y)
combined.subject <- rbind(train.subject, test.subject)

#########
### Since we need only mean and standard deviation measurements , applying regex with 
### respective R function names : mean, std 
#########

required.features <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]

### Extracting only relevant columns from X data set
combined.X <- combined.X[,required.features[,1]]

### Uses descriptive activity names to name the activities in the data set

colnames(combined.Y) <- "activity"

activity.label.names<-as.character(activity.labels[,2])
combined.Y$activitylabel <- factor(combined.Y$activity, labels = activity.label.names)


# removing unnecessary column from Y now that we have the descriptive one
activity.label <- combined.Y[,-1]

# assigning column names to X data set with relevant feature names
colnames(combined.X) <- features[required.features[,1],2]

# assigning descriptive column name to subject data set
colnames(combined.subject) <- "subject"

#joining all three dataa column wise
overall.data <- cbind(combined.X, activity.label, combined.subject)

#finging the average 
overall.average <- overall.data %>% group_by(activity.label, subject) %>% summarize_all(funs(mean))

write.table(overall.average, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)


