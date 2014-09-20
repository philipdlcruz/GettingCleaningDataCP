run_analysis <- function(dataset = "UCI HAR Dataset"){
        if(!file.exists(dataset)){
                stop(paste("The file folder", dataset, "does not exist in your 
                           current working directory", sep = " "))
        }
        
        library(dplyr)
        library(tidyr)
        
        wd <- getwd()
        features.dir <- paste(wd, dataset, "features.txt", sep = "/")
        alabels.dir <- paste(wd, dataset, "activity_labels.txt", sep = "/")
        stest.dir <- paste(wd, dataset, "test", "subject_test.txt", sep = "/")
        xtest.dir <- paste(wd, dataset, "test", "X_test.txt", sep = "/")
        ytest.dir <- paste(wd, dataset, "test", "y_test.txt", sep = "/")
        strain.dir <- paste(wd, dataset, "train", "subject_train.txt", sep = "/")
        xtrain.dir <- paste(wd, dataset, "train", "X_train.txt", sep = "/")
        ytrain.dir <- paste(wd, dataset, "train", "y_train.txt", sep = "/")
        
        features <- read.table(features.dir, stringsAsFactors = FALSE)[, 2]
        alabels <- read.table(alabels.dir, col.names = c("activityid", "activity"), 
                              stringsAsFactors = FALSE)
        stest <- read.table(stest.dir, col.names = "subject")
        xtest <- read.table(xtest.dir)
        ytest <- read.table(ytest.dir, col.names = "activityid")
        strain <- read.table(strain.dir, col.names = "subject")
        xtrain <- read.table(xtrain.dir)
        ytrain <- read.table(ytrain.dir, col.names = "activityid")
        
        alabels$activity <- tolower(alabels$activity)
        alabels$activity <- sub("stairs", "slope", alabels$activity)
        
        alabels$activityid <- as.factor(alabels$activityid)
        ytest$activityid <- as.factor(ytest$activityid)
        ytrain$activityid <- as.factor(ytrain$activityid)
        levels(ytest$activityid) <- alabels$activity
        levels(ytrain$activityid) <- alabels$activity
        
        names(ytest) <- "activity"
        names(ytrain) <- "activity"
        
        test.data <- cbind(stest, ytest, xtest)
        train.data <- cbind(strain, ytrain, xtrain)
        data <- rbind(train.data, test.data)
        
        names(data) <- c("subject", "activity", features)
        
        data <- select(data, subject:activity, contains("mean"), contains("std"), 
                       -contains("meanfreq"), -contains("angle"))
        
        names(data) <- sub("()", "", names(data), fixed = TRUE)
        names(data) <- gsub("-", "", names(data), fixed = TRUE)
        names(data) <- sub("mean", "_Mean", names(data), fixed = TRUE)
        names(data) <- sub("BodyBody", "Body", names(data), fixed = TRUE)
        names(data) <- sub("std", "_std", names(data), fixed = TRUE)
        
        tidy.data <- group_by(data, subject, activity) %>%
                summarise_each(funs(mean))
        
        write.table(tidy.data, file = "run_analysis_output.txt", row.names = FALSE)
}