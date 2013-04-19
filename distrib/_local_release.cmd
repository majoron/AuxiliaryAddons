@echo off

Rem: set path 
SET PATH=C:/Binutils/apache-ant-1.7.0/bin/;%PATH%
SET PATH=D:/Binutils/apache-ant-1.7.0/bin/;%PATH%

Rem: set enviroment and release gem
cd ./..
gem release
cd ./distrib

