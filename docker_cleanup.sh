#!/bin/bash

echo "Docker Cleanup Utility"
echo "======================="
echo "Choose an option:"
echo "1) Remove stopped containers"
echo "2) Remove unused images (dangling)"
echo "3) Remove unused volumes"
echo "4) Remove unused networks"
echo "5) Remove all unused Docker data (system prune)"
echo "6) Remove build cache"
echo "7) Remove all Docker data (system prune -a)"
echo "8) Remove specific container"
echo "9) Remove specific image"
echo "10) Remove specific volume"
echo "11) Remove Docker log files"
echo "12) Show Docker disk usage (docker system df)"
echo "13) Show disk usage alert"
echo "14) Exit"
echo "======================="

clean_docker() {
    case $choice in
        1)
            echo "Removing stopped containers..."
            docker container prune -f
            ;;
        2)
            echo "Removing unused images (dangling)..."
            docker image prune -f
            ;;
        3)
            echo "Removing unused volumes..."
            docker volume prune -f
            ;;
        4)
            echo "Removing unused networks..."
            docker network prune -f
            ;;
        5)
            echo "Removing all unused Docker data (system prune)..."
            read -p "Are you sure you want to proceed? (y/n): " confirm
            if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
                echo "Action cancelled."
                return 0
            fi
            docker system prune -f
            ;;
        6)
            echo "Removing Docker build cache..."
            docker builder prune -f
            ;;
        7)
            echo "Removing all unused Docker data (system prune -a)..."
            read -p "Are you sure you want to proceed? (y/n): " confirm
            if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
                echo "Action cancelled."
                return 0
            fi
            docker system prune -a -f
            ;;
        8)
            read -p "Enter the container name or ID to remove: " container_id
            echo "Removing container $container_id..."
            docker rm $container_id
            ;;
        9)
            read -p "Enter the image name or ID to remove: " image_id
            echo "Removing image $image_id..."
            docker rmi $image_id
            ;;
        10)
            read -p "Enter the volume name or ID to remove: " volume_id
            echo "Removing volume $volume_id..."
            docker volume rm $volume_id
            ;;
        11)
            read -p "Enter the container ID to remove logs for: " container_id
            echo "Truncating log file for container $container_id..."
            truncate -s 0 /var/lib/docker/containers/$container_id/*-json.log
            ;;
        12)
            echo "Showing Docker disk usage (docker system df)..."
            docker system df
            ;;
        13)
            disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
            if [ "$disk_usage" -gt 90 ]; then
                echo "Warning: Disk usage is over 90%. Consider cleaning up Docker resources."
            else
                echo "Disk usage is normal ($disk_usage%)."
            fi
            ;;
        14)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice! Please select a valid option [1-14]."
            ;;
    esac
}

while true; do
    # Prompt for user input
    read -p "Enter choice [1-14]: " choice
    clean_docker
done

