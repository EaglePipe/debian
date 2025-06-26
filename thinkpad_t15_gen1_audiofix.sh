#!/bin/bash
sudo touch /etc/modprobe.d/dsp-fix.conf
sudo chmod 777 /etc/modprobe.d/dsp-fix.conf
sudo echo "options snd_intel_dspcfg dsp_driver=1" > /etc/modprobe.d/dsp-fix.conf
