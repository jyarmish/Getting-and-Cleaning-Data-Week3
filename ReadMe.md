## Getting and Cleaning Data Project - Week3
###


* I gathered the list of features from "features.txt"

* I read in "X_test.txt" and labeled the columns with the features from the previous
* I then made three new columns as follows:
One column the subjects by number via "subject_test.txt"
One column the activity by number via "y_test.txt"
And one column all with the string "test" to identify that all these values were from the testing stage

* I then read in "X_train.txt" and labeled the columns with the features from two steps prior
I then made three new columns as follows:
One column the subjects by number via "subject_train.txt"
One column the activity by number via "y_train.txt"
And one column all with the string "train" to identify that all these values were from the testing stage

* I then combined these two "test" and "train" data sets

* Next I read in the activity labels via "activity_labels.txt"
and created a new column placing labels based on the corresponding activity numbers that were placed
in the data frame via "y_test.txt" and "y_train.txt"

* Next I pulled out all columns from the original data that contain the words "mean" or "std" in their title
and I cjecked all the columns for NA values

* I then pulled out all info for individual subjects and averaged the columns per specific exercise

* I then wrote the table to "mytidydata.txt" 