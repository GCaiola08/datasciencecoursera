#### Load in Libraries ####  
library(dplyr) 
library(tidyr) 

##Set Working Directory###
setwd("C:/Users/gc13539/Documents/Coursera/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

##Read in Data##

activity_labels = read.table("activity_labels.txt", header = F) 
features = read.table("features.txt") 
 

xtrain = read.table("train/X_train.txt") 
ytrain = read.table("train/y_train.txt") 
subject_train = read.table("train/subject_train.txt") 
 

xtest = read.table("test/X_test.txt") 
ytest = read.table("test/y_test.txt") 
subject_test = read.table("test/subject_test.txt") 
  
##Stack Training and Test Datasets
 
X=rbind(xtrain, xtest)

y = rbind(ytrain, ytest) 

subject = rbind(subject_train, subject_test) 

##Add Subject ID to Subject Dataset##

names(subject) = c("Subject_ID") 

 
## find variable names including "mean" or "std" ##  
mean_sd_features_list = grep("mean\\(\\)|std\\(\\)", features$V2) 
mean_sd_features_names =as.character(features$V2[mean_sd_features_list]) 
 
 
# clean up names #  
mean_sd_features_names = gsub("\\(\\)", "", gsub("-", "_", mean_sd_features_names)) 
mean_sd_features_names
 
##Futrher work could make the variable names more descriptive (desdribe difference between "t" and "f", "body" and "Gravity")
 
 
 
## Rename variables in X dataset to feature names
x_mean_std = X[,mean_sd_features_list] 
names(x_mean_std) = mean_sd_features_names 
  
 

   
 
## Add Activity Labels to Y ##  
  
 
y <- y%>% 
 left_join(activity_labels, by = "V1")%>% 
 select(-V1) ## remove the Activity ID 
  
 
  names(y) = c("Activity") 
  

  #### Combine Subject, Activity and Variables to create master database ####  
  
 
  final_activity_df = cbind(subject,y,x_mean_std) 
  
 
   #### create mini data set of averages of each variable ####  
  
 
  activity_df_avg = final_activity_df%>% 
    dplyr:: group_by(Subject_ID, Activity)%>% 
    dplyr:: summarise_each_(funs(mean(., na.rm = T)),mean_sd_features_names)   
    
 
 