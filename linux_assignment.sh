#!/bin/bash

# Set the source URL (use the FULL url — check it isn't cut off)
ASSIGNMENT_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

# Step 1: Download CSV file
echo "Step 1: Downloading CSV..."
curl -L -o linux_assignment.csv "$ASSIGNMENT_URL"

# Step 2: Create raw directory
mkdir -p raw
echo "Step 2: Created raw/ directory"

# Step 3: Move CSV into raw directory
mv linux_assignment.csv raw/
echo "Step 3: Moved CSV into raw/"

cd raw || exit 1

# Step 4: Rename Variable_code column to variable_code
sed -i 's/Variable_code/variable_code/g' linux_assignment.csv
echo "Step 4: Renamed column header"

# Step 5: Confirm renaming
echo "Step 5: Preview of file after rename:"
head linux_assignment.csv

# Step 6: List column names and numbers
echo "Step 6: Column names and positions:"
head -n 1 linux_assignment.csv | tr ',' '\n' | grep -n ""

# Step 7: Extract requested columns into a new file
awk -F ',' '{print $1,$9,$5,$6}' linux_assignment.csv > 2023_year_financial.csv
echo "Step 7: Extracted columns into 2023_year_financial.csv"

echo "Done."
