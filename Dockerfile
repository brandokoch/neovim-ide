#
# Choose your own base image
#
FROM ubuntu:20.04 

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV TERM=xterm-256color
ARG DEBIAN_FRONTEND=noninteractive

#
# NeoVim Dependencies 
#
RUN apt update && apt-get update
RUN apt-get install -y git ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

# Install neovim 
WORKDIR /root
RUN git clone https://github.com/neovim/neovim.git
WORKDIR /root/neovim
RUN git checkout release-0.8
RUN make CMAKE_BUILD_TYPE=Release
RUN make install

# Install custom configuration 
WORKDIR /root
RUN git clone https://github.com/bkoch4142/neovim-custom ~/.config/nvim

RUN apt install -y xsel wl-clipboard ripgrep python3-pip npm
RUN pip install pynvim

# Icons support
RUN git clone https://github.com/ronniedroid/getnf.git
WORKDIR getnf
RUN ./install.sh

# Latex
RUN apt-get install -y texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra texlive-publishers latexmk

#
# Add below your other dependency layers...
#
WORKDIR /workspace
