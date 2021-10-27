#!/bin/bash
writepath="/var/log/remote/ultradns.neustar/"
today=$(date +"%Y%m%d")
username="apiuser"
password="apipass"
ultraDnsUrl="https://restapi.ultradns.com/v2/authorization/token"
header_body="grant_type=password&username=$username&password=$password"
Request=$(curl -s --data $header_body --header "Content-Type:application/x-www-form-urlencoded" -X POST $ultraDnsUrl > ${writepath}/${today}-token.json)
accesstoken=$(jq .accessToken ${writepath}/${today}-token.json |sed 's/"//g')
auditapi="https://api.ultradns.com/reports/dns_configuration/audit?filter=date_range:1day"
auditresult=$(curl -s --header "Authorization: Bearer ${accesstoken}" --header "Content-Type:application/json" --header "Accept: text/csv" -X GET $auditapi > ${writepath}/${today}-ultradns.neustar-auditreport.csv)
rm -f ${writepath}/${today}-token.json
