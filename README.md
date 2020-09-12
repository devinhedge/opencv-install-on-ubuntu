# Install OpenCV 4 with Python 3 on Ubuntu 18.04, Linux Mint 19.

This repository is just a cut a paste of the instructions for installing OpenCV on Linux Mint (flavor of Unbuntu) from a realy straight forward [YouTube video](https://youtu.be/FDjsLK9M6Sc). If you find a bug, let me know and I'll address it.

## Commands:

``` mkdir ~/opencv_install
cd opencv_install

sudo apt-get update 
sudo apt-get dist-upgrade
sudo apt purge libx264-dev x264
sudo apt-get install build-essential cmake pkg-config libjpeg8-dev libtiff5-dev libpng12-0 wget aria2c -y
sudo apt install v4l-utils libv4l-dev libgphoto2-dev libgstreamer1.0-0 libgstreamer1.0-dev x264 -y

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

aria2c "https://github.com/opencv/opencv/archive/4.4.0.zip"
aria2c "https://github.com/opencv/opencv_contrib/archive/opencv_contrib-4.4.0.tar.gz"

tar xvf opencv_contrib-4.4.0.tar.gz
 
mkdir opencv
cd opencv/
cp ../4.4.0.zip .
unzip 4.4.0.zip
cd opencv-4.4.0/
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE -D WITH_V4L=ON -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_PYTHON_EXAMPLES=ON  -D INSTALL_C_EXAMPLES=OFF -D PYTHON_EXECUTABLE=/usr/bin/python3.6  -D BUILD_EXAMPLES=ON -D OPENCV_EXTRA_MODULES_PATH=../../../opencv_contrib-4.4.0/modules ..

make -j4
make
sudo make install
sudo ldconfig
```
# Testing the build

Now you can test the build from the Python Live interpreter shell.

```
python3.6
>>> import cv2
>>> cv2.__version__
```
This should return the following:
```
'4.4.0'
```

Alternatively you can clone this repository or copy down the Python script 'test_opencv.py' and just execute the folowing:

```
python3 test_opencv.py
'''

You are now ready to use OpenCV.

Enjoy!
