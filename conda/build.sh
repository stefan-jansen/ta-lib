#!/bin/bash
wget https://downloads.sourceforge.net/project/ta-lib/ta-lib/0.4.0/ta-lib-0.4.0-src.tar.gz &&
echo "Extracting ta-lib-0.4.0-src.tar.gz" &&
tar xvfz ta-lib-0.4.0-src.tar.gz &&
echo "Installing deps" &&
sudo apt-get install gcc-multilib g++-multilib &&
echo "list pwd" &&
ls &&
ls ta-lib &&
pushd ta-lib &&
echo "configure" &&
./configure --prefix=/usr &&
echo "make" &&
sudo make &&
echo "make install" &&
sudo make install &&
echo "ldconfig" &&
sudo ldconfig
popd &&
rm ta-lib-0.4.0-src.tar.gz &&
rm -r ta-lib &&

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib &&
export TA_INCLUDE_PATH=/usr/include &&
export TA_LIBRARY_PATH=/usr/lib &&
python setup.py build &&
python setup.py install --prefix=/usr
