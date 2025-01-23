# Docker Cleanup Utility

## Overview

The **Docker Cleanup Utility** is a Bash script designed to help manage and clean up Docker resources. It allows you to efficiently remove unused Docker containers, images, volumes, networks, and build cache, reclaiming disk space in your system. Additionally, the script provides disk usage statistics and the ability to selectively clean up Docker components.

This tool is especially useful for developers and DevOps engineers who work with Docker regularly and need to keep their environment lean and clean.

## Features

- **Remove Stopped Containers**: Clean up containers that are no longer running.
- **Remove Dangling Images**: Delete untagged images that take up space but are not being used.
- **Remove Unused Volumes**: Clean up unused Docker volumes to reclaim disk space.
- **Remove Unused Networks**: Delete Docker networks that are no longer in use.
- **System Prune**: Clean up all unused Docker resources in one go (stopped containers, unused images, volumes, networks).
- **Remove Build Cache**: Clear the Docker build cache to free up space used during image builds.
- **Container, Image, Volume Cleanup by Name or ID**: Remove specific containers, images, or volumes by name or ID.
- **Log Truncation**: Truncate Docker container logs to save disk space.
- **Show Docker Disk Usage**: View disk usage statistics for Docker images, containers, volumes, and more.
- **Disk Space Alert**: Get an alert when disk usage exceeds a certain threshold.
- **Interactive Menu**: Simple text-based interface that guides you through the available cleanup options.
- **Confirmation Prompts**: Avoid accidental deletion by prompting for user confirmation before destructive actions.
- **Dry Run**: Option to simulate cleanup actions without actually performing them.

## Requirements

- **Docker**: Ensure Docker is installed and running on your system.
- **Bash**: The script is written for Bash, which is available on most Unix-like operating systems (Linux, macOS).
- **Permissions**: You may need root or Docker group permissions to run some Docker commands (e.g., pruning or removing containers/images).

## Installation

### Step 1: Download the Script

You can download or copy the script directly into a file on your machine:

```bash
curl -o docker_cleanup.sh https://raw.githubusercontent.com/cricsion/DockerCleanup/main/docker_cleanup.sh
```

Alternatively, you can copy and paste the script into a new file, e.g., `docker_cleanup.sh`.

### Step 2: Make the Script Executable

After downloading or creating the script, make it executable:

```bash
chmod +x docker_cleanup.sh
```

### Step 3: Run the Script

You can now run the script from the command line:

```bash
./docker_cleanup.sh
```

### Step 4: (Optional) Automate Cleanup with Cron

To automatically run the cleanup process on a schedule, you can add the script to `cron` (Linux/macOS) or Task Scheduler (Windows). For example, to run the cleanup every Sunday at 3 a.m.:

```bash
crontab -e
```

Add the following line to schedule the cleanup:

```bash
0 3 * * SUN /path/to/docker_cleanup.sh
```

## Usage

When you run the script, you’ll be presented with an interactive menu to choose from various Docker cleanup actions. Here are the available options:

### Menu Options

1. **Remove Stopped Containers**  
   Removes all stopped containers to free up space.

2. **Remove Unused Images (Dangling)**  
   Cleans up untagged images (dangling images), which are no longer needed.

3. **Remove Unused Volumes**  
   Deletes unused Docker volumes that are taking up space.

4. **Remove Unused Networks**  
   Cleans up Docker networks that are not being used.

5. **Remove All Unused Docker Data (System Prune)**  
   Prunes all unused Docker resources, including containers, images, volumes, and networks. Be cautious as this action is irreversible.

6. **Remove Docker Build Cache**  
   Clears the Docker build cache to free up disk space used during image builds.

7. **Remove All Docker Data (System Prune -a)**  
   Removes all unused images, including those that aren't dangling, in addition to containers, volumes, and networks. This is a more aggressive cleanup.

8. **Remove Specific Container**  
   Prompt the user to specify a container by name or ID for removal.

9. **Remove Specific Image**  
   Prompt the user to specify an image by name or ID for removal.

10. **Remove Specific Volume**  
   Prompt the user to specify a volume by name or ID for removal.

11. **Remove Docker Log Files**  
   Truncate the log file for a specified container without deleting the log file itself. This helps reduce disk usage by clearing large log files.

12. **Show Docker Disk Usage (docker system df)**  
   View detailed disk usage statistics for Docker resources such as images, containers, and volumes.

13. **Show Disk Space Alert**  
   Alerts if your disk usage exceeds 90%, prompting you to clean up resources.

14. **Exit**  
   Exit the script without performing any actions.

### Example Usage

```bash
$ ./docker_cleanup.sh
Docker Cleanup Utility
=======================
Choose an option:
1) Remove stopped containers
2) Remove unused images (dangling)
3) Remove unused volumes
4) Remove unused networks
5) Remove all unused Docker data (system prune)
6) Remove build cache
7) Remove all Docker data (system prune -a)
8) Remove specific container
9) Remove specific image
10) Remove specific volume
11) Remove Docker log files
12) Show Docker disk usage (docker system df)
13) Show disk space alert
14) Exit
=======================
Enter choice [1-14]: 5
Are you sure you want to proceed? (y/n): y
Removing all unused Docker data (system prune)...
```

## Safety Features

- **Confirmation Prompts**: Before performing destructive actions like pruning Docker resources, the script asks for user confirmation to ensure you don’t accidentally delete important data.
- **Dry Run Mode**: If you're unsure about what the script will do, you can run it in a dry-run mode to simulate the cleanup process without making any changes.
  
## Logging and History

- Every cleanup action is logged with a timestamp to a `cleanup_history.log` file. This allows you to track past cleanups and troubleshoot if necessary.
  
## Customization

Feel free to modify the script for your own needs:

- **Cron Jobs**: You can schedule the script to run automatically at specific intervals (e.g., weekly or monthly).
- **Add More Cleanup Options**: The script is highly customizable—add more specific Docker commands as needed for your environment.

## Troubleshooting

- **Permissions**: If you encounter permission issues, ensure you're running the script with sufficient privileges (e.g., using `sudo` for Docker commands).
- **No Output**: If the script doesn’t show any output for some actions, check Docker's status or ensure the resources (e.g., stopped containers, unused volumes) exist.

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request if you have suggestions or improvements.

---

### License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.

---
