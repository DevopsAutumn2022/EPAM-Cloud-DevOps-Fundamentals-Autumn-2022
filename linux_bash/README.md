# Linux/Bash task

### This folder contains three scripts:
***netscan_script.sh*** scans you network for IP addresses and open system TCP ports.<br/>For displaying IP addresses in your current network add ***--all*** key as an argument. Since you may have several network interfaces you'll be asked to enter a subnet you are interested to scan in a format xxx.xxx.xxx.xxx/xx
```
$ ./netscan_script.sh --all
You may have multiple interfaces, enter a target network (expected format - xxx.xxx.xxx.xxx/xx)
192.168.90.0/24
# Nmap 7.80 scan initiated Thu Jan 19 13:05:06 2023 as:
```
For displaying a list of open system TCP ports add ***--target*** key as an argument:
```
$ ./netscan_script.sh --target
```
***logfile_scan.sh*** parses he specified logging file. Available options:
>**ip** - from which ip were the most requests
<br/>**page** - the most requested page
<br/>**ipl** - requests number from each ip
<br/>**pz** - what non-existent pages were referred
<br/>**t** - what time did site get the most requests
<br/>**bot** - search bots accessed the site>

You need to specify the log file name as an argument:
```
$ ./logfile_scan.sh example_log.log
```
***backup_cron.sh*** is a data backup script that stores data from a target file or directory in the synced folder. In case of adding new or deleting old files, the script adds a corresponding entry to the log file indicating the time, type of operation and file name.

A data backup script that takes the following data as parameters:
1. Path to the syncing directory.
2. The path to the directory where the copies of the files will be stored.
```
$ ./backup_cron.sh <datadir> <backup_dir>
```
For adding command to run the script with a frequency of one minute to crontab you need to add the corresponding entry to the ***crontab*** as in the following example:
<br/><br/>![crontab](https://github.com/DevopsAutumn2022/EPAM-Cloud-DevOps-Fundamentals-Autumn-2022/blob/main/linux_bash/crontab.PNG))
