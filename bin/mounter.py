#!/usr/bin/env python

## { alterEGO Linux: "Open the vault of knowledge" } ----------------------- ##
##                                                                           ##
## mounter.py                                                                ##
##   created       : 2021-10-05 11:36:11 UTC                                 ##
##   updated       : 2021-10-05 11:36:19 UTC                                 ##
##   description   : mount and unmount utility.                              ##
## _________________________________________________________________________ ##

import os
import shlex
import subprocess

fzf_cmd = ['fzf',
           '--pointer=❯',
           '--prompt=SEARCH: ',
           '--no-hscroll',
           '-i',
           '--exact']

viewer = 'ls {} | less'

def run_fzf(_input):
    ##### TODO: Verify type of _input and convert to byte

    fzf = subprocess.run(fzf_cmd, input=_input, stdout=subprocess.PIPE)

    return fzf.stdout

def devices():
    _devices = subprocess.run(shlex.split(f"lsblk -Jp -o NAME,SIZE,FSTYPE,MOUNTPOINT,LABEL"), stdout=subprocess.PIPE)

    print(_devices.stdout)

devices()
                
## FIN _____________________________________________________________ ¯\_(ツ)_/¯
