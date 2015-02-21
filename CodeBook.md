## Source datasets

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

### Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (`tbodyacc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (`tbodyaccJerk-XYZ and `tbodygyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (`tbodyaccMag, tGravityAccMag, `tbodyaccJerkMag, `tbodygyroMag, `tbodygyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing `fbodyAcc-XYZ, `fbodyAccJerk-XYZ, `fbodyGyro-XYZ, `fbodyAccJerkMag, `fbodyGyroMag, `fbodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tbodyacc-XYZ
tGravityAcc-XYZ
tbodyaccJerk-XYZ
tbodygyro-XYZ
tbodygyroJerk-XYZ
tbodyaccMag
tGravityAccMag
tbodyaccJerkMag
tbodygyroMag
tbodygyroJerkMag
fbodyAcc-XYZ
fbodyAccJerk-XYZ
fbodyGyro-XYZ
fbodyAccMag
fbodyAccJerkMag
fbodyGyroMag
fbodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the Numericber of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tbodyaccMean
tbodyaccJerkMean
tbodygyroMean
tbodygyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

## Summarised dataset
Contains averages of all mean and standard deviation measures of the combined source training and test datasets by activity and subject.

Feature naming is retained (and hence the above definitions apply) with the exception of the removal of non-alphanumeric characters and the replacement of '-' with '_'. All features with the exception of `subject` and `activity` are the averages of the corresponding features in the source datasets by `acticity` and `subject`.

`subject`: 
    Integer identifier identifying the subject.

`activity`:
	Factor with 6 levels defining the activity the subject engaged in 
		1 WALKING
		2 WALKING_UPSTAIRS
		3 WALKING_DOWNSTAIRS
		4 SITTING
		5 STANDING
		6 LAYING
    
`tbodyacc_mean_x`: 
    Numeric  0.279 0.261 0.222 0.277 0.289 ...
	
`tbodyacc_mean_y`: 
    Numeric  -0.01614 -0.00131 -0.04051 -0.01738 -0.00992 ...
	
`tbodyacc_mean_z`: 
    Numeric  -0.111 -0.105 -0.113 -0.111 -0.108 ...
    
`tgravityacc_mean_x`: 
    Numeric  0.943 0.832 -0.249 0.935 0.932 ...
    
`tgravityacc_mean_y`: 
    Numeric  -0.273 0.204 0.706 -0.282 -0.267 ...
    
`tgravityacc_mean_z`: 
    Numeric  0.0135 0.332 0.4458 -0.0681 -0.0621 ...
    
`tbodyaccjerk_mean_x`: 
    Numeric  0.0754 0.0775 0.0811 0.074 0.0542 ...
    
`tbodyaccjerk_mean_y`: 
    Numeric  0.007976 -0.000619 0.003838 0.028272 0.02965 ...
    
`tbodyaccjerk_mean_z`: 
    Numeric  -0.00369 -0.00337 0.01083 -0.00417 -0.01097 ...
    
`tbodygyro_mean_x`: 
    Numeric  -0.024 -0.0454 -0.0166 -0.0418 -0.0351 ...
    
`tbodygyro_mean_y`: 
    Numeric  -0.0594 -0.0919 -0.0645 -0.0695 -0.0909 ...
    
`tbodygyro_mean_z`: 
    Numeric  0.0748 0.0629 0.1487 0.0849 0.0901 ...
    
`tbodygyrojerk_mean_x`: 
    Numeric  -0.0996 -0.0937 -0.1073 -0.09 -0.074 ...
    
`tbodygyrojerk_mean_y`: 
    Numeric  -0.0441 -0.0402 -0.0415 -0.0398 -0.044 ...
    
`tbodygyrojerk_mean_z`: 
    Numeric  -0.049 -0.0467 -0.0741 -0.0461 -0.027 ...
    
`tbodyaccmag_mean`: 
    Numeric  -0.9843 -0.9485 -0.8419 -0.137 0.0272 ...
    
`tgravityaccmag_mean`: 
    Numeric  -0.9843 -0.9485 -0.8419 -0.137 0.0272 ...
    
`tbodyaccjerkmag_mean`: 
    Numeric  -0.9924 -0.9874 -0.9544 -0.1414 -0.0894 ...
    
`tbodygyromag_mean`: 
    Numeric  -0.9765 -0.9309 -0.8748 -0.161 -0.0757 ...
    
`tbodygyrojerkmag_mean`: 
    Numeric  -0.995 -0.992 -0.963 -0.299 -0.295 ...
    
