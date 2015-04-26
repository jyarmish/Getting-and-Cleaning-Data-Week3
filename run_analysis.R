setwd("UCI HAR Dataset")
features = read.table("features.txt", header = FALSE, sep = "")

setwd("UCI HAR Dataset/test")
testDF1 = read.table("subject_test.txt", header = FALSE, sep = "")
testDF2 = read.table("X_test.txt", header = FALSE, sep = "")
testDF3 = read.table("y_test.txt", header = FALSE, sep = "")
names(testDF2)<-features$V2
testDF2["subject"]<-testDF1
testDF2["activity"]<-testDF3
testDF2["test/train"]<-replicate(2947,"test")
#head(testDF2)

setwd("UCI HAR Dataset/train")
trainDF1 = read.table("subject_train.txt", header = FALSE, sep = "")
trainDF2 = read.table("X_train.txt", header = FALSE, sep = "")
trainDF3 = read.table("y_train.txt", header = FALSE, sep = "")
names(trainDF2)<-features$V2
trainDF2["subject"]<-trainDF1
trainDF2["activity"]<-trainDF3
trainDF2["test/train"]<-replicate(7352,"train")
#head(trainDF2)

MasterDF<-rbind(testDF2,trainDF2)


setwd("UCI HAR Dataset")
activity_labels = read.table("activity_labels.txt", header = FALSE, sep = "")
head(activity_labels$V2)

MasterDF["Activity"]<-NA
lookup=activity_labels$V2#c("A","B","C","D","E","F")
names(lookup)=c(1,2,3,4,5,6)
MasterDF$Activity=lookup[as.character(MasterDF$activity)]
head(MasterDF[MasterDF["test/train"]=="train",])

ForGrep<-'(mean|std|test/train|Activity|subject)'
c<-grep(ForGrep,names(MasterDF),perl=T)
c
MasterDF1<-MasterDF[,c]
head(MasterDF1)
is.na(MasterDF1)

#check for NAs
colSums(is.na(MasterDF1))

write.table(MasterDF1, "mytidydata.txt", sep="\t") 