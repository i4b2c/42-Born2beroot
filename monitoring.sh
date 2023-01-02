#!/bin/bash
arch=$(uname -a)
CPU=$(grep -c "physical id" /proc/cpuinfo)
VCPU=$(grep -c "processor" /proc/cpuinfo)
Mem_usage=$(free -m | grep "Mem:" | awk '{print $3}')
Mem_total=$(free -m | grep "Mem:" | awk '{print $2}')
Mem_perc=$(free -m | grep "Mem:" | awk '{a = $2} {b = $3} {printf("%.2f%%"),(b/a)*100}')
Disk_usage=$(df -Bm -T| grep ext4 | awk '{a += $4} END {print a}')
Disk_total=$(df -Bg -T | grep ext4 | awk '{b += $3} END {print b}')
Disk_perc=$(df -Bm -T | grep ext4 | awk '{a += $4} {b += $3} END {printf("%d%%"),(a/b)*100}')
CPU_load=$(top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}')
Data_boot=$(who -b | awk '{print $3}')
Hora_boot=$(who -b | awk '{print $4}')
LVM_us=$(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)
Con=$(ss -ta | grep ESTAB | wc -l)
User=$(users | wc -l)
IP=$(hostname -I)
IP_MAC=$(ip link | grep "link/ether" | awk '{print $2}')
Sudo=$(journalctl _COMM=sudo | grep COMMAND | wc -l)
wall "  #Architecture: $arch
        #CPU physical : $CPU
        #vCPU : $VCPU
        #Memory Usage: $Mem_usage/${Mem_total}MB (${Mem_perc})
        #Disk Usage: $Disk_usage/${Disk_total}Gb (${Disk_perc})
        #CPU load: $CPU_load
        #Last boot: $Data_boot $Hora_boot
        #LVM use : $LVM_us
        #Connections TCP : $Con ESTABLISHED
        #User Log: $User
        #Network: $IP ($IP_MAC)
        #Sudo : $Sudo cmd
        "
