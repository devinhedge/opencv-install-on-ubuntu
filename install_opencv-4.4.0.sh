#! /bin/bash
## Shell script that installs OpenCV 4.4.0 on Linux Mint
##
## Must be run with sudoers permissions
## e.g. $ sudo ./install_opencv-4.4.0.sh
##
## Note: It might buggy as I didn't to a lot of testing. Just a cut, paste, edit, and save.
##
mkdir opencv_install
cd opencv_install

apt-get update 
apt-get dist-upgrade
apt purge libx264-dev x264
apt-get install build-essential cmake pkg-config libjpeg8-dev libtiff5-dev libpng12-0 wget aria2c -y
apt install v4l-utils libv4l-dev libgphoto2-dev libgstreamer1.0-0 libgstreamer1.0-dev x264 -y

cd /usr/include/linux/
sudo ln -s -f ../libv4l1-videodev.h videodev.h
cd ~/opencv_install

sudo apt install libavcodec-dev libavformat-dev libswscale-dev libxvidcore-dev 
sudo apt install libgtk-3-dev libatlas-base-dev gfortran python3.6-dev python2.7-dev libtiff-dev

# Install pip

aria2c "https://bootstrap.pypa.io/get-pip.py"
sudo python3 get-pip.py

sudo pip install numpy
sudo pip3 install numpy

aria2c "https://github.com/opencv/opencv/arch..."
aria2c "https://github.com/opencv/opencv_cont..."

tar xvf opencv_contrib-4.4.0.tar.gz
 
mkdir opencv
cd opencv/
cp ../opencv-4.4.0.zip .
unzip opencv-4.4.0.zip
cd opencv-4.0.1/
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE -D WITH_V4L=ON -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_PYTHON_EXAMPLES=ON  -D INSTALL_C_EXAMPLES=OFF -D PYTHON_EXECUTABLE=/usr/bin/python3.6  -D BUILD_EXAMPLES=ON -D OPENCV_EXTRA_MODULES_PATH=../../../opencv_contrib-4.4.0/modules ..

make -j4
make
make install
ldconfig
