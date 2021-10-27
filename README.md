# ultradnsaudit
Extract the daily ultradns.neustar audit report over API with a bash script.


Usage:

update username & password with your api restricted credentials.
execute via cron:

#get ultradns audit report:

0 1 * * * /home/scripts/ultradns/auditreport.sh >/dev/null 2>&1
