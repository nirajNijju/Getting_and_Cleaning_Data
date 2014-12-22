# Merges the training and the test sets to create one data set.

sub_test  <- read.table("data/Getting_and_Cleaning_Data/project/UCI HAR Dataset/test/subject_test.txt")
sub_train <- read.table("data/Getting_and_Cleaning_Data/project/UCI HAR Dataset/train/subject_train.txt")

sub <- rbind(sub_train,sub_test)


x_test  <- read.table("data/Getting_and_Cleaning_Data/project/UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("data/Getting_and_Cleaning_Data/project/UCI HAR Dataset/train/X_train.txt")

x <- rbind(x_train,x_test)


y_test  <- read.table("data/Getting_and_Cleaning_Data/project/UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("data/Getting_and_Cleaning_Data/project/UCI HAR Dataset/train/y_train.txt")

y <- rbind(y_train,y_test)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("data//Getting_and_Cleaning_Data/project/UCI HAR Dataset/features.txt")
i <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

tmp_x <- x
tmp_x <- tmp_x[,i]
names(tmp_x) <- features(i,2)


# Uses descriptive activity names to name the activities in the data set

activities <- read.table("data//Getting_and_Cleaning_Data/project//UCI HAR Dataset/activity_labels.txt")

y[,1] = activities[y[,1], 2]
names(y) <- "activity"

# Appropriately labels the data set with descriptive variable names. 

names(sub) <- "subject"
df <- cbind(sub,y,tmp_x)

write.table(df, "data//Getting_and_Cleaning_Data/merge_data.txt")

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.








