library(data.table)

#Code to download the zip file from internet and unzip the file 

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
unzip(temp)
unlink(temp)

#Code to read the training and test data sets

trainingData <- read.table(file="./UCI HAR Dataset/train/X_train.txt",header=FALSE)
testData <- read.table(file="./UCI HAR Dataset/test/X_test.txt",header=FALSE)
actHeader <- read.table(file="./UCI HAR Dataset/features.txt",header=FALSE)
testAct <- read.table(file="./UCI HAR Dataset/test/y_test.txt",header=FALSE)
trainAct <- read.table(file="./UCI HAR Dataset/train/y_train.txt",header=FALSE)
testSub <- read.table(file="./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
trainSub <- read.table(file="./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
colnames(trainingData) <- actHeader[,2]
colnames(testData) <- actHeader[,2]
trainingData$activities <- trainAct[,1]
trainingData$participants <- trainSub[,1]
testData$activities <-testAct[,1] 
testData$participants <- testSub[,1]

# Code for the merging of the columns of the Data sets

library(plyr)
mergeData <- join(trainingData,testData)
mergeData <- mergeData[, !duplicated(colnames(mergeData))]
mergeData <- mergeData[,-grep("*mad()*",colnames(mergeData))]
mergeData <- mergeData[,-grep("*min()*",colnames(mergeData))]
mergeData1 <- mergeData
mergeData1 <- mergeData1[,-grep("*max()*",colnames(mergeData1))]
mergeData1 <- mergeData1[,-grep("*iqr()*",colnames(mergeData1))]
mergeData2 <- mergeData1
mergeData2 <- mergeData2[,-grep("*entropy()*",colnames(mergeData2))]
mergeData2 <- mergeData2[,-grep("*energy()*",colnames(mergeData2))]
mergeData3 <- mergeData2
mergeData3 <- mergeData3[,-grep("*correlation*",colnames(mergeData3))]
mergeData3 <- mergeData3[,-grep("*sma*",colnames(mergeData3))]
mergeData4 <- mergeData3
mergeData4 <- mergeData4[,-grep("*arCoeff*",colnames(mergeData4))]
mergeData4 <- mergeData4[,-grep("*bandsEnergy*",colnames(mergeData4))]
mergeDataFinal <- mergeData4
mergeDataFinal <- mergeDataFinal[,-grep("*skewness*",colnames(mergeDataFinal))]
mergeDataFinal <- mergeDataFinal[,-grep("*kurtosis*",colnames(mergeDataFinal))]

#code to change the activities with its actual name

mergeDataFinal$activities <- as.character(mergeDataFinal$activities)
mergeDataFinal$activities[mergeDataFinal$activities == 1] <- "Walking"
mergeDataFinal$activities[mergeDataFinal$activities == 2] <- "Walking Upstairs"
mergeDataFinal$activities[mergeDataFinal$activities == 3] <- "Walking Downstairs"
mergeDataFinal$activities[mergeDataFinal$activities == 4] <- "Sitting"
mergeDataFinal$activities[mergeDataFinal$activities == 5] <- "Standing"
mergeDataFinal$activities[mergeDataFinal$activities == 6] <- "Laying"
mergeDataFinal$activities <- as.factor(mergeDataFinal$activities)

colnames(mergeDataFinal) <- gsub("Acc", "Accelerator", colnames(mergeDataFinal))
colnames(mergeDataFinal) <- gsub("Mag", "Magnitude", colnames(mergeDataFinal))
colnames(mergeDataFinal) <- gsub("Gyro", "Gyroscope", colnames(mergeDataFinal))
colnames(mergeDataFinal) <- gsub("^t", "time", colnames(mergeDataFinal))
colnames(mergeDataFinal) <- gsub("^f", "frequency", colnames(mergeDataFinal))

mergeDataFinal$participants <- as.character(mergeDataFinal$participants)
mergeDataFinal$participants[mergeDataFinal$participants == 1] <- "Participant 1"
mergeDataFinal$participants[mergeDataFinal$participants == 2] <- "Participant 2"
mergeDataFinal$participants[mergeDataFinal$participants == 3] <- "Participant 3"
mergeDataFinal$participants[mergeDataFinal$participants == 4] <- "Participant 4"
mergeDataFinal$participants[mergeDataFinal$participants == 5] <- "Participant 5"
mergeDataFinal$participants[mergeDataFinal$participants == 6] <- "Participant 6"
mergeDataFinal$participants[mergeDataFinal$participants == 7] <- "Participant 7"
mergeDataFinal$participants[mergeDataFinal$participants == 8] <- "Participant 8"
mergeDataFinal$participants[mergeDataFinal$participants == 9] <- "Participant 9"
mergeDataFinal$participants[mergeDataFinal$participants == 10] <- "Participant 10"
mergeDataFinal$participants[mergeDataFinal$participants == 11] <- "Participant 11"
mergeDataFinal$participants[mergeDataFinal$participants == 12] <- "Participant 12"
mergeDataFinal$participants[mergeDataFinal$participants == 13] <- "Participant 13"
mergeDataFinal$participants[mergeDataFinal$participants == 14] <- "Participant 14"
mergeDataFinal$participants[mergeDataFinal$participants == 15] <- "Participant 15"
mergeDataFinal$participants[mergeDataFinal$participants == 16] <- "Participant 16"
mergeDataFinal$participants[mergeDataFinal$participants == 17] <- "Participant 17"
mergeDataFinal$participants[mergeDataFinal$participants == 18] <- "Participant 18"
mergeDataFinal$participants[mergeDataFinal$participants == 19] <- "Participant 19"
mergeDataFinal$participants[mergeDataFinal$participants == 20] <- "Participant 20"
mergeDataFinal$participants[mergeDataFinal$participants == 21] <- "Participant 21"
mergeDataFinal$participants[mergeDataFinal$participants == 22] <- "Participant 22"
mergeDataFinal$participants[mergeDataFinal$participants == 23] <- "Participant 23"
mergeDataFinal$participants[mergeDataFinal$participants == 24] <- "Participant 24"
mergeDataFinal$participants[mergeDataFinal$participants == 25] <- "Participant 25"
mergeDataFinal$participants[mergeDataFinal$participants == 26] <- "Participant 26"
mergeDataFinal$participants[mergeDataFinal$participants == 27] <- "Participant 27"
mergeDataFinal$participants[mergeDataFinal$participants == 28] <- "Participant 28"
mergeDataFinal$participants[mergeDataFinal$participants == 29] <- "Participant 29"
mergeDataFinal$participants[mergeDataFinal$participants == 30] <- "Participant 30"
mergeDataFinal$participants <- as.factor(mergeDataFinal$participants)

# Code to create the tidy data grouped by the activities and participants

Master.dt <- data.table(mergeDataFinal)
TidyData <- Master.dt[, lapply(.SD,mean), by = 'participants,activities']
write.csv(TidyData, file = "./Tidy.txt", row.names = FALSE)


        
          



