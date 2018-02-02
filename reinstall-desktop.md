A recollection of what I did to reinstall my destkop Arch system.

# Create a user

groupadd user
useradd -m -g user -s /bin/zsh user
passwd user

# Install basics

- Install awesome and git
- Install zsh
- Install openssh
- Install vim
- Install python, python-pip

# Setup sudo

pacman -S sudo
visudo

Uncomment this line:

%wheel ALL=(ALL) ALL

Add user to group wheel:

usermod -a -G wheel user

# Log in as user

su -  user

# Build SSH Key

If not copying from somewhere else, generate:

ssh-keygen -t rsa -b 4096 -C user@barbacode.prealfa.com

Add the key as deployable. If need to SSH in to copy, do:

systemctl start sshd

# Install oh-my-zsh

Run:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

Then remove .zshrc as we will apply our dotfiles on top.

# Deploy dotfiles

in $HOME:

git clone https://github.com/adlpz/.dotfiles
cd .dotfiles
./install/install.sh

Log out and in to get all refreshed.

# Set up VIM

If not include in the dotfiles (not as of this writing)

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install PulseAudio

pacman -S pulseaudio pavucontrol
pulseaudio --start

# Install X11 Stuff

- Install xorg, all package and default settings
- Install xorg-xinit
- Install rxvt-unicode
- Install xcape, xbindkeys, compton

# Set up Awesome WM

Awesome now expects config in .config/awesome. Link.

mkdir /home/user/.config
ln -s home/user/.awesome /home/user/.config/awesome

Clone needed deps inside the Awesome config

git clone https://github.com/lcpz/lain .awesome/lain/

Install proper fonts, e.g. as of writing, ttf-dejavu

Install volumecontrol script:

mkdir ~/tools && cd ~/tools && git clone http://github.com/adlpz/volumecontrol
cd volumecontrol && sudo pip install -r requirements.txt

Install generic scripts:

git clone https://github.com/adlpz/system-scripts/ ~/scripts

# Install common utils

- Firefox (firefox-developer from AUR)
