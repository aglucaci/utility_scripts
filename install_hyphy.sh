#!/bin/bash
#Last update 09-22-2021

#Download and install HyPhy
git clone https://github.com/veg/hyphy.git hyphy

cd hyphy

# local version
#cmake ./

# For silverback
#cmake . -DNOAVX=ON
cmake -DCMAKE_INSTALL_PREFIX:PATH=/home/aglucaci/hyphy -DNOAVX=ON .

# local version, not mpi enabled
make -j MP

# for silverback
make -j MPI

# Finally
make install

# Tests
make test

#Download hyphy standalone analyses
cd ..

# conditional statement here? it will just fail if hyphy-analyses is present
# so thats fine.
git clone https://github.com/veg/hyphy-analyses.git

#End of file




