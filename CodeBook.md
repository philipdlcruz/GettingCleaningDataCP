## Code Book for Getting and Cleaning Data Course Project

### Variable Descriptions

There are a total of 68 variables in the run_analysis_output.txt

01. "subject"

        Ranges from 1 to 30
        This variable refers to the volunteer number that participated in the experiment

02. "activity"

        Has 6 factors
        This variable refers to the current activity done by the subject at the time the measurement for the other variables were taken
        
        walking:                volunteer is walking
        walking_upslope:        volunteer is walking up a slope (e.g. up stairs, uphill)
        walking_downslope:      volunteer is walking down a slope (e.g. down stairs, downhill)
        sitting:                volunteer is sitting
        standing:               volunteer is standing
        laying:                 volunteer is laying or in resting position
        
03-68. For the other 66 remaining variables, it is split up into 2 groups of 33 identical variables each

        03-35. The first group contains the mean values for each subject and each activity of the mean variables
                This group has Mean, MeanX, MeanY, or MeanZ at the end of the variable name
        36-68. The second group contains the mean values for each subject and each activity of the standard deviation variables
                This group has std, stdX, stdY, ot stdZ at the end of the variable name
        
The two groups share common variables from the following set of variables listed below. Variables with "-XYZ" are the variables that have the MeanX/stdX, MeanY/stdY, and MeanZ/stdZ variables rexpectively.

        01. tBodyAcc-XYZ        6 variables total
                Variable Number         Name
                        03              tBodyAcc_MeanX
                        04              tBodyAcc_MeanY
                        05              tBodyAcc_MeanZ
                        36              tBodyAcc_stdX
                        37              tBodyAcc_stdY
                        38              tBodyAcc_stdZ
        
        02. tGravityAcc-XYZ     6 variables total
                Variable Number         Name
                        06              tGravityAcc_MeanX
                        07              tGravityAcc_MeanY
                        08              tGravityAcc_MeanZ
                        39              tGravityAcc_stdX
                        40              tGravityAcc_stdY
                        41              tGravityAcc_stdZ
        
        03. tBodyAccJerk-XYZ    6 variables total
                Variable Number         Name
                        09              tBodyAccJerk_MeanX
                        10              tBodyAccJerk_MeanY
                        11              tBodyAccJerk_MeanZ
                        42              tBodyAccJerk_stdX
                        43              tBodyAccJerk_stdY
                        44              tBodyAccJerk_stdZ
        
        04. tBodyGyro-XYZ       6 variables total
                Variable Number         Name
                        12              tBodyGyro_MeanX
                        13              tBodyGyro_MeanY
                        14              tBodyGyro_MeanZ
                        45              tBodyGyro_stdX
                        46              tBodyGyro_stdY
                        47              tBodyGyro_stdZ
        
        05. tBodyGyroJerk-XYZ   6 variables total
                Variable Number         Name
                        15              tBodyGyroJerk_MeanX
                        16              tBodyGyroJerk_MeanY
                        17              tBodyGyroJerk_MeanZ
                        48              tBodyGyroJerk_stdX
                        49              tBodyGyroJerk_stdY
                        50              tBodyGyroJerk_stdZ
        
        06. tBodyAccMag         2 variables total
                Variable Number         Name
                        18              tBodyAccMag_Mean
                        51              tBodyAccMag_std
        
        07. tGravityAccMag      2 variables total
                Variable Number         Name
                        19              tGravityAccMag_Mean
                        52              tGravityAccMag_std
        
        08. tBodyAccJerkMag     2 variables total
                Variable Number         Name
                        20              tBodyAccJerkMag_Mean
                        53              tBodyAccJerkMag_std
        
        09. tBodyGyroMag        2 variables total
                Variable Number         Name
                        21              tBodyGyroMag_Mean
                        54              tBodyGyroMag_std
        
        10. tBodyGyroJerkMag    2 variables total
                Variable Number         Name
                        22              tBodyGyroJerkMag_Mean
                        55              tBodyGyroJerkMag_std
        
        11. fBodyAcc-XYZ        6 variables total
                Variable Number         Name
                        23              fBodyAcc_MeanX
                        24              fBodyAcc_MeanY
                        25              fBodyAcc_MeanZ
                        56              fBodyAcc_stdX
                        57              fBodyAcc_stdY
                        58              fBodyAcc_stdZ
        
        12. fBodyAccJerk-XYZ    6 variables total
                Variable Number         Name
                        26              fBodyAccJerk_MeanX
                        27              fBodyAccJerk_MeanY
                        28              fBodyAccJerk_MeanZ
                        59              fBodyAccJerk_stdX
                        60              fBodyAccJerk_stdY
                        61              fBodyAccJerk_stdZ
        
        13. fBodyGyro-XYZ       6 variables total
                Variable Number         Name
                        29              fBodyGyro_MeanX
                        30              fBodyGyro_MeanY
                        31              fBodyGyro_MeanZ
                        62              fBodyGyro_stdX
                        63              fBodyGyro_stdY
                        64              fBodyGyro_stdZ
        
        14. fBodyAccMag         2 variables total
                Variable Number         Name
                        32              fBodyAccMag_Mean
                        65              fBodyAccMag_std
        
        15. fBodyAccJerkMag     2 variables total
                Variable Number         Name
                        33              fBodyAccJerkMag_Mean
                        66              fBodyAccJerkMag_std
        
        16. fBodyGyroMag        2 variables total
                Variable Number         Name
                        34              fBodyGyroMag_Mean
                        37              fBodyGyroMag_std
        
        17. fBodyGyroJerkMag    2 variables total
                Variable Number         Name
                        35              fBodyGyroJerkMag_Mean
                        68              fBodyGyroJerkMag_std

### Transformations Done on the Original Data

This section will document all the transformations done to the original data.

01. run_analysis.R lines 30-31

        Line 30 improves the readability of the activities by changing all the capital letters to small letters
        Line 31 improves the description of "walking_upstairs" and "walking_downstairs" by changing stairs to slope since the general idea is movement on a positive or negative slope which may not neccessarily involve stairs

02. run_analysis.R lines 33-37

        Lines 33-37 change the activity IDs (1 to 6) to their actual activity labels to improve readability

03. run_analysis.R lines 39-40

        Lines 39-40 change the column names of the y train dataset and y test dataset from "activityid" to "activity" to reflect the change made in (02) lines 33-37

04. run_analysis.R lines 42-44

        Lines 42-43 combine all the student (variable 01), activity (variable 02), and measurement (all other variables from the original dataset) columns for the test and train datasets
        Line 44 combines both the train and test rows into one whole dataset

05. run_analysis.R line 46

        Line 46 updates the column names for the new dataset created from (04) line 44

06. run_analysis.R lines 48-49

        Lines 48-49 extracts only the measurements on the mean and standard deviation for each measurement

07. run_analysis.R lines 51-55

        Lines 51-55 cleans up the original column names for improved readability. Parentheses and dashes are removed, and typographical errors are also removed. "mean" and "std" was modified to have an underscore before the word to improve readability. Other aspects of the variable name were not altered to conserve the length of the whole name.

08. run_analysis.R lines 57-58

        Lines 57-58 group the data by the subject and activity variables and take the mean for each measurement variable