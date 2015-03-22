library(plyr)
library(dplyr)

#reading the training data
TrainSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
TrainSubj <- read.table("./UCI HAR Dataset/train/subject_train.txt")
TrainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt")
#reading the test data
TestSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
TestSubj <- read.table("./UCI HAR Dataset/test/subject_test.txt")
TestActivity <- read.table("./UCI HAR Dataset/test/y_test.txt")
#readin fitures
Features <- read.table("./UCI HAR Dataset/features.txt")

#union train and test data sets
Set <- rbind (TrainSet, TestSet)
Subject <- rbind(TrainSubj, TestSubj)
Activity <- rbind(TrainActivity, TestActivity)

#using grepl for finding mean and standart deviation measurment in features set
#using parametr fixed = TRUE for matching as is
mean.g <- grepl("mean()", Features$V2, fixed = TRUE)
std.g <- grepl("std()", Features$V2, fixed = TRUE)
Mean.Mes <- Features[mean.g,]
Std.Mes <- Features[std.g,]
Mes <- rbind(Mean.Mes, Std.Mes)
Mes <- Mes %>% rename (numb = V1, namesLong = V2) %>% arrange(numb)

#creating appropriately names for renaming variables
Mes$Names <- gsub("Body|BodyBody", "Bd", Mes$namesLong)
Mes$Names <- gsub("Gravity", "Gr", Mes$Names)
Mes$Names <- gsub("-mean\\()-", "Mean_", Mes$Names)
Mes$Names <- gsub("-mean\\()", "Mean", Mes$Names)
Mes$Names <- gsub("-std\\()-", "Std_", Mes$Names)
Mes$Names <- gsub("-std\\()", "Std", Mes$Names)

#creating a char vector with names of necessary measurment for subseting from total data set
MesNam <- paste("V", Mes$numb, sep = "")

#subseting and renaming needed meausrment from total data set
NSet <- Set[,MesNam]
names(NSet) <- Mes$Names

#adding to total data set subjects and activities
NSet <- cbind(subject = Subject$V1, activity = Activity$V1, NSet)

#renaming activities as factor variable
#NOTE: parametr "labels" in the function "factor" sorted into increasing order of NSet$activity
#so it can be used for rigth renaming
#see help on "factor" for detail
NSet$activity <- factor(NSet$activity, labels = c("walking", "walking_upstairs","walking_downstairs",
                                                  "sitting", "standing", "laying"))

#creating a new data set with the average of each variable for each activity and each subject
Set_unload <- aggregate(NSet[-(1:2)], by = NSet[c("subject", "activity")], FUN = mean)

#uploading data to a file
write.table (Set_unload, file = "tidy_data.txt", row.names = FALSE)
