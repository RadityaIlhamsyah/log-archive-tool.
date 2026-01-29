#!/bin/bash

# ==============================================================================
# Script Name: log-archive.sh
# Description: A simple utility to compress and archive log directories.
# Author: Raditya Ilhamsyah
# ==============================================================================

# Configuration
ARCHIVE_DIR="archived_logs"
LOG_HISTORY="archive_log.txt"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# --- Functions ---

# Print messages with formatting
log_info() { printf "\e[32m[INFO]\e[0m %s\n" "$1"; }
log_error() { printf "\e[31m[ERROR]\e[0m %s\n" "$1" >&2; }

show_usage() {
    echo "Usage: log-archive <log-directory>"
    echo "Example: ./log-archive.sh /var/log/nginx"
}

# --- Main Logic ---

# Check if argument is provided
if [[ -z "$1" ]]; then
    show_usage
    exit 1
fi

TARGET_DIR="$1"

# Check if the directory exists
if [[ ! -d "$TARGET_DIR" ]]; then
    log_error "Directory '$TARGET_DIR' does not exist."
    exit 1
fi

# Prepare environment
mkdir -p "$ARCHIVE_DIR"

ARCHIVE_FILENAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="$ARCHIVE_DIR/$ARCHIVE_FILENAME"

log_info "Starting compression for: $TARGET_DIR..."

# Execute compression
# We use -c (create), -z (gzip), -f (file)
if tar -czf "$ARCHIVE_PATH" "$TARGET_DIR" 2>/dev/null; then
    log_info "Archive created successfully at: $ARCHIVE_PATH"
    
    # Record the event in the history file
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Archived: $TARGET_DIR | File: $ARCHIVE_FILENAME" >> "$LOG_HISTORY"
    log_info "Event recorded in $LOG_HISTORY"
else
    log_error "Something went wrong during the compression process."
    exit 1
fi
