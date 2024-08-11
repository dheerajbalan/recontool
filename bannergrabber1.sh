#!/bin/bash

function help() {
    echo "-h, --help     suggests options to perform this script"
    echo "-i, --ip       specify an IP or domain of the target"
    echo "-p, --port     specify a port for banner grabbing"
    echo "Usage: $0 -i <target> -p <port>"
}

# Initialize variables
ip=""
port=""

# Argument parsing
while [ $# -gt 0 ]; do
    case "$1" in
        -h|--help)
            help
            exit 0
            ;;
        -i|--ip)
            ip=$2
            shift 2
            ;;
        -p|--port)
            port=$2
            shift 2
            ;;
        *)
            echo "[!] Invalid option: $1"
            help
            exit 3
            ;;
    esac
done

# Check if IP and port were provided
if [[ -z "$ip" || -z "$port" ]]; then
    echo "Error: Both IP and port must be specified!"
    help
    exit 1
fi

# Ensure netcat is installed
if ! command -v nc &> /dev/null; then
    echo "Error: netcat (nc) is not installed. Please install it and try again."
    exit 1
fi

echo "[+] Started grabbing banner..."
echo "[*] Banner grabbing on port $port for the target --->> $ip"

# Perform banner grabbing and store it in the 'banner' variable
banner=$(echo "" | nc -w 3 $ip $port 2>/dev/null | head -3)

# Output the raw banner, regardless of what it contains
echo "[DEBUG] Raw banner output:"
echo "$banner"

# Check if banner grabbing was successful
if [[ -n "$banner" ]]; then
    echo "[+] Banner for $ip on port $port:"
    echo "$banner"
else
    echo "[-] No banner received. The port may be closed or filtered, or the service does not provide a banner."
fi
