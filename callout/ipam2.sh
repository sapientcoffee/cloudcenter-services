#!/bin/bash
# Get the Env Details. In this case as part of the App Profile we will define a custom variable "DEP_ENV" to indicate which list to pick the IP from
# CliQr CCO will be passed the variable by prefix it with eNV as shown below.
dep_env=$eNV_DEP_ENV
# File to fetch the IP from. These files will be stored on the CCO and will maintain the IP Addr list.
fname="/usr/local/osmosix/callout/ipam-static/${dep_env}_ip_list"
# Fetch the first available IP Address from the list and mark the status as used
#ipAddr=`grep -m 1 "available" $fname | cut -d' ' -f1`
ipAddr=$nicIP_0
 
# Change the status of the IP Address from available to used
#sed -i -e /$ipAddr/s/available/used/ $fname
sed -i -e /$ipAddr/s/used/available/ $fname