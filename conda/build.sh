#!/bin/bash
wget https://downloads.sourceforge.net/project/ta-lib/ta-lib/0.4.0/ta-lib-0.4.0-src.tar.gz &&
tar xvfz ta-lib-0.4.0-src.tar.gz &&
pushd ta-lib &&
./configure --prefix=/usr &&
sudo make &&
sudo make install &&
sudo ldconfig
popd &&
rm ta-lib-0.4.0-src.tar.gz &&
rm -r ta-lib &&

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib &&
export TA_INCLUDE_PATH=/usr/include &&
export TA_LIBRARY_PATH=/usr/lib &&
python setup.py build &&
python setup.py install --prefix=/usr
