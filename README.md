Dyros Internship  
============  


2020 7/1 ~ 8/31 summer vacation Internship program.    
<br/><br/>



> ### Automatically run when booting the joystick.    
> > + Switch to the root account.
```
su
```
<br/><br/>



>	> + Write a script 'auto_run.sh' to run the service.     
```
cd /etc/init.d/
vi xbox_auto.sh
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



>	> + Give permission.     
```
chmod 777 xbox_auto.sh
```     
<br/><br/>



>	> + Register service.     
```
update-rc.d xbox_auto.sh defaults
```     
<br/><br/>



>	> + Reboot and check.     
```
reboot
```
<br/><br/>


>	> + To connect the Android Smartphone with ROSCORE(Computer),     
```
Joystick Topic in app have to be edited to '/controller/android_command' 
```
<br/><br/>

