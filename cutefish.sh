#!/bin/bash
sudo apt install -y git devscripts build-essential cmake ninja-build
sudo apt install -y qtbase5-dev qtquickcontrols2-5-dev libkf5networkmanagerqt-dev modemmanager-qt-dev debhelper extra-cmake-modules libkf5kio-dev libkf5screen-dev libqt5sensors5-dev qtdeclarative5-dev qttools5-dev qttools5-dev-tools libxcb-icccm4-dev qtbase5-private-dev kwin-dev libkdecorations2-dev libqt5xdg-dev libdbusmenu-qt5-dev libxcb-ewmh-dev libicu-dev libxcb-randr0-dev libsm-dev libxcb-xfixes0-dev libxcb-damage0-dev libxcb-composite0-dev libxcb-shm0-dev libxcb-util-dev libxcb-image0-dev libxtst-dev libpulse-dev libpolkit-qt5-1-dev libpolkit-agent-1-dev libqt5x11extras5-dev qml-module-qtquick2 qml-module-qtquick-controls2 libkf5bluezqt-dev libkf5bluezqt-dev libqt5opengl5-dev libxcursor-dev

mkdir -p ~/Downloads/cutefish
cd ~/Downloads/cutefish

git clone https://github.com/cutefishos/libcutefish --branch=0.2
cd libcutefish
dpkg-buildpackage -uc -us -b

cd ~/Downloads/cutefish
git clone https://github.com/cutefishos/fishui --branch=0.3
cd fishui
dpkg-buildpackage -uc -us -b

cd ~/Downloads/cutefish
git clone https://github.com/cutefishos/kwin-plugins --branch=0.3
cd kwin-plugins
dpkg-buildpackage -uc -us -b

cd ~/Downloads/cutefish
git clone https://github.com/cutefishos/launcher --branch=0.3
cd launcher
dpkg-buildpackage -uc -us -b

cd ~/Downloads/cutefish
git clone https://github.com/cutefishos/qt-plugins --branch=0.3
cd qt-plugins
dpkg-buildpackage -uc -us -b

cd ~/Downloads/cutefish
git clone https://github.com/cutefishos/wallpapers --branch=0.2
cd wallpapers
dpkg-buildpackage -uc -us -b

cd ~/Downloads/cutefish
sudo apt-get install -y ./*.deb

cd ~/Downloads/cutefish
git clone https://github.com/cutefishos/dock --branch=0.3
cd dock
dpkg-buildpackage -uc -us -b

cd ~/Downloads/cutefish
git clone https://github.com/cutefishos/filemanager --branch=0.3
cd filemanager
dpkg-buildpackage -uc -us -b

cd ~/Downloads/cutefish
git clone https://github.com/cutefishos/settings --branch=0.3
cd settings
dpkg-buildpackage -uc -us -b

cd ~/Downloads/cutefish
git clone https://github.com/cutefishos/statusbar --branch=0.3
cd statusbar
dpkg-buildpackage -uc -us -b

cd ~/Downloads/cutefish
git clone https://github.com/cutefishos/core --branch=0.3
cd core
dpkg-buildpackage -uc -us -b

cd ~/Downloads/cutefish
sudo apt-get install -y ./*.deb

## no debian directory
cd ~/Downloads/cutefish
git clone https://github.com/cutefishos/calculator --branch=0.3
cd calculator
mkdir build
cd build
cmake ..
make
sudo make install

## no debian directory
cd ~/Downloads/cutefish
git clone https://github.com/cutefishos/icons --branch=0.3
cd icons
mkdir build
cd build
cmake ..
make
sudo make install
