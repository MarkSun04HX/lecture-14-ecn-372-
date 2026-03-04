# -----------------------------
# Combine Red and White Wine Data
# -----------------------------

# Create processed directory if it doesn't exist
if (!dir.exists("data/processed")) {
  dir.create("data/processed", recursive = TRUE)
}

# Read datasets
red <- read.csv("data/raw/winequality-red.csv")
white <- read.csv("data/raw/winequality-white.csv")

# Add binary indicator column
# 1 = Red wine, 0 = White wine
red$is_red <- 1
white$is_red <- 0

# Combine datasets
combined <- rbind(red, white)

# Write output
write.csv(combined,
          file = "data/processed/output.csv",
          row.names = FALSE)

cat("Combined dataset written to data/processed/output.csv\n")