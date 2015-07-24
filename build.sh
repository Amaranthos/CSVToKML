#!/bin/bash
# dmd src/*.d -ofCSVtoKML
G:/Compilers/D/dmd2/windows/bin/dmd.exe src/*.d -ofCSVtoKML
rm -f CSVtoKML.obj
./CSVtoKML.exe