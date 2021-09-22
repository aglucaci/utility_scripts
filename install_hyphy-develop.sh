#!/bin/bash
#Last update 09-22-2021

#Download and install HyPhy
git clone --branch develop https://github.com/veg/hyphy.git hyphy-develop

cd hyphy-develop

# Locally
#cmake ./

# For silverback
#cmake . -DNOAVX=ON
cmake -DCMAKE_INSTALL_PREFIX:PATH=/home/aglucaci/hyphy-develop -DNOAVX=ON .

# Local version not mpi enabled
make -j MP

# for silverback
make -j MPI

# Finally
make install

#Tests
make test

# Download hyphy standalone analyses
# if they don't exist
cd ..
git clone https://github.com/veg/hyphy-analyses.git

#End of file




