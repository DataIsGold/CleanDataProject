Getting and Cleaning Data: Project
================
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 You should create one R script called run_analysis.R that does the following. 

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 

    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

To read the data from the tidy file use:

 data <- read.table(tidy.txt, header = TRUE)

 The files from the test and training set are first read into variables

 Followed by the features.txt which contain the measurement names
 The activity names are then read and stored as a list

 # STEP 1 
 merged - The test & training sets are merged
 subjects - the subjects are merged
 yMerged - finally the Subject's Acitivy is merged (yMerged

 # STEP 3
 merged - The columns of merged are renamed with the measurement names
 activities - The values are replaced with their Meaning
 subjects - The column is renamed "Subject"

 # STEP 4
 merged - The columns are renamed with more friendly names
  mean is replaced with Average (the layman's term for mean)
  std  is replaced with StdDev (a more descriptive abbreviation for Standard Deviation)


 # STEP 2

 We now extract the columns for Mean and Standard Deviation 
    We filter for Average or StdDev

 # STEP 5

 tidy - We combine the subject, activity and measurements into a new variable
 we rename the activities column to Activity

 we load the dplyr package

 We create a group_by variable, it groups tidy by subject and activity

 next we summarize the data set for the means of each value

 finally the data is written to disk.