#!/usr/bin/env python

## { alterEGO Linux: "Open the vault of knowledge" } ----------------------- ##
##                                                                           ##
## mounter.py                                                                ##
##   created       : 2021-10-05 11:36:11 UTC                                 ##
##   updated       : 2021-10-07 11:20:12 UTC                                 ##
##   description   : mount and unmount utility.                              ##
## _________________________________________________________________________ ##

from collections import namedtuple
import json
import os
import shlex
import subprocess


def run_fzf(_input):

    fzf_cmd = ['fzf',
            '--pointer=❯',
            '--prompt=SEARCH: ',
            '--no-hscroll',
            '-i',
            '--exact']

    viewer = 'ls {} | less'

    ## >_ TODO: Verify type of _input and convert to byte

    fzf = subprocess.run(fzf_cmd, input=_input, stdout=subprocess.PIPE)

    return fzf.stdout

def devices():
    DEVICE = namedtuple('DEVICE', ['label', 'path', 'size', 'fstype', 'mountpoint'])
    DEVICES_LIST = []

    lsblk_devices = subprocess.run(shlex.split(f"lsblk -Jp -o NAME,SIZE,FSTYPE,MOUNTPOINT,LABEL"), stdout=subprocess.PIPE)

    data = json.loads(lsblk_devices.stdout.decode('UTF-8'))
    for d in data['blockdevices']:
        if d.get('children'):
            d_dict = d.get('children')[0]
            DEVICES_LIST.append(DEVICE(
                                    d_dict.get('label'),
                                    d_dict.get('name'),
                                    d_dict.get('size'),
                                    d_dict.get('fstype'),
                                    d_dict.get('mountpoint')
                                        ))
        else:
            DEVICES_LIST.append(DEVICE(
                                    d.get('label'),
                                    d.get('name'),
                                    d.get('size'),
                                    d.get('fstype'),
                                    d.get('mountpoint')
                                        ))

    EXCLUDED_DEVICES = ['/dev/sda1', '/dev/sr0']
    for device in DEVICES_LIST:
        if device.path in EXCLUDED_DEVICES:
            DEVICES_LIST.remove(device)

    return DEVICES_LIST

def to_mount(DEVICE_PROPERTIES):
    print(f"I will mount {DEVICE_PROPERTIES.label}")

def main():

    DEVICES = devices()

    DEVICES_SELECTION = ''.join([f"{d.label:<15}[ {d.size:<10}{d.path:<20}{d.fstype:<10}{d.mountpoint} ]\n" for d in DEVICES]).encode('UTF-8')

    CHOSEN_DEVICE = run_fzf(DEVICES_SELECTION).decode().split('[')[0].strip()

    DEVICE_PROPERTIES = [d for d in DEVICES if d.label == CHOSEN_DEVICE][0] 

    if DEVICE_PROPERTIES.mountpoint:
        print(f"{DEVICE_PROPERTIES.label} is already mounted...")
    else:
        to_mount(DEVICE_PROPERTIES)
    
if __name__ == '__main__':
    main()

## FIN _____________________________________________________________ ¯\_(ツ)_/¯
