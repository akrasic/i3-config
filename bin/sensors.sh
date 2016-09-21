#!/bin/bash

#gpu_temp=$(sensors k10temp-pci-00c3 | awk '/temp1/ {print $2}' | sed 's/+//g')
#cpu_temp=$(sensors nct6776-isa-0290 | awk '/CPUTIN/ {print $2}' | sed 's/+//g')
#echo "${cpu_temp} ${gpu_temp}"
cputemp=$(sensors coretemp-isa-0000 | awk '/Physical id 0/ {print $4}')
echo $cputemp
