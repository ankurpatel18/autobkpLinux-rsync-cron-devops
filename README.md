# Automatic backup of your www folder in linux machine using  rsync and cron
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/a1d01c8bec0d45049dbc069397731c30)](https://app.codacy.com/app/ankurpatel18/autobkpLinux-rsync-cron-devops?utm_source=github.com&utm_medium=referral&utm_content=ankurpatel18/autobkpLinux-rsync-cron-devops&utm_campaign=Badge_Grade_Dashboard)
[![CodeFactor](https://www.codefactor.io/repository/github/ankurpatel18/autobkplinux-rsync-cron-devops/badge)](https://www.codefactor.io/repository/github/ankurpatel18/autobkplinux-rsync-cron-devops)

Dev Ops Foundation Project - For Linux auto backup using rsync and cron


download my project using 
  https://github.com/ankurpatel18/autobkpLinux-rsync-cron-devops.git
  

1) create folder using 

        mkdir -p ~/wwwbkp/rsync/

   Which will create nested directory on your root folder, named wwwbkp(inside root) and rsync(inside wwwbkp)


2) copy backup.sh file to your home directory, Which has below code 
  
        #!/bin/bash
        rsync  -avz  /var/www/  ~/wwwbkp/rsync/ > /dev/null // sync your www directotry to your homefolder/wwwbkp/rsync directory
        tar -cvjf ~/wwwbkp/daily_$(date +%Y%m%d%H%M).tar.bz2 -P  ~/wwwbkp/rsync/ > /dev/null // tar your rsync content and added zip name with date in format of yyyymmddhhmm 
 
3) edit /etc/crontab file, open using below command 

        vi /etc/crontab   
      or  
        
        crontab -e
      then schedule the execution of backup script
         
         30 22 * * * bash  ~/backup.sh  // Command will excute backup.sh file automatically every day at 10:30 PM by cron. 
         
     Then save and exit from file.
  
 4) restart cron service using below command 
        
        sudo service cron reload 
        
  
