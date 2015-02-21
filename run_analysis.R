# R script does the following.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Style guide used:
# Hadley Wickam's R Style guide
# http://adv-r.had.co.nz/Style.html
#
library(data.table)
library(stringr)
library(dplyr)
library(tidyr)

# Import the activity labels from the current directory
#
activity_labels <- fread("./activity_labels.txt", stringsAsFactors = FALSE)
setnames(activity_labels, c("V1", "V2"), c("value", "label"))

# Import and clean the feature names by:
#   removing non alpha-numeric characters
#   replacing '-' with '_'
#   converting names to lowercase
#
# Piping '%>%' used to simplify code
#
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

# Function to import the training or test datasets based on the subfolder
# of the curent directory and file naming scheme, and combine
# the subject and activity variables with the rest of the measurements
#
# The function enables code resuse.
#
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

# Import the training and test datasets
#
subject_y_x_train <- importdata("train")
subject_y_x_test <- importdata("test")

# Combine the full training and test datasets and
# change the activity variable from integer to a factor
# with the appropriate activity label.
#
all_data <-  (
    rbind(subject_y_x_train, subject_y_x_test) %>%
        mutate(all_data, activity = cut(activity, breaks = nrow(activity_labels), labels = activity_labels[, label]))
)

# Select only columns which contain mean or standard deviation
#
all_data <- cbind(select(all_data, c(subject, activity)), select(all_data, contains("mean")), select(all_data, contains("std")))

# Calculate the means of the retained variables
#
summary_data <- all_data[, lapply(.SD, mean, na.rm = TRUE), by = list(activity, subject)]

# Ourput the summary dataset for uploading
#
write.table(summary_data, file = "summary_data.txt", append = FALSE, sep = "\t")
