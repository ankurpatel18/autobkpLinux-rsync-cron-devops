#!/bin/bash
rsync  -avz  /var/www/  ~/wwwbkp/rsync/ > /dev/null
tar -cvjf ~/wwwbkp/daily_$(date +%Y%m%d%H%M).tar.bz2 -P  ~/wwwbkp/rsync/ > /dev/null
