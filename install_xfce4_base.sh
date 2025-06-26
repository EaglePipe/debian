!#/bin/bash
#Install xfce4 base system after minimal debian 12 install
sudo apt install nala -y
sudo nala install xfce4 xfce4-goodies blueman bluez-tools network-manager-gnome btop neofetch vim iptables curl extrepo firefox-esr flatpak fprintd libpam-fprintd libnetfilter-queue1 system-config-printer cups cups-browsed avahi-daemon papirus-icon-theme orage -y
sudo reboot
