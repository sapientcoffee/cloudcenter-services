#!/bin/bash
# Get the Env Details. In this case as part of the App Profile we will define a custom variable "DEP_ENV" to indicate which list to pick the IP from
# CliQr CCO will be passed the variable by prefix it with eNV as shown below.
#dep_env=vlan1100
dep_env=$eNV_DEP_ENV
# File to fetch the IP from. These files will be stored on the CCO and will maintain the IP Addr list.
# need Fully qualified path!
fname="/usr/local/osmosix/callout/ipam-static/${dep_env}_ip_list"
#echo $fname
# Fetch the first available IP Address from the list and mark the status as used
# gateway netmask are in the available ip list file
ipAddr=`grep -m 1 "available" $fname | cut -d' ' -f1`
gateway=`grep -m 1 "gateway" $fname | cut -d' ' -f2`
netmask=`grep -m 1 "netmask" $fname | cut -d' ' -f2`
#echo $ipAddr
# Change the status of the IP Address from available to used
sed -i -e /$ipAddr/s/available/used/ $fname
# Configure the key value pairs that are needed to be passed to the VM for static IP Address configuration
# These value pairs will be used by the CCO to configure the static IP Address for the deployed VM
echo "nicIP_0=$ipAddr"
#echo "nicDnsServerList_0=10.140.251.11 10.140.223.11 10.140.223.12"; # DNS Server List can also be dynamically fetched from the file.
# comme seperated
echo "nicDnsServerList_0=xx.xx.xx.xx, xx.xx.xx.xx, xx.xx.xx.xx"; # DNS Server List can also be dynamically fetched from the file.
#echo "nicGateway_0=10.0.0.1" ; # Gateway can also be dynamically fetched from the file.
echo "nicGateway_0=$gateway"
#echo "nicNetmask_0=255.255.255.0"; # Netmask can also be dynamically fetched from the file.
echo "nicNetmask_0=$netmask"; # Netmask can also be dynamically fetched from the file.
echo "nicCount=1"
echo "useDHCP=false"
echo "osHostname=helloworld"
echo "timeZone=Canada/Eastern"
echo "hwClockUTC=true"
echo "domainName=google.com" 