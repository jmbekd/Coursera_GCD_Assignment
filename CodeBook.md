## Codebook for the tidy dataset obtained using run_analysis.R on the UCI Human Activity Recognition Using Smartphones Dataset

Assuming the tidy dataset is in your working directory, you can read the tidy dataset into R using the following command:
`read.table("./accelerometer_data_tidy.txt"), sep = "", stringsAsFactors = FALSE, header = TRUE)`

## Renaming the column labels
After extracting the desired columns from the original dataset (see the README.md for additional information on the script and assumptions made and the run_analysis.R script comments for additional information on the processing of the data), the columns were relabeled such that all punctuation and special characters were removed from the column labels and the text converted to all lower case letters. In addition, the abbreviations "t", "f", "Acc", "Mag", "X", "Y", and "Z" were replaced with "time", "frequency", "acceleration", "magnitude", "xdirection", "ydirection", and "zdirection".

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

As an example, the column labeled timegravityaccelerationmeanzdirection indicates that it is the `mean` of the `time domain signal` derived from the `gravity acceleration` in the `z axial direction`. The column labeled frequencybodygyrojerkmagnitudestd indicates that it is the `standard deviation` of the `frequency domain signal` derived from the `body signal` from the `gyroscope`; to generate the signal in this column, the time derivative of the angular velocity was calculated (`jerk`) and used to calculate the `magnitude` of the jerk signal.

Below is a list of the column names in the "tidy" dataset.

| Column Names                                   | Column Names with Whitespace Separators              |
|------------------------------------------------|------------------------------------------------------|
| subject                                        | subject                                              |
| activity                                       | activity                                             |
| timebodyaccelerationmeanxdirection             | time body acceleration mean xdirection               |
| timebodyaccelerationmeanydirection             | time body acceleration mean ydirection               |
| timebodyaccelerationmeanzdirection             | time body acceleration mean zdirection               |
| timebodyaccelerationstdxdirection              | time body acceleration std xdirection                |
| timebodyaccelerationstdydirection              | time body acceleration std ydirection                |
| timebodyaccelerationstdzdirection              | time body acceleration std zdirection                |
| timegravityaccelerationmeanxdirection          | time gravity acceleration mean xdirection            |
| timegravityaccelerationmeanydirection          | time gravity acceleration mean ydirection            |
| timegravityaccelerationmeanzdirection          | time gravity acceleration mean zdirection            |
| timegravityaccelerationstdxdirection           | time gravity acceleration std xdirection             |
| timegravityaccelerationstdydirection           | time gravity acceleration std ydirection             |
| timegravityaccelerationstdzdirection           | time gravity acceleration std zdirection             |
| timebodyaccelerationjerkmeanxdirection         | time body acceleration jerk mean xdirection          |
| timebodyaccelerationjerkmeanydirection         | time body acceleration jerk mean ydirection          |
| timebodyaccelerationjerkmeanzdirection         | time body acceleration jerk mean zdirection          |
| timebodyaccelerationjerkstdxdirection          | time body acceleration jerk std xdirection           |
| timebodyaccelerationjerkstdydirection          | time body acceleration jerk std ydirection           |
| timebodyaccelerationjerkstdzdirection          | time body acceleration jerk std zdirection           |
| timebodygyromeanxdirection                     | time body gyro mean xdirection                       |
| timebodygyromeanydirection                     | time body gyro mean ydirection                       |
| timebodygyromeanzdirection                     | time body gyro mean zdirection                       |
| timebodygyrostdxdirection                      | time body gyro std xdirection                        |
| timebodygyrostdydirection                      | time body gyro std ydirection                        |
| timebodygyrostdzdirection                      | time body gyro std zdirection                        |
| timebodygyrojerkmeanxdirection                 | time body gyro jerk mean xdirection                  |
| timebodygyrojerkmeanydirection                 | time body gyro jerk mean ydirection                  |
| timebodygyrojerkmeanzdirection                 | time body gyro jerk mean zdirection                  |
| timebodygyrojerkstdxdirection                  | time body gyro jerk std xdirection                   |
| timebodygyrojerkstdydirection                  | time body gyro jerk std ydirection                   |
| timebodygyrojerkstdzdirection                  | time body gyro jerk std zdirection                   |
| timebodyaccelerationmagnitudemean              | time body acceleration magnitude mean                |
| timebodyaccelerationmagnitudestd               | time body acceleration magnitude std                 |
| timegravityaccelerationmagnitudemean           | time gravity acceleration magnitude mean             |
| timegravityaccelerationmagnitudestd            | time gravity acceleration magnitude std              |
| timebodyaccelerationjerkmagnitudemean          | time body acceleration jerk magnitude mean           |
| timebodyaccelerationjerkmagnitudestd           | time body acceleration jerk magnitude std            |
| timebodygyromagnitudemean                      | time body gyro magnitude mean                        |
| timebodygyromagnitudestd                       | time body gyro magnitude std                         |
| timebodygyrojerkmagnitudemean                  | time body gyro jerk magnitude mean                   |
| timebodygyrojerkmagnitudestd                   | time body gyro jerk magnitude std                    |
| frequencybodyaccelerationmeanxdirection        | frequency body acceleration mean xdirection          |
| frequencybodyaccelerationmeanydirection        | frequency body acceleration mean ydirection          |
| frequencybodyaccelerationmeanzdirection        | frequency body acceleration mean zdirection          |
| frequencybodyaccelerationstdxdirection         | frequency body acceleration std xdirection           |
| frequencybodyaccelerationstdydirection         | frequency body acceleration std ydirection           |
| frequencybodyaccelerationstdzdirection         | frequency body acceleration std zdirection           |
| frequencybodyaccelerationjerkmeanxdirection    | frequency body acceleration jerk mean xdirection     |
| frequencybodyaccelerationjerkmeanydirection    | frequency body acceleration jerk mean ydirection     |
| frequencybodyaccelerationjerkmeanzdirection    | frequency body acceleration jerk mean zdirection     |
| frequencybodyaccelerationjerkstdxdirection     | frequency body acceleration jerk std xdirection      |
| frequencybodyaccelerationjerkstdydirection     | frequency body acceleration jerk std ydirection      |
| frequencybodyaccelerationjerkstdzdirection     | frequency body acceleration jerk std zdirection      |
| frequencybodygyromeanxdirection                | frequency body gyro mean xdirection                  |
| frequencybodygyromeanydirection                | frequency body gyro mean ydirection                  |
| frequencybodygyromeanzdirection                | frequency body gyro mean zdirection                  |
| frequencybodygyrostdxdirection                 | frequency body gyro std xdirection                   |
| frequencybodygyrostdydirection                 | frequency body gyro std ydirection                   |
| frequencybodygyrostdzdirection                 | frequency body gyro std zdirection                   |
| frequencybodyaccelerationmagnitudemean         | frequency body acceleration magnitude mean           |
| frequencybodyaccelerationmagnitudestd          | frequency body acceleration magnitude std            |
| frequencybodybodyaccelerationjerkmagnitudemean | frequency body body acceleration jerk magnitude mean |
| frequencybodybodyaccelerationjerkmagnitudestd  | frequency body body acceleration jerk magnitude std  |
| frequencybodybodygyromagnitudemean             | frequency body body gyro magnitude mean              |
| frequencybodybodygyromagnitudestd              | frequency body body gyro magnitude std               |
| frequencybodybodygyrojerkmagnitudemean         | frequency body body gyro jerk magnitude mean         |
| frequencybodybodygyrojerkmagnitudestd          | frequency body body gyro jerk magnitude std          |