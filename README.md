# Born2beroot

## How to configure
If you need help to configure the Born2beroot use this repository : https://github.com/gemartin99/Born2beroot-Tutorial

## Monitoring
The tutorial will help in everything or almost everything, the **monitoring.sh** from tutorial is incorrect,
because the croontab is configured ``*/10 * * * *`` and this will execute the **monitoring.sh** each 10 minutes from the computer
thats it, if the Virtual Machine start at 9:15 it will execute at 9:20 instead of 9:25, the monitoring.sh in my repository does it every 10 minutes
I just use a ``do while`` on the shell script
And in the **croontab** I use ``@reboot /usr/local/bin/monitoring`` instead ``*/10 * * * * /usr/local/bin/monitoring.sh``
