#!/bin/bash
#Last update 10-04-2020

#Download and install HyPhy
git clone --branch develop https://github.com/veg/hyphy.git hyphy-develop

cd hyphy-develop

# locally
#cmake ./

# for silverback
#cmake . -DNOAVX=ON
cmake -DCMAKE_INSTALL_PREFIX:PATH=/home/aglucaci/hyphy-develop -DNOAVX=ON .

#local
make -j MP

# for silverback
make -j MPI

# Finally
make install

#Tests
make test

#Download hyphy standalone analyses
cd ..
git clone https://github.com/veg/hyphy-analyses.git

#End of file



