# Codebook file describing the modifications done on the data.

The features and descriptions of the original data are provided in the dataset. Please refer to the "README.txt", "features_info.txt", "features.txt" and "activity_labels.txt" files in the original dataset for detailed information on the features.

For creating the new tidy dataset required for this project, the following steps were performed on the original dataset.

1. All the similar data is merged using the rbind() function.
2. Only those columns with the mean and standard deviation measures are taken from the whole dataset.
3.  Activity labels are substituted with the activity names from the "activity_labels.txt" file provided with the original data.
4. The extracted columns are given their correct descriptive names, taken from the file "features.txt" provided with the original data.
5. A final tidy dataset is created by merging all the above data. Average of each variable for each subject are computed and are written into a file called "Tidy.data.txt" in a comma separated format.
