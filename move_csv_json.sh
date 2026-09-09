#!/bin/bash
#Step 1: Create Variables for source and destination directory
SOURCE_DIR="/home/chinejess/workspace"
DEST_DIR="/home/chinejess/json_and_CSV"

#Step 2: Confirm that source folder exists, create it if not
if [ ! -d "$SOURCE_DIR" ]; then
        echo "Source directory '$SOURCE_DIR' does not exist. Creating it now..."
        mkdir -p "$SOURCE_DIR"
        echo "Source directory created: $SOURCE_DIR"
fi

#Step 3: Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"
echo "Destination Directory created"

#Step 4: Collect the CSV and JSON files into lists
shopt -s nullglob
csv_files=("$SOURCE_DIR"/*.csv "$SOURCE_DIR"/*.CSV)
json_files=("$SOURCE_DIR"/*.json "$SOURCE_DIR"/*.JSON)
echo "CSV and JSON files are in a list"

#Step 5: Move all CSV Files
if [ ${#csv_files[@]} -gt 0 ]; then
        echo "Step 3: Moving CSV file(s).."
        mv -v "${csv_files[@]}" "$DEST_DIR"/
else
        echo "Step 3: No CSV files found in $SOURCE_DIR"
fi

#Step 6: Move all .json files
if [ ${#json_files[@]} -gt 0 ]; then
        echo "step 4: Moving JSON file(s)..."
        mv -v "${json_files[@]}" "$DEST_DIR"/
else
        echo "Step 4: No JSON files found in $SOURCE_DIR"
fi
shopt -u nullglob

#Step 7: Confirm Destination Directory content
if [ -n "$(ls -A "$DEST_DIR")" ]; then
    echo "Step 5: Contents of $DEST_DIR now:"
    ls -lh "$DEST_DIR"
    echo "Done. All available CSV and JSON files have been moved."
else
    echo "Step 5: No files were moved. $DEST_DIR is empty."
fi
