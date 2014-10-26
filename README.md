#GettingAndCleaningDataProject
#=============================

The run_analysis.R file does the following: 

1. read in test-data itself, test-data-subjects and test-data-activities
2. cbind (combine all 3 test-data.frames) with the subejct and activity at the beginning without any further manipulation (sorting etc.)

3.  read in train-data itself, train-data-subjects and train-data-activities
4. cbind (combine all 3 train-data.frames) with the subejct and activity at the beginning without any further manipulation (sorting etc.)
    
5. merge test and train data in data.frame "all_data"
   
6. read in feature names from feature.txt to use it for the variable-names/column-headers
7. add already the word "Mean" to have a appropriate column name for the later final data

8. data.frame "all_colnames" includes all column names for the final data-set

9. subset the "all_data" with only those variables having mean or std information: done by manual picking, no rule because the last of the 561 variables also include "mean-info" but that's the mean already from the raw measurement data

10. in a for loop replace number of activities with names    

11. order by Subject and then by activity

12. make a combination-column "SubjectAndActivity" that includes 180 different instances (30 subejcts x 6 activities) for which the mean will be calculated

13. use the "aggregate" function to calc the mean for 180 groups

14. save it in a data_frame "summary_all_data" without separate columns for subject and activity

15. cbind vectors that include both subject and activity as the data.frame "summary_all_data" is orderd, the order is known and the 2 extra columns can be added

16. write tidy data-set in file "MyTidyData"
    
}
