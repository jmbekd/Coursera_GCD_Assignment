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

The `run_analysis.R` script assumes that the data have been downloaded to your R working directory. After unzipping the archive, the script reads the `subject_train.txt`,`y_train.txt`, and `X_train.txt` files into R and combines them into the training dataset. The script then reads the `subject_test.txt`,`y_test.txt`, and `X_test.txt` files into R and combines them into the test dataset. A final column ("datasource") is added to the both training and test datasets to identify the original source of the data. These two datasets are then combined into a single dataset and the activity names (indices 1 through 6 in the original files) are renamed with the descriptive names listed in the `activity_labels.txt` file. 

## Assumptions regarding the Assignment Instructions
The instructions stated "Extracts only the measurements on the mean and standard deviation for each measurement." It was assumed that this meant that the script was to extract all columns which contained either `mean()` or `std()` in their column id (the values that were stored in the `features.txt` file). Vectors including the term `Mean` in their column id were not included as these measurements were "obtained by averaging the signals in a signal window sample" (as described in the `features_info.txt` file) for the "angle() variable."

## Renaming the column labels
After extracting the desired columns from the original dataset, the columns were relabeled such that all punctuation and special characters were removed from the column labels and the text converted to all lower case letters. In addition, the abbreviations "t", "f", "Acc", "Mag", "X", "Y", and "Z" were replaced with "time", "frequency", "acceleration", "magnitude", "xdirection", "ydirection", and "zdirection", respectively.

## Description of the column labels and the data they contain
In the "tidy" dataset,
- The column subject is a column containing integer values which identify the subject who is conducting a particular activity. Values range from 1:30.
- The column activity is a column containing strings which indicate which activity the subject was performing when the measurements were taken (i.e., walking, walking upstairs, walking downstairs, sitting, standing, and laying)

The subsequent columns come from the processed data from the accelerometer and gryoscope 3-axial raw signals collected from the smartphone. All data were normalized and are bounded within the range -1 to 1 by the original researchers. Additional details on the features in the original dataset can be found in the `features_info.txt` and `README.txt` files that are included in the downloaded archive. A brief overview of the elements in the column labels is provided below.

The column labels indicate whether the measurement was a "time domain signal" (denoted by "time" in the column label) or a "frequency domain signal" (denoted by "frequency" in the column label). The time domain signals were "captured at a constant rate of 50 Hz" and, per the `features_info.txt` file, "filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise." The frequency domain signals were created by applying a Fast Fourier Transform (FFT) to the signals.

Signals from the accelerometer were generated "from the smartphone accelerometer X axis" and are in "standard gravity units"; these signals are identified by the text "acceleration" in the column label.The "acceleration" signals were separated into "body" and "gravity" signals "using another low pass Butterworth filter with a corner frequency of 0.3 Hz" and by "subtracting gravity from the total acceleration."

Signals from the gyroscope are "angular velocity vectors" that were measured in "radians/second"; these signals are identified by the text "gyro" in the column label. 

The time derivative of the acceleration and gyroscope signals are denoted by the text "jerk" in the column label. The magnitude of the three dimensional "jerk" signals was calculated using the "Euclidian norm"; these signals are denoted by the text "magnitude" in the column label.

The text "mean" and "std" in the column label indicates whether the measurement is the "mean" or the "standard deviation" of the collected data and the text "xdirection", "ydirection", and "zdirection" indicate which of the triaxial signals ("X", "Y", or "Z") the data came from.

As an example, the column labeled "timegravityaccelerationmeanzdirection" indicates that it is the "mean" of the "time domain signal" derived from the "gravity acceleration" in the "z axial direction". The column labeled "frequencybodygyrojerkmagnitudestd" indicates that it is the "standard deviation" of the "frequency domain signal" derived from the "body signal" from the "gyroscope"; to generate the signal in this column, the time derivative of the angular velocity was calculated ("jerk") and used to calculate the "magnitude" of the jerk signal.








