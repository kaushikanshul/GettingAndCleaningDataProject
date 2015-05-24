library(plyr)

#step 1. Merging the data after rading all relevant data

xTrain<- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain<- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <-read.table("UCI HAR Dataset/train/subject_train.txt")

xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

#create x data set

xData <- rbind(xTrain,xTest)

# create y data set

yData<- rbind(yTrain,yTest)

# create subject data set

subjectData <- rbind(subjectTrain,subjectTest)

#step 2 extract the measurements on the mean and sd 

features <- read.table("UCI HAR Dataset/features.txt")

# get only columns with mean and st dev in their names

meanStdFeatures <- grep("-(mean|std)\\(\\)",features[,2])

# subset the desired coumns

xData<- xData[,meanStdFeatures]

#correct the column names

names(xData)<- features [meanStdFeatures,2]

# Step 3 . Use descriptive activity names

activities<- read.table("UCI HAR Dataset/activity_labels.txt")

#update values with correct activity names

yData[,1] <- activities[yData[,1],2]

#correct column name

names(yData)<- "activity"

# step 4. Label the data set with descriptive variable names

# correct column name

names(subjectData)<- "subject"

#bind all the data in single set

allData<- cbind(xData,yData,subjectData)

# step 5. Create a second,independent tidy data set with the average of each variable for each activity and each subject

averagesData <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averagesData,"Tidy.data.txt",sep = ",",row.name=FALSE)