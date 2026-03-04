# -----------------------------
# Train-Test Split (80/20)
# -----------------------------

# Create processed directory if needed
if (!dir.exists("data/processed")) {
  dir.create("data/processed", recursive = TRUE)
}

# Generate a random seed
seed_value <- sample(1:1000000, 1)
set.seed(seed_value)

cat("Random seed used:", seed_value, "\n")

# Read combined dataset
data <- read.csv("data/processed/output.csv")

# Number of observations 
n <- nrow(data)

# Create random 80% index
train_index <- sample(1:n, size = 0.8 * n)

# Split data
train <- data[train_index, ]
test  <- data[-train_index, ]

# Write output files
write.csv(train, "data/processed/train.csv", row.names = FALSE)
write.csv(test,  "data/processed/test.csv",  row.names = FALSE)

cat("Train and test datasets written to data/processed/\n")