## Importing the data set files
    testX <- read.table("./test/X_test.txt")
    testy <- read.table("./test/y_test.txt")
    testsub <- read.table("./test/subject_test.txt")
    trainX <- read.table("./train/X_train.txt")
    trainy <- read.table("./train/y_train.txt")
    trainsub <- read.table("./train/subject_train.txt")
    activitylabels <- read.table("./activity_labels.txt")
    features <- read.table("./features.txt")
## Giving column names to activitylabels and features
    colnames(activitylabels) <- c("activityid","activityname")
    colnames(features) <- c("ID","varName")

## Merges the training and tests sets to create one data set
    ## Combine data individual data sets with test data followed by train data
    ## I determined that these could be combined, given the dimensions of the data sets
    ## subdata will be 1 column wide, 10299 observations
    ## ydata will be 1 column wide, 10299 observations
    ## xdata will be 561 columns wide, 10299 observations
        subdata <- rbind(testsub,trainsub)
        ydata <- rbind(testy,trainy)
        xdata <- rbind(testx,trainx)
    ## Apply column names to newly combined data sets
        colnames(xdata) <- features$varName
    ## Combine all data to create master data set (subdata and ydata are single columns to be added to xdata
    ## to create masterdata)
        masterdata <- xdata
        masterdata$subject <- subdata$V1
        masterdata$activity <- ydata$V1

## Uses descriptive activity names to name the activities in the data set
    ## Apply descriptive activity labels, using activity_labels.txt
        masterdata$activity <- as.character(masterdata$activity)
        masterdata$activity[masterdata$activity == 1] <- "Walking"
        masterdata$activity[masterdata$activity == 2] <- "Walking Upstairs"
        masterdata$activity[masterdata$activity == 3] <- "Walking Downstairs"
        masterdata$activity[masterdata$activity == 4] <- "Sitting"
        masterdata$activity[masterdata$activity == 5] <- "Standing"
        masterdata$activity[masterdata$activity == 6] <- "Laying"
        masterdata$activity <- as.factor(masterdata$activity)

## Appropriately labels the data set with descriptive variable names
    ## Perused names(masterdata) and features_info.txt to determine meanings of abbreviations
        names(masterdata) <- gsub("Acc","Accelerometer",names(masterdata))
        names(masterdata) <- gsub("Mag","Magnitude",names(masterdata))
        names(masterdata) <- gsub("Gyro","Gyroscope",names(masterdata))

## Extracts only the measurements on the mean and standard deviation for each measurement
    ## Create list of mean() variables, another of std() variables
        meandata <- grep("mean()",names(masterdata),value=F,fixed=T)
        stddata <- grep("std()",names(masterdata),value=F,fixed=T)
    ## Use those to create matrices of mean() and std() variables
        meanmatrix <- masterdata[meandata]
        stdmatrix <- masterdata[stddata]
    ## Combine the two matrices along with masterdata$subject and masterdata$activity to create tidy
    ## data set
        masterdata2 <- cbind(masterdata$subject,masterdata$activity,meanmatrix,stdmatrix)
        names(masterdata2)[1] <- "subject"
        names(masterdata2)[2] <- "activity"
    
## Creates a second, independent tidy data set with the average
## of each variable for each activity and each subject
    ## Initialize data.table package
        library(data.table)
        masterdata2 <- data.table(masterdata2)
        tidy <- masterdata2[,lapply(.SD,mean),by='subject,activity']
        write.table(tidy,file="tidy.txt",row.name=F) 
