#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if the file fileToLink.lst exists in the script directory
LIST_FILE="$SCRIPT_DIR/fileToLink.lst"

# Default values for options
AUTO_BACKUP=false

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --backup|-b) AUTO_BACKUP=true ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
    shift
done

if [[ ! -f "$LIST_FILE" ]]; then
    echo "Error: The file $LIST_FILE does not exist."
    exit 1
fi

while IFS= read -r line || [[ -n "$line" ]]; do
    # Ignore empty lines and comments
    [[ -z "$line" || "$line" =~ ^# ]] && continue
    
    # Extract source and destination paths
    src=$(echo "$line" | awk -F" -> " '{print $2}' | awk '{print $1}')
    dest=$(echo "$line" | awk -F" -> " '{print $1}' | awk '{print $1}')
    
    # Remove quotes around paths
    src=${src//\'/}
    dest=${dest//\'/}
    
    # Expand variables in paths
    src=$(eval echo "$src")
    dest=$(eval echo "$dest")

    # Check if the source file exists
    if [[ ! -e "$src" ]]; then
        echo "Warning: The source file $src does not exist. Skipping."
        continue
    fi
    
    # Check if a file or link already exists at the destination
    if [[ -L "$dest" ]]; then
        echo "The symbolic link $dest already exists. Skipping."
        continue

    elif [[ -e "$dest" ]]; then
        echo "The file $dest already exists."
        if [[ "$AUTO_BACKUP" == true ]]; then
            mv "$dest" "$dest.bak"
            echo "Backup created: $dest.bak"
        else
            read -p "Do you want to create a backup? (Y/n) " response
            response=$(echo "$response" | tr '[:upper:]' '[:lower:]') # Convert to lowercase
            if [[ "$response" != "n" ]]; then
                mv "$dest" "$dest.bak"
                echo "Backup created: $dest.bak"
            else
                rm -f "$dest"
                echo "Existing file removed."
            fi
        fi
    fi
    
    # Create the symbolic link
    ln -s "$src" "$dest"
    echo "Symbolic link created: $dest -> $src"

done < "$LIST_FILE"