## Getting and Cleaning Data Project
### Summary
This file describes the variables, the data, and all transformations performed on the input data contained in the **UCI HAR Dataset** folder aiming at producing a tidy dataset as described in
*https://class.coursera.org/getdata-007/human_grading/view/courses/972585/assessments/3/submissions*
to be submitted as final project for the Johns Hopkins course *Getting and Cleaning Data*.

### Input Data
The input data has been collected during a wearable computing experiment carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person has performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist recording data through its accelerometer. This group of 30 people has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data (**UCI HAR Dataset/train**) and 30% the test data (**UCI HAR Dataset/test**).
A full description is available at the site where the data was obtained:
*http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones*

The source zipped data used for this project is retrievable from here
*https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip*

The folder **UCI HAR Dataset** contains the source unzipped files.
From the file **UCI HAR Dataset/README.txt** all the attributes of the available data can be learnt. 
Without repeating that same information, we proceed here describing the steps implemented in the R script **run_analysis.R** aiming at buiding the tidy dataset as requested.
### 

### Cleaning up steps
The script **run_analysis.R** has to be run from its location. It includes the relative paths to source the necessary input data.
The steps are:
* Merge the training and the test sets to create one data set 
* Extract only the measurements on the mean and standard deviation for each measurement. 
* Use descriptive activity names to name the activities in the data set
* Appropriately label the data set with descriptive variable names. 
* From the data set previoulsy obtained, create a second, independent tidy data set with the average of each variable for each activity and each subject.

The relevant data sets for our analysis  (as deduced from the **UCI HAR Dataset/README.txt**) are
* 'UCI HAR Dataset/train/X_train.txt': measurements relative to the people in the training set
* 'UCI HAR Dataset/train/y_train.txt': numeric label identifying one of the 6 activities. Range = 1:6.
* 'UCI HAR Dataset/test/X_test.txt': measurements relative to the people in the test set
* 'UCI HAR Dataset/test/y_test.txt': numeric label identifying one of the 6 activities. Range = 1:6.
* 'UCI HAR Dataset/train/subject_train.txt': numeric tag identifying one of the 21 volunteers for training. Range = 1:30
* 'UCI HAR Dataset/test/subject_test.txt': each row identifies one of the 9 volunteers used for testing. Range = 1:30
* 'UCI HAR Dataset/activity_labels.txt': link between the class labels from 1:6  and their activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
* 'UCI HAR Dataset/features.txt': List of all features (descriptive variable names).

The script merges the two datasets, one for training and one for test.
Then it adds two columns, one keeping track of the subject and one of the activity performed. The numbers 1:6 are then replaced by the extended description of the activity. 
The column names of the data frame are modified to include the description of the variable names (all the different meaurements of the accelerometers). At this point columns containing means and standard deviations can be selected. 
Additional vectors obtained by averaging the signals in a signal window sample, used on the angle() variable (gravityMean,tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean) are not in the scope of this analysis and have been therefore excluded.
The selected variables are 79.
A new dataframe is ready to be produced. It will contain the averages of each of the 79 variable for each activity (1:6) and each subject (1:30). There are measurements for each couple (activity,subject), hence the final tidy dataset contains 6 . 30 = 180 rows.
The final tidy dataset **tidyDataset.txt** so built is exported as txt, ignoring the names of the row. 
It can be found in the root of this repository and is ready for peer evaluation.


