run_analyis.R - script for concatenating data sets and making a final tidy data set based on Galaxy S motion data collected from volunteers performing preset activities

The data for this script can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This script uses the unzipped data set (download URL above) to create a tidy data set of mean() and std() motion variables collected using Galaxy S smartphones worn by volunteers performing pre-determined activities.

The data available in final data set (tidy.txt) are described below:
  -  subject - ID of the volunteer in the motion data study
  -  activity - a descriptive name of the predetermined movements for the volunteers
  -  The following measurements are present in both average [mean()] and average standard deviation [std()] for each       activity and subject (the meaning of each measurement can be found in features_info.txt):
     -  tBodyAccelerometer...X,Y and Z axes              
     -  tGravityAccelerometer...X,Y and Z axes
     -  tBodyAccelerometerJerk...X,Y and Z axes  
     -  tBodyGyroscope...X,Y and Z axes                   
     -  tBodyGyroscopeJerk...X,Y and Z axes              
     -  tBodyAccelerometerMagnitude           
     -  tGravityAccelerometerMagnitude          
     -  tBodyAccelerometerJerkMagnitude         
     -  tBodyGyroscopeMagnitude                 
     -  tBodyGyroscopeJerkMagnitude
     -  fBodyAccelerometer...X,Y and Z axes
     -  fBodyAccelerometerJerk...X,Y and Z axes
     -  fBodyGyroscope...X,Y and Z axes       
     -  fBodyAccelerometerMagnitude    
     -  fBodyBodyAccelerometerJerkMagnitude
     -  fBodyBodyGyroscopeMagnitude     
     -  fBodyBodyGyroscopeJerkMagnitude

