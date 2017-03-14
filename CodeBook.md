Title: "CodeBook.md"

Codebook explaining the different variables used and any transformations applied in scripts for data cleaning project.

## run_analysis.R

#Files Used :

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt' or 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

#Variables Used :

- features : Contains the content of "features.txt"
- activity_labels : Contains the content of "activity_labels.txt"
- test_subject : Contains the content of "subject_test.txt"
- test_set : Contains the content of "X_test.txt"
- test_labels : Contains the content of "y_test.txt"
- training_subject : Contains the content of "subject_train.txt"
- training_set : Contains the content of "X_train.txt"
- training_labels : Containsthe comtents of "subject_train.txt"

- test_merged : Contains the merged data of test_subject, test_labels and test_set.
- training_merged : Contains the merged data of training_subject, training_labels and training_set.
- merged_final <- Contains the merged data of test_merged and training_merged. All the operations of cleaning are done on this data set.
- Final_Tidy <- Contains the final data set after grouping and summarising
