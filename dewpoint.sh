#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Path to the binary
READ_BIN="$SCRIPT_DIR/read_htu21d"

# Run the program and capture values
output=$("$READ_BIN" -p)
temp=$(echo "$output" | awk '/Temperature/ {print $2}')
hum=$(echo "$output" | awk '/Humidity/ {print $2}')

# Calculate dew point using bc
dew_point=$(awk -v T="$temp" -v RH="$hum" 'BEGIN {
    a=17.27; b=237.7
    gamma = (a*T)/(b+T) + log(RH/100)
    dp = (b*gamma)/(a-gamma)
    printf "%.2f", dp
}')

# Read CPU temperature (millidegree → degree)
cpu_raw=$(cat /sys/class/thermal/thermal_zone0/temp)
cpu_temp=$(awk -v t="$cpu_raw" 'BEGIN { printf "%.2f", t/1000 }')

echo "CPU Temperature: $cpu_temp °C"
echo "Housing Temperature: $temp °C"
echo "Housing Humidity: $hum %"
echo "Housing Dew Point: $dew_point °C"

