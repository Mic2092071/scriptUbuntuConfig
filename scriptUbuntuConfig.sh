#!/bin/bash

apt update && apt upgrade -y

apt install terminator -y
apt install neofetch -y
apt install htop -y
apt install code -y 

apt install wget curl git vim neovim -y
systemctl enable ssh

git config --global user.name "Mic2092071"
git config --global user.email "Michael.p95@hotmail.com"

apt install zsh -y
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/Downloads/

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/Downloads/

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/Downloads/

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/Downloads/

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc


curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker $USER


curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose


snap install microk8s --classic

microk8s status --wait-ready

microk8s enable dashboard dns registry istio

apt install gnome-tweaks
apt install gnome-shell-extensions

mkdir ~/.themes

curl -L "https://www.gnome-look.org/dl?file_id=1646836477&file_type=application/x-gzip&file_name=Midnight-Blue.tar.gz&file_size=1106210&has_torrent=0&project_id=1273208&link_type=download&is_external=false&external_link=null" -o ~/.themes

tar -xf ~/.themes/Midnight-Blue.tar.gz -C ~/.themes


sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
/GRUB_CMDLINE_LINUX_DEFAULT=""
/' /etc/default/grub

mkdir ~/Dev

update-grub

