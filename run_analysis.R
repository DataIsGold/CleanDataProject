#You should create one R script called run_analysis.R that does the following. 

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 

# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

#Moved files to script directory

#read the Test Data
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#read the Training Data
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#read the features (Activity Names)
features <- read.table("features.txt")

#merge the data. Completes Step 1.
merged <- rbind(x_test, x_train)

#name the columns for features and activities, Completes step 3/4.

#Clean up features
#Will probably use Grep

names(merged) <- features[,2]

#Extract the Standard Deviation & Means. Completes Step 2
#merged_STD_Means


#Tidy_data step

#Didn't Work
#setnames(x_test, old = names(x_test), new = features[,2])