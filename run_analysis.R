#setwd("D:/Sergi Backup 2013/Desktop/CONOCIMIENTOS/COURSERA/R-DataCleaning/Project")


#1.Merges the training and the test sets to create one data set

dataTrain<-read.table("./data/train/X_train.txt", sep="") #ncol=561, nrow=7352

dataTest<-read.table("./data/test/X_test.txt", sep="") #ncol=561, nrow=2947

Step1DataSet<-rbind(dataTrain,dataTest)       #ncol=561, nrow=10299


#2.Extracts only the measurements on the mean and standard deviation for each measurement

features<-read.table("./data/features.txt")   #ncol=2, nrow=561

meanVar<-grep("mean",features[,2])            #46elements

stdVar<-grep("std",features[,2])              #33elements

selectVar<-sort(selectVar<-c(meanVar,stdVar)) #79elements
    #checking selected variables: levels(droplevels(features[selectVar,2]))

Step2DataSet<-Step1DataSet[,selectVar]        #ncol=79, nrow=10299


#3.Uses descriptive activity names to name the activities in the data set

labelTrain<-read.table("./data/train/y_train.txt",sep="")

labelTest<-read.table("./data/test/y_test.txt",sep="")

labelAct<-rbind(labelTrain,labelTest)         #ncol=1 nrow=10299; minVal=1, maxVal=6

fAct<-factor(labelAct$V1,labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                                  "SITTING","STANDING","LAYING"))
  
Step3DataSet<-cbind(fAct,Step2DataSet)                  #ncol=80, nrow=10299

        # Checking out transformation process is right:

        # x<-c(25,50,100,500,1000,5000,8000,10000)

        # for(i in seq_along(x)){print(x[i]);print(labelAct$V1[x[i]]);print(dataSet[x[i],1])}
  

#4.Appropriately labels the data set with descriptive variable names

#Firstly we include subjects as a first column of our data set

subjectTrain<-read.table("./data/train/subject_train.txt", sep="") 

subjectTest<-read.table("./data/test/subject_test.txt", sep="")

subject<-rbind(subjectTrain,subjectTest)       #ncol=1, nrow=10299; minVal=1, maxVal=30

                                               #names(subject)=V1

Step4DataSet<-cbind(subject$V1,Step3DataSet)


#Now we tidy the variable names following conversation rules on the initial ones

varNames<-levels(droplevels(features[selectVar,2]))

namesNew<-gsub("\\-",".",varNames)             #Conversion1: "." instedad of "-"

namesNew<-gsub("\\()","",namesNew)             #Conversion2: <empty> instead of "()"

#Lastly we label the data set with descriptive names

names(Step4DataSet)<-c("Subject","Activity",namesNew) #NumVar=81


#5.From the data set in step 4, creates a second, independent tidy data set with
#  the average of each variable for each activity and each subject

library(stringr); library(dplyr)

namesNew<-str_c("Avg_",namesNew)

groupDataSet<-group_by(Step4DataSet,Subject,Activity)

dataSet<-summarise_each(groupDataSet,funs(mean))

names(dataSet)<-c("Subject","Activity",namesNew)     #ncol=81, nrow=180

write.table(dataSet,"./TidyDataStep5.txt",row.name=FALSE)

data<-read.table("./TidyDataStep5.txt")
