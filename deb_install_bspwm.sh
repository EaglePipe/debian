!#/bin/bash
#Installscript BSPWM for minimal debian 12 install

#Install nala
sudo apt install nala -y

sudo nala install xorg xorg-dev xbacklight xbindkeys xvkbd xinput build-essential xdotool libnotify-bin libnotify-dev lxappearance bspwm sxhkd polybar picom dunst nitrogen rofi network-manager-gnome firefox-esr flatpak tlp vim btop neofetch fprintd libpam-fprintd wireguard-tools curl xfce4-power-manager thunar thunar-archive-plugin thunar-volman gvfs-backends dialog mtools smbclient cifs-utils ripgrep fd-find unzip pavucontrol pulsemixer pamixer pipewire-audio acpi acpid qimgv xdg-user-dirs-gtk fonts-recommended fonts-font-awesome fonts-terminus papirus-icon-theme blueman tlp arandr bluez-tools cups cups-browsed avahi-daemon libreoffice system-config-printer keepassxc libreoffice-l10n-de iptables libnetfilter-queue1 preload geany materia-gtk-theme elementary-xfce-icon-theme fonts-noto catfish libavcodec-extra vlc pamixer flameshot i3lock xfce4-terminal bibata-cursor-theme -y

#Create Config Folders
mkdir ~/.confg/
mkdir ~/.config/bspwm/ 
mkdir ~/.config/sxhkd/
mkdir ~/.config/polybar/ 
mkdir ~/.config/picom/
mkdir ~/.config/dunst/
mkdir ~/Screenshots/

#Copy Dunst Config
sudo cp /etc/dunst/dunstrc ~/.config/dunst/

#Enable Daemons
sudo systemctl enable tlp --now
sudo systemctl enable avahi-daemon --now
sudo systemctl enable acpid --now

#Install Thinkpad T15 Audiofix
sudo touch /etc/modprobe.d/dsp-fix.conf
sudo chmod 777 /etc/modprobe.d/dsp-fix.conf
sudo echo "options snd_intel_dspcfg dsp_driver=1" > /etc/modprobe.d/dsp-fix.conf


#Install Brave Browser
curl -fsS https://dl.brave.com/install.sh | sh

#Add Flathub Repo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#Install Flatpaks
flatpak install flathub com.nextcloud.desktopclient.nextcloud -y
flatpak install flathub org.keepassxc.KeePassXC -y
flatpak install flathub eu.betterbird.Betterbird -y

cp ./bspwm/ ~/.config/
cp ./sxhkd/ ~/.config/
cp ./polybar/ ~/.config/
chmod +x ~/.config/bspwm/ -R
chmod +x ~/.config/sxhkd/ -R
chmod +x ~/.config/polybar/ -R 
