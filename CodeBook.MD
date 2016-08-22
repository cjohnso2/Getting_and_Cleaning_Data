---
title: "Getting and Cleaning Data"
output: word_document
---
#Getting and Cleaning Data 

##Code Book 

###Raw Data Collection 
Raw data are obtained from UCI Machine Learning repository. In particular we used the Human Activity Recognition Using Smartphones Data Set [1], that was used by the original collectors to conduct experiments exploiting Support Vector Machine

A full description of the data used in this project can be found at The UCI Machine Learning Repository
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The source data for this project can be found here.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The set of variables 

*mean(): Mean value
*std(): Standard deviation
*mad(): Median absolute deviation
*max(): Largest value in array
*min(): Smallest value in array
*sma(): Signal magnitude area
*energy(): Energy measure. Sum of the squares divided by the number of values.
*iqr(): Interquartile range
*entropy(): Signal entropy
*arCoeff(): Autoregression coefficients with Burg order equal to 4
*correlation(): Correlation coefficient between two signals
*maxInds(): Index of the frequency component with largest magnitude
*meanFreq(): Weighted average of the frequency components to obtain a mean frequency
*skewness(): Skewness of the frequency domain signal
*kurtosis(): Kurtosis of the frequency domain signal
*bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
*angle(): Angle between some vectors.

Activity ID's
*1 WALKING
*2 WALKING_UPSTAIRS
*3 WALKING_DOWNSTAIRS
*4 SITTING
*5 STANDING
*6 LAYING

###Data Transformation 
All files were merged into one data set. 
Then the means and standrad deviation were extracted from the orignal data set. 
Then descr
