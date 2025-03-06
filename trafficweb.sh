#!/bin/bash
red='\033[0;31m'
green='\033[1;32m'
yellow='\033[1;33m'
bleu='\033[0;34m'
NC='\033[0m'


if [[ -n $1 && $USER == "root" && -n $2 ]]; then
   echo -e "${green}start listening in the $1 interface ${NC}"
   tcpdump -i $1 src port 80 or dst port 80 or src port 443 or dst port 443 -n -w $2.pcap
elif [[ $USER != "root" ]];then
    echo -e "${red}you need the root privilege !!!!${NC}"
elif [ $1 == "-h" ]; then
    echo -e "${yellow}the sysntax : $0 [interface] [filename]${NC}"
fi


