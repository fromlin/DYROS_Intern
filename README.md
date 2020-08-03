Dyros Internship  
============  


2020 7/1 ~ 8/31 summer vacation Internship program.    
<br/><br/>



> ### Automatically run when booting the joystick.    
>	> + Write a script 'auto_run.sh' to run the service.     
```
cd /etc/init.d/
vi auto_run.sh
```     
<br/><br/>



>	> + Give permission.     
```
chmod 777 auto_run.sh
```     
<br/><br/>



> > + Writing shell scripts.
> ex)
```
#! /bin/bash
sudo xboxdrv --silent
exit 0
```
<br/><br/>



>	> + Register service.     
```
update-rc.d auto_run.sh defaults
```     
<br/><br/>



>	> + Reboot and check.     
```
reboot
```
<br/><br/>

