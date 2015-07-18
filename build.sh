#!/bin/bash
dmd src/*.d -ofCSVtoKML
rm -f CSVtoKML.obj
./CSVtoKML.exe