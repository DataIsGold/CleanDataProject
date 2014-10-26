#You should create one R script called run_analysis.R that does the following. 

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 

# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

#Moved files to script directory

#library("dplyr")

#read the Test Data
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#read the Training Data
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#read the features (Measurement Names)
features <- read.table("features.txt")

#read the activity names
activity_names <-read.table("activity_labels.txt")[,2] #List of activity names only second column


#merge the data. Completes Step 1.
merged <- rbind(x_test, x_train)
subjects <- rbind(subject_test, subject_train)
yMerged <- rbind(y_test, y_train)[,1] #Return the subject data as a list

#name the columns for features and activities, Completes step 3/4
# I Name the columns before Subsetting them as I found this to be easier to name all of them in order 
# instead of subsetting data then subsetting the names and naming them.

names(subjects)<-"Subject"  #Rename the column in subject

#Rename the Activities to their Meaning (1 = Walking, 2 = Walking_upstairs) etc...
activities <- activity_names[yMerged] 


names(merged) <- features[,2]  #renames the columns in the Merged Set

#descriptive names
# We will use Average for Mean: laymans term
# std = Standard Deviation
# Remove brackets
# remove dashes

names(merged) <- gsub('-mean', 'Average', names(merged), ignore.case = TRUE)
names(merged) <- gsub('Mean', 'Average', names(merged), ignore.case = TRUE)#
names(merged) <- gsub('-std', 'StdDev', names(merged), ignore.case = TRUE)
names(merged) <- gsub('[-()]', '', names(merged))
names(merged) <- gsub("-", "", names(merged))



#Extract the Standard Deviation & Means. Completes Step 2
#merged_STD_Means

#Get the columns that correspond the Mean and Standard Deviation
colStdMeans <- grep("(Average|StdDev)", names(merged))

#subset the columns into merged_STD_Means
merged_STD_Means <- merged[ ,colStdMeans]

#We should now have 10299 obs and 86 columns (variables)
dim(merged_STD_Means)

#Tidy_data step
#combine the Subject, activity
tidy <- cbind(subjects, activities, merged_STD_Means)

#we should now have 10299 obs with 88 columns

#Rename the columan acitivites to Activity
names(tidy) <- gsub('activities', 'Activity', names(tidy))



#From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

#Load the dplyr package
library(dplyr)
#convert tidy to a  data frame tbl
tidy_df <- tbl_df(tidy)
#Free up memory
rm(tidy)
# we will want to group by subject & activity
# According to David (https://class.coursera.org/getdata-008/forum/thread?thread_id=24)
# We are looking for the subject/activity group
group_by_subject_activity <- group_by(tidy_df, Subject, Activity)

#For Each Variable obtain the mean
tidy_avg <- summarise_each(group_by_subject_activity, funs(mean))

#Write the data to disk
write.table(tidy_avg, "tidy.txt", row.names = FALSE)

#load the data from file
check <- read.table("tidy.txt", header = TRUE)
