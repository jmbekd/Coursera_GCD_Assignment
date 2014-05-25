Initial Data Processing of UCI Human Activity Recognition Using Smartphones Dataset
========================================================

The UCI Human Activity Recognition Using Smartphones Dataset ("UCI HAR Dataset") was downloaded from the link below on 2014-05-11 using R and the R code listed below.

```                     
platform       x86_64-w64-mingw32          
arch           x86_64                      
os             mingw32                     
system         x86_64, mingw32             
status                                     
major          3                           
minor          0.2                         
year           2013                        
month          09                          
day            25                          
svn rev        63987                       
language       R                           
version.string R version 3.0.2 (2013-09-25)
nickname       Frisbee Sailing         

## Download the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "accelerometer_data.zip", mode = "wb")
```


The data were processed using the R script `run_analysis.R`. The `run_analysis.R` script:
- Extracted the data files from the zipped archive into a newly created "data" directory
- Merged the test and training datasets into a single dataset
- Extracted all columns containing measurements of the mean and standard deviation
- Relabeled the activity names (indices 1 through 6 in the original files) with descriptive names (e.g., walking, etc.)
- Relabeled the selected columns (i.e., those containing measurements of the mean and standard deviation as defined above) to remove invalid characters
- Using the processed dataset created via the steps above, a second "tidy" dataset was created by taking the average of each column for each activity and each subject

After creating the "tidy" dataset, the script outputs the "tidy" dataset to a tab-delimited text file entitled `accelerometer_data_tidy.txt`.

The `run_analysis.R` script assumes that the data have been downloaded to your R working directory. After unzipping the archive, the script reads the `subject_train.txt`,`y_train.txt`, and `X_train.txt` files into R and combines them into the training dataset. The script then reads the `subject_test.txt`,`y_test.txt`, and `X_test.txt` files into R and combines them into the test dataset. A final column (`datasource`) is added to the both training and test datasets to identify the original source of the data. These two datasets are then combined into a single dataset and the activity names (indices 1 through 6 in the original files) are renamed with the descriptive names listed in the `activity_labels.txt` file. 

## Assumptions regarding the Assignment Instructions
The instructions stated "Extracts only the measurements on the mean and standard deviation for each measurement." It was assumed that this meant that the script was to extract all columns which contained either `mean()` or `std()` in their column id (the values that were stored in the `features.txt` file). Vectors including the term `Mean` in their column id were not included as these measurements were "obtained by averaging the signals in a signal window sample" (as described in the `features_info.txt` file) for the "angle() variable."

## Renaming the column labels
After extracting the desired columns from the original dataset, the columns were relabeled such that all punctuation and special characters were removed from the column labels and the text converted to all lower case letters. In addition, the abbreviations "t", "f", "Acc", "Mag", "X", "Y", and "Z" were replaced with "time", "frequency", "acceleration", "magnitude", "xdirection", "ydirection", and "zdirection".
