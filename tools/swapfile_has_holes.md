The **'swapfile has holes'-error** [SOLVED](https://bugs.archlinux.org/task/66921)

### STEP 1:
**create new temporary swap file with same size as existing one (e.g. 4GB)**<br/>
dd if=/dev/zero of=/swapfilenew bs=1M count=4096 status=progress<br/>
chmod 600 /swapfilenew && mkswap /swapfilenew && swapon /swapfilenew<br/>
<br/>
### STEP 2:
**turn off existing swapfile**<br/>
**this will take a while as existing swap data will be migrated to physical RAM and/or new swap file**<br/>
swapoff /swapfile<br/>
<br/>
### STEP 3:<br/>
**re-create /swapfile**<br/>
rm /swapfile && dd if=/dev/zero of=/swapfile bs=1M count=4096 status=progress<br/>
chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile<br/>
<br/>
### STEP 4:
**transfer the swap data back, if necessary and remove temporary swap file**<br/>
swapoff /swapfilenew && rm /swapfilenew<br/>