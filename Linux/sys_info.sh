#!/bin/bash
outfile=$HOME/research/sys_info.txt
if [ $UID -ne 0 ]
then
       echo "Please run this as root"
       exit
fi
if [ ! -d $HOME/research ]
then
       echo "creating research directory .."
       mkdir $HOME/research
fi
if [ -f $HOME/research/sys_info.txt ]
then
       rm $outfile
fi  
echo "################################" > "$outfile"
echo "a quick system audit script" > "$outfile"
echo "Todays Date is: $(date)" >> "$outfile"
echo "Machine type info: $MACHTYPE" >> "$outfile"
echo "Uname info: $(uname -a)" >> "$outfile"

ip_addr=$(hostname -I |awk '{print $1}')
echo "My ethernet IP is: $ip_addr" >> "$oufile"
echo "all 777 files in user's home directories.." >> "$outfile"
execs=$(find /home -type f -perm 777 -print)
echo $execs >> "$outfile"
echo "top processes.." >> "$outfile"
ps aux --sort -%mem | awk '{print $1,$2,$5,$6}' >> "$outfile"
echo "################################"  >> "$outfile"

