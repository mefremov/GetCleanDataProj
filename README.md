# Getting cleaning data course project

The goal of this project is to prepare tidy data that can be used for later analysis.  
The raw data have been used from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  
This data is distributed in zip format

### The repo consists of 4 files: 
- **README.md** - readme file 
- **CodeBook.md** - where is described the raw data, the variables, all transformations of the raw data  
- **run_analysis.R** - contain R script of raw data transformations includiang loading raw data and uploading tidy data  
- **tidy_data.txt** - file with transformed data
 
For transformation was using **R version 3.1.2** and such packages for this version: **plyr** and **dplyr**.  
Be sure that you have installed these packages.  

To start work please unzip *getdata-projectfiles-UCI HAR Dataset.zip* into your R working directory in **UCI HAR Dataset** folder. Set you working directory with command **setwd("your working directory")**.  
**NOTE:** the path to your working directory doesn't have to include folder "UCI HAR Dataset".  

For details of script working please see into **run_analysis.R**. It was written with comments.