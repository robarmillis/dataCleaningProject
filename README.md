# Getting and Cleaning Data Course Project
This is the repo for the final project for Getting and Cleaning Data Course.

Here its content is described. 
* **UCI HAR Dataset** This folder contains the input data. More information about the experiment
"Human Activity Recognition Using Smartphones Dataset" can be found in the README.txt file in the root
of this folder.

* **run_analysis.R** This R script takes as input the data in the "UCI HAR Datset" folder and produces as output the requested tidy dataset named "tidyDataset.txt"

* **tidyDataset.txt** This text file contains the output of the run_analysis.R script as described in the Coursera project page. This is the required tidy dataset to be sumbitted. 

* **CodeBook.md** A code book describing the variables of the "tidyDataset.txt" file, the input data, and all steps of the cleaning up process bringing to the final tidy dataset.
* **README.md** The README file for this repo. 

In short the script **run_analysis.R** follows these steps. Further information about where to find the appropriate needed files are in **UCI HAR Dataset/README.txt** and in the comments of the R script itself.

* Merge the training and the test sets to create one data set 
* Extract only the measurements on the mean and standard deviation for each measurement. 
* Use descriptive activity names to name the activities in the data set
* Appropriately label the data set with descriptive variable names. 
* From the data set previoulsy obtained, create a second, independent tidy data set with the average of each variable for each activity and each subject.