`fbodyacc_mean_x`: 
    Numeric  -0.9952 -0.9796 -0.9391 -0.2028 0.0382 ...
    
`fbodyacc_mean_y`: 
    Numeric  -0.97707 -0.94408 -0.86707 0.08971 0.00155 ...
    
`fbodyacc_mean_z`: 
    Numeric  -0.985 -0.959 -0.883 -0.332 -0.226 ...
    
`fbodyacc_meanfreq_x`: 
    Numeric  0.0865 -0.0495 -0.1588 -0.2075 -0.3074 ...
    
`fbodyacc_meanfreq_y`: 
    Numeric  0.1175 0.0759 0.0975 0.1131 0.0632 ...
    
`fbodyacc_meanfreq_z`: 
    Numeric  0.2449 0.2388 0.0894 0.0497 0.2943 ...
    
`fbodyaccjerk_mean_x`: 
    Numeric  -0.9946 -0.9866 -0.9571 -0.1705 -0.0277 ...
    
`fbodyaccjerk_mean_y`: 
    Numeric  -0.9854 -0.9816 -0.9225 -0.0352 -0.1287 ...
    
`fbodyaccjerk_mean_z`: 
    Numeric  -0.991 -0.986 -0.948 -0.469 -0.288 ...
    
`fbodyaccjerk_meanfreq_x`: 
    Numeric  0.314 0.257 0.132 -0.209 -0.253 ...
    
`fbodyaccjerk_meanfreq_y`: 
	Numeric  0.0392 0.0475 0.0245 -0.3862 -0.3376 ...
	
`fbodyaccjerk_meanfreq_z`: 
	Numeric  0.13858 0.09239 0.02439 -0.18553 0.00937 ...
	
`fbodygyro_mean_x`: 
	Numeric  -0.986 -0.976 -0.85 -0.339 -0.352 ...
	
`fbodygyro_mean_y`: 
	Numeric  -0.989 -0.9758 -0.9522 -0.1031 -0.0557 ...
	
`fbodygyro_mean_z`: 
	Numeric  -0.9808 -0.9513 -0.9093 -0.2559 -0.0319 ...
	
`fbodygyro_meanfreq_x`: 
	Numeric  -0.12029 0.18915 -0.00355 0.01478 -0.10045 ...
	
`fbodygyro_meanfreq_y`: 
	Numeric  -0.0447 0.0631 -0.0915 -0.0658 0.0826 ...
	
`fbodygyro_meanfreq_z`: 
	Numeric  0.100608 -0.029784 0.010458 0.000773 -0.075676 ...
	
`fbodyaccmag_mean`: 
	Numeric  -0.9854 -0.9478 -0.8618 -0.1286 0.0966 ...
	
`fbodyaccmag_meanfreq`: 
	Numeric  0.2846 0.2367 0.0864 0.1906 0.1192 ...
	
`fbodybodyaccjerkmag_mean`: 
	Numeric  -0.9925 -0.9853 -0.9333 -0.0571 0.0262 ...
	
`fbodybodyaccjerkmag_meanfreq`: 
	Numeric  0.4222 0.3519 0.2664 0.0938 0.0765 ...
	
`fbodybodygyromag_mean`: 
	Numeric  -0.985 -0.958 -0.862 -0.199 -0.186 ...
	
`fbodybodygyromag_meanfreq`: 
	Numeric  -0.028606 -0.000262 -0.139775 0.268844 0.349614 ...
	
`fbodybodygyrojerkmag_mean`: 
	Numeric  -0.995 -0.99 -0.942 -0.319 -0.282 ...
	
`fbodybodygyrojerkmag_meanfreq`: 
	Numeric  0.334 0.185 0.176 0.191 0.19 ...
	
`angle`tbodyaccmeangravity`: 
    Numeric  -0.000222 0.027442 0.021366 0.060454 -0.002695 ...
    
`angle`tbodyaccjerkmeangravitymean`: 
    Numeric  0.02196 0.02971 0.00306 -0.00793 0.08993 ...
    
`angle`tbodygyromeangravitymean`: 
    Numeric  -0.03379 0.0677 -0.00167 0.01306 0.06334 ...
    
`angle`tbodygyrojerkmeangravitymean`: 
    Numeric  -0.0279 -0.0649 0.0844 -0.0187 -0.04 ...
    
`anglexgravitymean`: 
    Numeric  -0.743 -0.591 0.427 -0.729 -0.744 ...

`angleygravitymean`: 
    Numeric  0.2702 -0.0605 -0.5203 0.277 0.2672 ...
    
