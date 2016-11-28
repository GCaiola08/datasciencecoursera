##README_readingandcleaningdata.TXT

File Summary

##CodeBook - Names and Descriptions of Variables in the dataset

##Run_Analysis.R - Reads in and formats raw data

##Description of Run_Analysis.R

Script follows the below steps:

1) Load required libraries
2) Set Working Directory
3) Read in Data
4) Stack Train and Test data - Add "Subject ID"
5) Find variables with "mean" or "std"
6) Clean up variable names by removing empty parents and converting dashes to underscores
7) Select appropriate variables from X data set
8) Replace variable names with descriptive names
9) Merge Y dataset with Activity Labels
10) Merge all three dataseets (subject, activity, variables) to create final dataset
11) Compute mini dataset for each subject/activity