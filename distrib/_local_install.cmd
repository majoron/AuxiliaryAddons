@echo off

Rem: set path 
SET PATH=C:/Binutils/apache-ant-1.7.0/bin/;%PATH%
SET PATH=D:/Binutils/apache-ant-1.7.0/bin/;%PATH%

echo on
Rem: set enviroment and execute ant script
gem install ./output/auxiliary_addons-0.5.7.gem --local
rem gem uninstall auxiliary_addons
rem rem gem list --local

