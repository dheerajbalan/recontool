#!/bin/bash

function banner()
{
    local BLUE="\033[34m"
    local RESET="\033[0m"

    echo -e "${BLUE}"
    echo "=========================================="
    echo "------------->BannerSnatcher<-------------"
    echo "=========================================="
    echo -e "${RESET}"
}

banner

green="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
 
function help()
{
	echo "-h,--help     suggests options to perform this scripts"
	echo  "-i,--ip       please specify any ip or doamin of target"
	echo "-p,--port     please specify any port to banner grab"
	echo "Usage: $0 -i <target> -p <port> "
}

ip=""
port=""

while [ $# -gt 0 ]; do 
	case "$1" in 
		-h|-help)
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
		   echo -e "${YELLOW} [!] invalid option"
		   help
		   exit 3
		   ;;
	esac
done 


if [[ -z "$ip" || -z "$port" ]]; then 
	echo -e " ${YELLOW} [!] please specify both ip and port please"
	exit 4
fi

echo -e " ${green} [+] started grabbing banner..."
echo -e " ${YELLOW} [*] banner grabbing on the $port for the target --->> $ip"
banner=$(echo "" | nc -w 3  $ip $port 2>/dev/null | head -3)

if [[ -n "$banner" ]]; then
	echo -e " ${green} [+] banner successfully grabbed on the $port for the target --->> $ip"
	echo -e " ${green} [+] found banner ---> $banner" 
else
	echo -e " ${RED} [-] couldn't garb any banner from the $port or may be filtered or even closed"
fi
