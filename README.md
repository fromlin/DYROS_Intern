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
#! /bin/sh

### BEGIN INIT INFO
# Provides:          xboxrun
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Example initscript
# Description:       Auto connect xboxdrv
#                    placed in /etc/init.d.
### END INIT INFO

case "$1" in
  start)
	xboxdrv --config /usr/share/doc/xboxdrv/examples/default.xboxdrv
	;;
  stop)
	;;
  restart)
	$0 stop
	sleep 1
	$0 start
	;;
  *)
	echo "Usage: xboxrun {start|stop|restart|status}" || true
	exit 1
esac

exit 0
```
<br/><br/>



>	> + Give permission.     
```
chmod +x xboxrun.sh
```     
<br/><br/>



>	> + Register service.     
```
update-rc.d xboxrun.sh defaults
```     
<br/><br/>



>	> + Reboot and check.     
```
reboot
```
<br/><br/>

-----------------

>	> + To connect the Android Smartphone with ROSCORE(Computer),     
```
Joystick Topic in app have to be edited to '/controller/android_command' 
```
<br/><br/>

