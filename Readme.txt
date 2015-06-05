# Data-Cleaning-

Creating Tidy Datasets from the raw data collected from Samsung Galaxy S accelerometers 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

========================================

We have the aim to first import the data from the URL mentioned in the source code and then we unziped the code in the local R
working directory.

Thereafter we supposed to do four tasks with the raw data to make it into a tidy data which is all the attributes of the experiment
as columns and the observations as rows.

1.create a data frame in R for the imported raw accelerometer data and then merge the attributes names to it.
2.remove all the columns with attributes of the data frame other then mean and standard deviation attributes.
3.creating a new column to the data frame and merge the data associated with it from another raw data file.
4.Replacing this new nominal data column with the actual levels or categories that each numerical level represented.

Finally the this R script would then a write a csv file which contains the tidy data sorted by two of the attributes of
the collected data.

This csv file contains the tidy data which can be used for analytics using Excel or any Data Analytics Software to help reach 
some conclusion about the experiment that how much acceleration or body activity happens while doing different activities like
walking,sitting and so on.






