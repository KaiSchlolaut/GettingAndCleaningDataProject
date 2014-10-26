run_analysis <- function() 
{
    # read in test 
    test_data <-read.table("UCI HAR Dataset/test/X_test.txt")
    subject_test <-read.table("UCI HAR Dataset/test/subject_test.txt")
    activity_test <-read.table("UCI HAR Dataset/test/y_test.txt")
    
    subject_activity_test <-cbind(subject_test,activity_test)
    subject_activity_data_test <-cbind(subject_activity_test,test_data)
      
    # read in subject and train data
    train_data <-read.table("UCI HAR Dataset/train/X_train.txt")
    subject_train <-read.table("UCI HAR Dataset/train/subject_train.txt")
    activity_train <-read.table("UCI HAR Dataset/train/y_train.txt")
    
    subject_activity_train <-cbind(subject_train,activity_train)
    subject_activity_data_train <-cbind(subject_activity_train,train_data)
    
    # merge test and train data 
    all_data <-rbind(subject_activity_data_test, subject_activity_data_train)
    
    # read in feature names
    features <-read.table("UCI HAR Dataset/features.txt")
    featurenames <- as.character(features[,2])
    featurenames_df <- as.data.frame(featurenames)
    featurenames_df_mean <-data.frame()

    # include "Mean" name for headers
    for(i in 1:nrow(featurenames_df)) {
      featurenames_df_mean[i,1] <- paste("Mean -",featurenames_df[i,])
    }
        
    first_two_rows <-data.frame()
    first_two_rows[1,1] <- "Subject"
    first_two_rows[2,1] <- "Activity"
  
    colnames(first_two_rows) = c("name")
    colnames(featurenames_df_mean) = c("name")
    all_colnames <-rbind(first_two_rows, featurenames_df_mean)
  
    for(i in 1:nrow(all_colnames)) {colnames(all_data)[i] <- all_colnames[i,1]}
  
    all_data_subset<- all_data[,c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,83,84,85,86,87,88,123,124,125,
                                126,127,128,163,164,165,166,167,168,203,204,216,217,229,230,242,
                                243,255,256,268,269,270,271,272,273,347,348,349,350,351,352,426,
                                427,428,429,430,431,505,506,518,519,531,532,544,545)]
    
    for(i in 1:nrow(all_data_subset)) {
                                      if(all_data_subset[i,2] == 1) {all_data_subset[i,2] <- "WALKING"}
                                      if(all_data_subset[i,2] == 2) {all_data_subset[i,2] <- "WALKING_UPSTAIRS"}
                                      if(all_data_subset[i,2] == 3) {all_data_subset[i,2] <- "WALKING_DOWNSTAIRS"}
                                      if(all_data_subset[i,2] == 4) {all_data_subset[i,2] <- "SITTING"}
                                      if(all_data_subset[i,2] == 5) {all_data_subset[i,2] <- "STANDING"}
                                      if(all_data_subset[i,2] == 6) {all_data_subset[i,2] <- "LAYING"}
                                    }
    
    all_data_subset_ordered <- all_data_subset[order(all_data_subset$Subject,all_data_subset$Activity),]
    SubjectAndActivity <- paste(all_data_subset_ordered$Subject,all_data_subset_ordered$Activity)
    SubjectAndActivity<-as.data.frame(SubjectAndActivity)
    all_data_subset_ordered_added<-cbind(SubjectAndActivity,all_data_subset_ordered)
    summary_all_data <-aggregate(all_data_subset_ordered_added[,4:69], list(all_data_subset_ordered_added$SubjectAndActivity), mean)
  
    sub <- c(1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,6,6,6,6,6,6,7,7,7,7,7,7,8,8,8,8,8,8,9,9,9,9,9,9,
             10,10,10,10,10,10,11,11,11,11,11,11,12,12,12,12,12,12,13,13,13,13,13,13,14,14,14,14,14,14,15,15,15,15,15,15,
             16,16,16,16,16,16,17,17,17,17,17,17,18,18,18,18,18,18,19,19,19,19,19,19,20,20,20,20,20,20,21,21,21,21,21,21,
             22,22,22,22,22,22,23,23,23,23,23,23,24,24,24,24,24,24,25,25,25,25,25,25,26,26,26,26,26,26,27,27,27,27,27,27,
             28,28,28,28,28,28,29,29,29,29,29,29,30,30,30,30,30,30)
      
    act <- c(  "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS",
               "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS"
            )
  
    sub_df <-as.data.frame(sub)
    act_df <-as.data.frame(act)
    
    sub_act_df <-cbind(sub_df,act_df)
    final_data <-cbind(sub_act_df, summary_all_data[,2:67])
    
    colnames(final_data)[1] <- "Subject"
    colnames(final_data)[2] <- "Activity"
        
    write.table(final_data, file = "MyTidyData.txt",row.names=FALSE)
    
}