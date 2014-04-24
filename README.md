Meka Cmake Modules 

mkdir build; cd build
cmake ..
sudo make install

or cmake .. -DOVERWRITE=1 to overwrite existing files

/!\ WARNING : the files are (for now) installed in ${CMAKE_ROOT}/Modules

TODO : use a proper directory



