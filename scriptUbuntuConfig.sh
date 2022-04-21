#!/bin/bash
USER_HOME=$(eval echo ~${SUDO_USER})

cecho() {
        local code="\033["
        case "$1" in
                black  | bk) color="${code}0;30m";;
                red    |  r) color="${code}1;31m";;
                green  |  g) color="${code}1;32m";;
                yellow |  y) color="${code}1;33m";;
                blue   |  b) color="${code}1;34m";;
                purple |  p) color="${code}1;35m";;
                cyan   |  c) color="${code}1;36m";;
                gray   | gr) color="${code}0;37m";;
                *) local text="$1"
        esac
        [ -z "$text" ] && local text="$color$2${code}0m"
        echo -e "$text"
}

apt update && apt upgrade -y

apt install terminator -y
apt install neofetch -y
apt install htop -y
apt install code -y

apt install wget curl git ssh vim neovim -y
systemctl enable ssh

git config --global user.name "Mic2092071"
git config --global user.email "Michael.p95@hotmail.com"



curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker $USER


curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose


snap install microk8s --classic

microk8s status --wait-ready

microk8s enable dashboard dns registry istio

#apt-get install -y apt-transport-https ca-certificates curl
#curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
#echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernet>
#apt-get update
#apt-get install -y kubectl

snap install kubectl --classic


apt install gnome-tweaks -y
apt install gnome-shell-extensions -y

#mkdir -p $USER_HOME/.themes

wget "https://github.com/i-mint/midnight/archive/refs/heads/master.zip"

unzip $USER_HOME/master.zip -d $USER_HOME/

mv $USER_HOME/midnight-master $USER_HOME/.themes

sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
/GRUB_CMDLINE_LINUX_DEFAULT=""
/' /etc/default/grub

mkdir -p $USER_HOME/Dev

update-grub

apt install zsh -y
sleep 5
#sudo -u $USER zsh

sudo -u $USER sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo -u $USER wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P $USER_HOME/Downloads/

sudo -u $USER wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P $USER_HOME/Downloads/

sudo -u $USER wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P $USER_HOME/Downloads/

sudo -u $USER wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P $USER_HOME/Downloads/

sleep 5

cp $USER_HOME/Downloads/*.ttf /usr/share/fonts/truetype/ && fc-cache -f -v

sudo -u $USER git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $USER_HOME/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> $USER_HOME/.zshrc

sleep 5

mkdir -p $USER_HOME/.config/terminator
touch $USER_HOME/.config/terminator/config

cat > $USER_HOME/.config/terminator/config <<EOF
[global_config]
  title_transmit_bg_color = "#0503b0"
  title_receive_bg_color = "#0503b0"
[keybindings]
[profiles]
  [[default]]
    background_color = "#080a0b"
    cursor_color = "#aaaaaa"
    font = Monospace Bold Italic 13
    foreground_color = "#a6c4de"
    palette = "#2e3436:#cc0000:#4e9a06:#c4a000:#00089e:#75507b:#06989a:#888a85:#555753:#ef2929:#8ae234:#fce94f:#729fcf:#ad7fa8:#34e2e2:#eeeeec"
    use_system_font = False
[layouts]
  [[default]]
    [[[window0]]]
      type = Window
      parent = ""
      size = 751, 555
    [[[child1]]]
      type = Terminal
      parent = window0
      profile = default
[plugins]

EOF

#sudo -u $USER chsh -s user/bin/zsh $USER
#sed -i 's|'"$USER"':x:1000:1000:'"$USER"',,,:/home/'"$USER"':/bin/bash|'"$USER"':x:1000:1000:'"$USER"',,,:/home/'"$USER"':/usr/bin/zsh|' /etc/passwd
#sudo -u $USER bash -c 'chsh -s $(which zsh)'

#chown -R $USER:$USER $USER_HOME/powerlevel10k/
#chown -R $USER:$USER $USER_HOME/.zshrc

source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
echo "[[ $commands[kubectl] ]] && source <(kubectl completion zsh)" >> ~/.zshrc # add autocomplete permanently to your zsh shell


cecho g "Pour terminer l'installation, executer les commandes suivantes: "
cecho r "chsh -s $(which zsh)"
cecho r "sudo chown -R $USER:$USER powerlevel10k/"
cecho r "chown -R $USER:$USER .zshrc"
cecho b  "Ensuite fermer le terminal et le reouvrir ou ouvrir terminator pour completer l'installation."



