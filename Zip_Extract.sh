#!/bin/bash

# Define the directory containing the zip files
ZIP_DIR="/<SOURCE PATH>"  # Replace with the path where your zip files are located

# Define the destination directory on the USB drive
USB_DEST="/<TARGET PATH>"  # I used unix and a usb so my path was /Volumes/<USB PATH>

# Navigate to the directory with the zip files
cd "$ZIP_DIR"

# Iterate over each zip file
for zfile in *.zip; do
    # Extract the category name from the zip file name
    CATEGORY=$(echo "$zfile" | cut -d'-' -f1)
    
    # Create a new directory for the category on the USB drive if it doesn't already exist
    if [ ! -d "$USB_DEST/$CATEGORY" ]; then
        mkdir -p "$USB_DEST/$CATEGORY"
    fi
    
    # Extract the zip file to the corresponding category directory
    unzip "$zfile" -d "$USB_DEST/$CATEGORY"
done

echo "Files have been extracted to their respective folders on the USB drive."

#chmod +x Zip_Extract.sh
