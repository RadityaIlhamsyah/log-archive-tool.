# log-archive-tool.

A lightweight Bash-based CLI tool to automate the process of archiving and compressing log directories. Built as part of the Roadmap.sh(https://roadmap.sh/projects/log-archive-tool) backend challenges.

## 🌟 Features
- **Easy Compression:** Automatically compresses any directory into a `.tar.gz` format.
- **Smart Naming:** Files are timestamped (YYYYMMDD_HHMMSS) to prevent overwriting.
- **Auto-Logging:** Maintains a history file (`archive_log.txt`) for every archive created.
- **Error Handling:** Validates directory existence and provides clear feedback.

## 🚀 Getting Started

### Prerequisites
- A Linux/Unix-based system.
- `tar` utility installed (standard on most distros).

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/RadityaIlhamsyah/log-archive-tool.git
   https://github.com/RadityaIlhamsyah/log-archive-tool.git
   cd log-archive-tool https://roadmap.sh/projects/log-archive-tool

2. Grant execution permissions:
    ```bash
    chmod +x log-archive.sh

### Usage
Run the script by providing the path to the logs you wish to archive:
    ```bash
    ./log-archive.sh <log-directory>

### Example 
    ```bash
    ./log-archive.sh /var/log/nginx

3. 📂 Project Structure
log-archive.sh — The main logic for archiving and logging.

archived_logs/ — The destination folder for your .tar.gz files.

archive_log.txt — A permanent record of all archive activities.

4. 📝 License
This project is open-source and available under the MIT License.