`anglezgravitymean`: 
    Numeric  0.0123 -0.218 -0.3524 0.0689 0.065 ...
    
``tbodyacc_std_x`: 
    Numeric  -0.996 -0.977 -0.928 -0.284 0.03 ...
    
`tbodyacc_std_y`: 
    Numeric  -0.9732 -0.9226 -0.8368 0.1145 -0.0319 ...
    
`tbodyacc_std_z`: 
	Numeric  -0.98 -0.94 -0.826 -0.26 -0.23 ...
	
``tgravityacc_std_x`: 
	Numeric  -0.994 -0.968 -0.897 -0.977 -0.951 ...
	
``tgravityacc_std_y`: 	
	Numeric  -0.981 -0.936 -0.908 -0.971 -0.937 ...
	
``tgravityacc_std_z`: 
	Numeric  -0.976 -0.949 -0.852 -0.948 -0.896 ...
	
`tbodyaccjerk_std_x`: 
	Numeric  -0.9946 -0.9864 -0.9585 -0.1136 -0.0123 ...
	
`tbodyaccjerk_std_y`: 
	Numeric  -0.986 -0.981 -0.924 0.067 -0.102 ...
	
`tbodyaccjerk_std_z`: 
	Numeric  -0.992 -0.988 -0.955 -0.503 -0.346 ...
	
`tbodygyro_std_x`: 
	Numeric  -0.987 -0.977 -0.874 -0.474 -0.458 ...
	
`tbodygyro_std_y`: 
	Numeric  -0.9877 -0.9665 -0.9511 -0.0546 -0.1263 ...
	
`tbodygyro_std_z`: 
	Numeric  -0.981 -0.941 -0.908 -0.344 -0.125 ...
	
`tbodygyrojerk_std_x`: 
	Numeric  -0.993 -0.992 -0.919 -0.207 -0.487 ...
	
`tbodygyrojerk_std_y`: 
	Numeric  -0.995 -0.99 -0.968 -0.304 -0.239 ...
	
`tbodygyrojerk_std_z`: 	
	Numeric  -0.992 -0.988 -0.958 -0.404 -0.269 ...
	
`tbodyaccmag_std`: 
	Numeric  -0.9819 -0.9271 -0.7951 -0.2197 0.0199 ...
	
`tgravityaccmag_std`: 
	Numeric  -0.9819 -0.9271 -0.7951 -0.2197 0.0199 ...
	
`tbodyaccjerkmag_std`: 
	Numeric  -0.9931 -0.9841 -0.9282 -0.0745 -0.0258 ...
	
`tbodygyromag_std`: 
	Numeric  -0.979 -0.935 -0.819 -0.187 -0.226 ...
	
`tbodygyrojerkmag_std`: 
	Numeric  -0.995 -0.988 -0.936 -0.325 -0.307 ...
	
`fbodyacc_std_x`: 
	Numeric  -0.996 -0.9764 -0.9244 -0.3191 0.0243 ...
	
`fbodyacc_std_y`: 
	Numeric  -0.972 -0.917 -0.834 0.056 -0.113 ...
	
`fbodyacc_std_z`: 
	Numeric  -0.978 -0.934 -0.813 -0.28 -0.298 ...
	
`fbodyaccjerk_std_x`: 
	Numeric  -0.9951 -0.9875 -0.9642 -0.1336 -0.0863 ...
	
`fbodyaccjerk_std_y`: 
	Numeric  -0.987 -0.983 -0.932 0.107 -0.135 ...
	
`fbodyaccjerk_std_z`: 
	Numeric  -0.992 -0.988 -0.961 -0.535 -0.402 ...
	
`fbodygyro_std_x`: 
    Numeric  -0.987 -0.978 -0.882 -0.517 -0.495 ...
    
`fbodygyro_std_y`: 
    Numeric  -0.9871 -0.9623 -0.9512 -0.0335 -0.1814 ...
    
`fbodygyro_std_z`: 
    Numeric  -0.982 -0.944 -0.917 -0.437 -0.238 ...
    
`fbodyaccmag_std`: 
    Numeric  -0.982 -0.928 -0.798 -0.398 -0.187 ...
    
`fbodybodyaccjerkmag_std`: 
    Numeric  -0.993 -0.982 -0.922 -0.103 -0.104 ...
    
`fbodybodygyromag_std`: 
    Numeric  -0.978 -0.932 -0.824 -0.321 -0.398 ...
    
`fbodybodygyrojerkmag_std`: 
    Numeric  -0.995 -0.987 -0.933 -0.382 -0.392 ...
