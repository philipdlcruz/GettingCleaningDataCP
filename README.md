## README for Getting and Cleaning Data Course Project

### run_analysis.R Script Restrictions

1. run_analysis.R only works if you have the original and unaltered "UCI HAR Dataset."
2. You must have the "dplyr" and "tidyr" packages installed.
3. Successful operation was tested on a Windows 7 x64 machine with R 3.1.1 and RStudio 0.98.1062. Successful operation cannot be guaranteed for other operating systems.

### run_analysis.R Script Operation

This segment will describe how run_analysis.R works line by line.

01. Calling the function

        By default, the dataset is set to "UCI HAR Dataset." The run_analysis function is called either by `run_analysis("UCI HAR Dataset")` or by `run_analysis()`

02. Lines 02-05

        Lines 02-05 stops the execution of the function in case "UCI HAR Dataset" does not exist in the working directory

03. Lines 07-08

        Lines 07-08 loads the required R packages for the script to function properly

04. Lines 01-18

        Lines 10-18 stores each separate dataset directory from "UCI HAR Dataset" in a variable for calling convenience

05. Lines 20-28

        Lines 20-28 reads all the datasets from "UCI HAR Dataset" and stores it in separate variables

06. Lines 30-40

        Lines 30-40 deal with the cleaning of the column names of the data. Please refer to the accompaying code book for more details. See the section on "Transformations Done on the Original Data" numbers 1-3.

07. Lines 42-44

        Lines 42-44 first combines all the student and activity columns to the measurement columns. Then, both the test and train datasets are combined. Please refer to the accompaying code book for more details. See the section on "Transformations Done on the Original Data" numbers 1-3.
        
08. Line 46

        Line 46 updates the column names for the new dataset created from (07) line 44
        
09. Lines 48-49

        Lines 48-49 extracts only the measurements on the mean and standard deviation for each measurement
        
10. Lines 51-55

        Lines 51-55 deal with the cleaning of the column names of the data. Please refer to the accompaying code book for more details. See the section on "Transformations Done on the Original Data" numbers 1-3.

11. Lines 57-58

        Lines 57-58 group the data by the subject and activity variables and take the mean for each measurement variable
        
12. Line 60

        Line 60 writes the summarized data to a text file in the working directory as "run_analysis_output.txt"