# ## Download the data
# dir <- "./data/" # data directory
# if (!file.exists(dir)) {dir.create(dir)}
# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(fileUrl, destfile = paste0(dir, "accelerometer_data.zip"), mode = "wb")
# dateDownloaded <- date()
# ## List files in the data directory and the date the files were downloaded
# list.files(dir)
# dateDownloaded

## Unzip the zipped archive
if(!require("utils")) install.packages("utils", repos = "http://cran.r-project.org")
library(utils)
unzip("accelerometer_data.zip", exdir = "data")

## Load the training and test data and bind them into a single data.table
if(!require("data.table")) install.packages("data.table", repos = "http://cran.r-project.org")
library(data.table)
names <- read.table("./data/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", colClasses = "numeric", col.names = names[, 2])
subjecttrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
activitytrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names = "activity")
train <- data.table(subjecttrain, activitytrain, train, "datasource" = "train")

test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", colClasses = "numeric", col.names = names[, 2])
subjecttest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
activitytest <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names = "activity")
test <- data.table(subjecttest, activitytest, test, "datasource" = "test")

dt <- rbindlist(list(train, test))

## Label the activities with descriptive activity names
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("activityIndex", "activity"), stringsAsFactors = FALSE)
activities$activity <- gsub(activities$activity, pattern = "_", replacement = "")
dt[, activity := tolower(activities[dt[["activity"]], 2])]

## Assumed that extracting only the measurements on the mean and standard deviation for each measurement means those 
## variables/measurements containing "mean()" or "std()" in the name of the feature name (in the "features.txt file)
pattern <- "mean\\(\\)|std\\(\\)" # the double backslash ("\\") escapes the parentheses
columnids <- names[, 2]
columnids <- c(TRUE, TRUE, grepl(pattern, columnids)) # added the first two TRUE values to take care of the subject and activity columns 
                                                      # that were added to the data.table
dt <- dt[, names(dt)[columnids], with = FALSE] # selects only those columns with "mean()" or "std()" in the name.

## Change column names for selected variables to more descriptive names 
oldnames <- names(dt)
newnames <- gsub(oldnames, pattern = "\\.", replacement = "")
newnames <- gsub(newnames, pattern = "^t", replacement = "time")
newnames <- gsub(newnames, pattern = "^f", replacement = "frequency")
newnames <- gsub(newnames, pattern = "Acc", replacement = "acceleration")
newnames <- gsub(newnames, pattern = "Mag", replacement = "magnitude")
newnames <- gsub(newnames, pattern = "X", replacement ="xdirection")
newnames <- gsub(newnames, pattern = "Y", replacement ="ydirection")
newnames <- gsub(newnames, pattern = "Z", replacement ="zdirection")
newnames <- tolower(newnames)
setnames(dt, newnames)

## Calculate the average for each column by subject and activity
dt_out <- dt[, !"datasource", with = FALSE][, lapply(.SD, mean), by = list(subject, activity)]

write.table(dt_out, "./data/accelerometer_data_tidy.txt", sep = "\t", col.names = TRUE, row.names = FALSE)
