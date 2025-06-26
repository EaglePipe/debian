!#/bin/bash
sudo apt install extrepo -y
sudo extrepo enable librewolf
sudo apt update && sudo apt install librewolf -y

# when using keepassxc browser addon  add ~/.librewolf/native-messaging-hosts
