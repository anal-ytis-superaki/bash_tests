#!/usr/bin/env python3

import time
from datetime import datetime
import os

LOG_DIR = "/opt/etc"
LOG_FILES = ["logfile_1.log", "logfile_2.log", "logfile_3.log"]
LINES_PER_FILE = 100

# Ensure log directory exists
os.makedirs(LOG_DIR, exist_ok=True)

def write_log_entries(file_name):
    full_path = os.path.join(LOG_DIR, file_name)
    timestamp = datetime.now().isoformat()
    print(f"[{timestamp}] Writing to {full_path}")

    with open(full_path, "a") as f:
        for i in range(LINES_PER_FILE):
            entry_time = datetime.now().isoformat()
            line = f"{entry_time} - INFO - Log line {i+1} for {file_name}\n"
            f.write(line)

    print(f"[{datetime.now().isoformat()}] Wrote {LINES_PER_FILE} lines to {file_name}")

if __name__ == "__main__":
    print(f"[{datetime.now().isoformat()}] Log generator started")

    for log_file in LOG_FILES:
        write_log_entries(log_file)

    print(f"[{datetime.now().isoformat()}] Log generator finished")
