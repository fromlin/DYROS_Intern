Dyros Internship  
============  


2020 7/1 ~ 8/31 summer vacation Internship program.    
<br/><br/>



> ### Automatically run when booting the joystick.    
>	> + Switch to the root account.
```
su
```
<br/>



>	> + Write a script 'auto_run.sh' to run the service.     
```
cd /etc/init.d/
vi xbox_auto.sh
```    
<br/>



>	> + Writing shell scripts.
> ex)
```
#! /bin/sh

### BEGIN INIT INFO
# Provides:          xboxrun
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     3 4 5
# Default-Stop:      0 1 2 6
# Short-Description: Example initscript
# Description:       This file should be used to construct scripts to be
#                    placed in /etc/init.d.
### END INIT INFO

export XBOX_HOME=/usr/share/doc/xboxdrv/examples/

case "$1" in
  start)
	xboxdrv --detach-kernel-driver --config $XBOX_HOME/default.xboxdrv
	exit 0
	;;
  stop)
	;;
  restart)
	$0 stop
	$0 start
	;;
  *)
	echo "Usage: xboxrun {start|stop|restart}" || true
	exit 1
esac
exit 0
```
<br/>



>	> + Give permission.     
```
chmod +x xboxrun.sh
```     
<br/>



>	> + Register service.     
```
update-rc.d xboxrun.sh defaults
```     
<br/>



>	> + Reboot and check.     
```
reboot
```
<br/>



----------
<br/><br/>
> ### To connect the Android Smartphone with ROSCORE(Computer),     
```
Joystick Topic in app have to be edited to '/controller/android_command' 
```
<br/>

