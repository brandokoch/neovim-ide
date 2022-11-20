# Installation
```
apt update
apt-get update

apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.8
make CMAKE_BUILD_TYPE=Release
sudo make install

git clone https://github.com/LunarVim/nvim-basic-ide.git ~/.config/nvim

apt install xsel # for X11
apt install wl-clipboard # for wayland
pip install pynvim
apt install ripgrep

sudo apt-get install fzf

git clone https://github.com/ronniedroid/getnf.git
cd getnf
./install.sh
```
