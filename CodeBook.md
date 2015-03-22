# Description of raw data
---------------------------

The data set was taken from:  
Human Activity Recognition Using Smartphones Dataset  
Version 1.0  

==================================================================  
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Universitа degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' in folder *UCI HAR Dataset* for more details. 

####For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

####Data for transformation was taken from such files:
 
- **features.txt**: List of all features.
- **activity_labels.txt**: Links the class labels with their activity name.
- **train/X_train.txt**: Training set.
- **train/y_train.txt**: Training labels.
- **test/X_test.txt**: Test set.
- **test/y_test.txt**: Test labels.
- **train/subject_train.txt**: Each row identifies the subject who performed the activity for each window sample in train set. Its range is from 1 to 30.
- **test/subject_test.txt**: Each row identifies the subject who performed the activity for each window sample in train set. Its range is from 1 to 30.
 
####Notes: 
- Features are normalized and bounded within [-1,1].  
- Each feature vector is a row on the text file.  

####Features selection (description variables):

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag
 
####The set of variables that were estimated from these signals are (variables in raw data set):
- **mean()**: Mean value
- **std()**: Standard deviation
- **mad()**: Median absolute deviation 
- **max()**: Largest value in array
- **min()**: Smallest value in array
- **sma()**: Signal magnitude area
- **energy()**: Energy measure. Sum of the squares divided by the number of values. 
- **iqr()**: Interquartile range 
- **entropy()**: Signal entropy
- **arCoeff()**: Autoregression coefficients with Burg order equal to 4
- **correlation()**: correlation coefficient between two signals
- **maxInds()**: index of the frequency component with largest magnitude
- **meanFreq()**: Weighted average of the frequency components to obtain a mean frequency
- **skewness()**: skewness of the frequency domain signal 
- **kurtosis()**: kurtosis of the frequency domain signal 
- **bandsEnergy()**: Energy of a frequency interval within the 64 bins of the FFT of each window.
- **angle()**: Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

# Data transformation steps:

####1. Union train and test data sets into one data set
####2. Extracting only the measurements on the mean and standard deviation for each measurement
Thus variables (measurements) with -meanFreq()- haven't been included into cut data set. For example these variables are:
fBodyAcc-meanFreq()-X, fBodyAcc-meanFreq()-Y, fBodyAcc-meanFreq()-Z etc.
Total number of measurement became 66 (33 for mean measurement and 33 for standard deviation)
####3. Creating new names for appropriate measurements
Rename variables into data set got in previous step. Names was taken from the file 'features.txt', transformed and put for necessary position with correspond measurments 
####4. Adding appropriate activity and an identifier of the subject who carried out the experiment
####5. Put correspond labels to activities number from the file 'activity_labels.txt'
####6. Creting independent tidy data set with the average of each variable for each activity and each subject.
New data set was created from data set on a step 5. For averaging variables was used **mean()** function in R. 

For more details of transformations like functions and methods used in R please see into 'run_analysis.R'

# Tidy data set

Processed data was uploaded into file 'tidy_data.txt' (separator = " "). This data consists of 68 variables and 180 measurements.
####Names of variables are:
- **subject** - subject who performed the activity. Its range is from 1 to 30
- **activity** - name of activity (6 values: walking, walking_upstairs, walking_downstears, sitting, standing, laying)
- **66 names of average measurements that were in raw data**:  
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBdAcc-XYZ and tGrAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.  
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBdAccJerk-XYZ and tBdGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBdAccMag, tGrAccMag, tBdAccJerkMag, tBdGyroMag, tBdGyroJerkMag).  
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBdAcc-XYZ, fBdAccJerk-XYZ, fBdGyro-XYZ, fBdAccJerkMag, fBdGyroMag, fBdGyroJerkMag. (Note the 'f' to indicate frequency domain signals).  
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
>- tBdAcc-XYZ 
>- tGrAcc-XYZ
>- tBdAccJerk-XYZ
>- tBdGyro-XYZ
>- tBdGyroJerk-XYZ
>- tBdAccMag
>- tGrAccMag
>- tBdAccJerkMag
>- tBdGyroMag
>- tBdGyroJerkMag
>- fBdAcc-XYZ
>- fBdAccJerk-XYZ
>- fBdGyro-XYZ
>- fBdAccMag
>- fBdAccJerkMag
>- fBdGyroMag
>- fBdGyroJerkMag
 
>The set of variables that were estimated from these signals are:  
>>- Mean: Mean value  
>>- Std: Standard deviation