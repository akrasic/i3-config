#!/bin/bash

gpu_temp=$(sensors k10temp-pci-00c3 | awk '/temp1/ {print $2}')
cpu_temp=$(sensors nct6776-isa-0290 | awk '/CPUTIN/ {print $2}')
echo "${cpu_temp}|${gpu_temp}"
