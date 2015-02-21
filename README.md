## The dataset includes the following files:

- README.md: this file which contains the description of the run_analysis.R script
- CodeBook.md: this is the data dictionary for the summary_data.txt dataset produced by the script
- run_analysis.R: the script that peroms the data cleaning and summarizarion

The source data files used as input to the analysis script
- features_info.txt: Shows information about the variables used on the feature vector.
- features.txt: List of all features.
- activity_labels.txt: Links the class labels with their activity name.
- train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- test/subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- train/X_train.txt: Training set.
- train/y_train.txt: Training labels.
- test/X_test.txt: Test set.
- test/y_test.txt: Test labels.

The following files are also available for the train and test data but are not used by the analysis script. Their descriptions are equivalent. 

- `train/Inertial Signals/total_acc_x_train.txt`: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the `total_acc_x_train.txt` and `total_acc_z_train.txt` files for the Y and Z axis. 
- `train/Inertial Signals/body_acc_x_train.txt`: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- `train/Inertial Signals/body_gyro_x_train.txt`: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


## The run_analysis.R script
The run_analysis R script does the following.
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Coding style guide used:
[Hadley Wickam's R Style guide](http://adv-r.had.co.nz/Style.html)

### Libraries used
data.table
stringr
dplyr
tidyr

### Import the activity labels from the current directory

```
activity_labels <- fread("./activity_labels.txt", stringsAsFactors = FALSE)
setnames(activity_labels, c("V1", "V2"), c("value", "label"))
```

### Import and clean the feature names by
- Removing non alpha-numeric characters
- Replacing '-' with '_'
- converting names to lowercase

Piping '%>%' used to simplify code

```
feature_names <- fread("./features.txt", stringsAsFactors = FALSE)
feature_names <- (
    feature_names %>%
    select(feature_name = V2) %>%
    mutate(feature_name = str_replace_all(feature_name, "\\,", "")) %>%
    mutate(feature_name = str_replace_all(feature_name, "\\-", "_")) %>%
    mutate(feature_name = str_replace_all(feature_name, "\\(\\)", "")) %>%
    mutate(feature_name = str_replace_all(feature_name, "\\(", "")) %>%
    mutate(feature_name = str_replace_all(feature_name, "\\)", "")) %>%
    mutate(feature_name = tolower(feature_name))
)
```

### Function to import the training or test datasets 
Takes one parameter: the subfolder that contains the specific dataset based on the subfolder of the curent directory and file naming scheme. It imports the core datsets and combines them with the subject and activity variables with the rest of the measurements. Apply the cleaned variable names to the datasets.

The function enables code resuse.

```
importdata <- function(dataset) {
    x <- data.table(read.table(paste("./", dataset, "/X_", dataset, ".txt", sep = "")))
    setnames(x, colnames(x), feature_names[, feature_name])
 
    y <- data.table(read.table(paste("./", dataset, "/y_", dataset, ".txt", sep = "")))
    setnames(y, "V1", "activity")
 
    subject <- data.table(read.table(paste("./", dataset, "/subject_", dataset, ".txt", sep = "")))
    setnames(subject, "V1", "subject")
 
    y_x <- cbind(y, x)
    cbind(subject, y_x)
}
```

### Import the training and test datasets

```
subject_y_x_train <- importdata("train")
subject_y_x_test <- importdata("test")
```

### Combine tjhe datasets 
Combine the full training and test datasets and change the activity variable from integer to a factor with the appropriate activity label.

```
all_data <-  (
    rbind(subject_y_x_train, subject_y_x_test) %>%
    mutate(all_data, activity = cut(activity, breaks = nrow(activity_labels), labels = activity_labels[, label]))
)
```

### Select only columns which contain mean or standard deviation

```
all_data <- cbind(select(all_data, c(subject, activity)), select(all_data, contains("mean")), select(all_data, contains("std")))
```

### Calculate the means of the retained variables

```
summary_data <- all_data[, lapply(.SD, mean, na.rm = TRUE), by = list(activity, subject)]
```

### Output the summary dataset for uploading

```
write.table(summary_data, file = "summary_data.txt", append = FALSE, sep = ",")
```