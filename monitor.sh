#!/bin/bash

# Function to check temperature and print based on range
check_temp() {
    local sensor_name="$1"
    local temp_value=$(sudo ipmitool sdr | grep "$sensor_name" | awk -F'|' '{print $2}' | tr -d '[:space:]' | cut -d" " -f1 | tr -d "degreesC")

    if [ -z "$temp_value" ]; then
        echo "$sensor_name: Error reading temperature."
        return
    fi

    # Check temperature value and assign color
    if (( temp_value < 60 )); then
        echo -e "$sensor_name: \e[32m$temp_value°C\e[0m"   # Green
    elif (( temp_value > 65 && temp_value <= 70 )); then
        echo -e "$sensor_name: \e[33m$temp_value°C\e[0m"   # Yellow
    elif (( temp_value > 70 )); then
        echo -e "$sensor_name: \e[31m$temp_value°C\e[0m"   # Red
    else
        echo "$sensor_name: $temp_value°C"
    fi
}

# Check temperatures for the specified sensors
while true; do
    clear
    echo "Monitoring Temperatures:"
    echo "------------------------"
    check_temp "SOC_VRM Temp"
    check_temp "VRMABCD Temp"
    check_temp "VRMEFGH Temp"
    check_temp "DIMMABCD Temp"
    check_temp "DIMMEFGH Temp"
    check_temp "GPU1 Temp"
    check_temp "GPU3 Temp"
    check_temp "GPU4 Temp"
    check_temp "GPU6 Temp"
    check_temp "CPU Temp"
    check_temp "System Temp"
    check_temp "Peripheral Temp"
    sleep 10  # Pause for 10 seconds before checking again
done