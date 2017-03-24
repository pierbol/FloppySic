#!/bin/bash
#Mount floppy disk
sudo mount /media/floppy0 
#Create directories
sudo mkdir ~/forensic/floppy$1
sudo mkdir ~/forensic/floppy$1/logs
#Make Md5
sudo md5sum /dev/fd0 > ~/forensic/floppy$1/logs/md5floppy$1.txt

#List files content
ls -lisa /media/floppy0 > ~/forensic/floppy$1/logs/lslisafloppy$1.txt
ls /media/floppy0 > ~/forensic/floppy$1/logs/lsfloppy$1.txt
#Make image file
sudo dc3dd if=/dev/fd0 of=~/forensic/floppy$1/forensic$1.iso log=~/forensic/floppy$1/logs/logsforensic$1Iso.log.txt 
#Make read only file
sudo mksquashfs ~/forensic/floppy$1/forensic$1.iso ~/forensic/floppy$1/floppy$1squashfs.gzip
#List of iso files
file ~/forensic/floppy$1/forensic$1.iso > ~/forensic/floppy$1/logs/logfile$1.txt
#Log fls
sudo fls ~/forensic/floppy$1/forensic$1.iso > ~/forensic/floppy$1/logs/logfls$1.txt
#Change directory
cd floppy$1
#acquire file E01
yes "" | sudo ewfacquire /dev/fd0 -D floppy$1 -e floppysic -C 1.1 -N floppy$1 -E $1 -D floppy$1 -t floppy$1 -l ~/forensic/floppy$1/logs/ewfacquire$1.txt -m removable -M physical -f encase6 -c deflate -o 0 -B 737280 -S 1.4 -P 512 -g 64 -b 64 -w
#List files and directories in disk image
sudo fls -r -m "/" -i ewf floppy$1.E01 >> ewf$1.txt
#Make timeline in csv format
sudo mactime -b ewf$1.txt -d > mactime$1.csv


#Search file .PAS 
#fls -r -F floppy2.E01 |grep .PAS

#Take back node 28 
#icat floppy2.E01 28 > test22.PAS
#return in main directory
sudo touch /home/floppysic/forensic/floppy$1/logs/comparmd5$1.txt
sudo cat /home/floppysic/forensic/floppy$1/logs/md5floppy$1.txt /home/floppysic/forensic/floppy$1/logs/ewfacquire$1.txt > /home/floppysic/forensic/floppy$1/logs/comparmd5$1.txt
cd ..

#unmount floppy
sudo umount /media/floppy0
