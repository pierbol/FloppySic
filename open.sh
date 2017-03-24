#!/bin/bash
sudo mount /media/floppy0 
sudo dc3dd if=/dev/fd0 of=~/forensic$1.iso log=forensic$1.log.txt 
sudo umount /media/floppy0
