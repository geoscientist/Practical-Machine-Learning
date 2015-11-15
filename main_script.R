# downloading input data
download.file('https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv', destfile = 'train_data.csv')
download.file('https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv', destfile = 'test_data.csv')

# reading data
train_data <- read.csv("train_data.csv", header = TRUE)
test_data <- read.csv("test_data.csv", header = TRUE)

# cleaning empty features
good_data <- apply(!is.na(train_data), 2, sum)>19621
train_data <- train_data[, good_data]
test_data <- test_data[, good_data]

# data preprocessing
zerovals <- nearZeroVar(train_data)