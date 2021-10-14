#!/usr/bin/env python

## { alterEGO Linux: "Open the vault of knowledge" } ----------------------- ##
##                                                                           ##
## /usr/local/bin/mounter.py                                                 ##
##   created       : 2021-10-05 11:36:11 UTC                                 ##
##   updated       : 2021-10-13 09:48:13 UTC                                 ##
##   description   : mount and unmount utility.                              ##
## _________________________________________________________________________ ##

from collections import namedtuple
import json
import os
import random
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

    ## ( GENERAL DEVICES )

    lsblk_devices = subprocess.run(shlex.split(f"lsblk -Jp -o NAME,SIZE,FSTYPE,MOUNTPOINT,LABEL"), stdout=subprocess.PIPE)

    data = json.loads(lsblk_devices.stdout.decode('UTF-8'))
    for d in data['blockdevices']:
        if d.get('children'):
            d_dict = d.get('children')[0]
            ## >_ Catching devices without labels.
            if d_dict.get('label') == None:
                _label = f"DEVICE{str(random.randint(0, 99999)).zfill(5)}"
            else:
                _label = d_dict.get('label') 
            DEVICES_LIST.append(DEVICE(
                                    _label,
                                    d_dict.get('name'),
                                    d_dict.get('size'),
                                    d_dict.get('fstype'),
                                    d_dict.get('mountpoint')
                                        ))
        else:
            ## >_ Catching devices without labels.
            if d_dict.get('label') == None:
                _label = f"DEVICE{str(random.randint(0, 99999)).zfill(5)}"
            else:
                _label = d_dict.get('label') 
            DEVICES_LIST.append(DEVICE(
                                    _label,
                                    d.get('name'),
                                    d.get('size'),
                                    d.get('fstype'),
                                    d.get('mountpoint')
                                        ))

    ## ( ANDROID DEVICES )

    android_devices = []
    ## >_ Find the special files in /dev (libmtp-*)
    for f in [ x for x in os.listdir('/dev/') if x.startswith('libmtp')]:
        _path = f"/dev/{f}"

        ## >_ Find the symlink of /dev/libmtp*
        _symlink = os.readlink(_path).split('/')

        ## >_ Build lsusb arguments like: `lsusb -s 003:011 -v` and run.
        _lsusb = subprocess.run(shlex.split(f"lsusb -s {_symlink[-2]}:{_symlink[-1]} -v"), stdout=subprocess.PIPE).stdout.decode('UTF-8').split('\n')

        ## >_ Build "label name"
        ## .. grep iManufacturer           1 HUAWEI
        ## ..      iProduct                2 MAR-LX3A
        for x in _lsusb:
            if 'iManufacturer' in x:
                _iManufacturer = x.split()[-1]
            if 'iProduct' in x:
                _iProduct = x.split()[-1]
        _label = f"{_iManufacturer}-{_iProduct}"

        DEVICES_LIST.append(DEVICE(
                                _label,
                                _path,
                                'UNK_SIZE',
                                "Android",
                                None
                                    ))

    ## >_ TODO Not really working...
    ## .. Either sr0 or sr1 shows up.
    EXCLUDED_DEVICES = ['/dev/sda1', '/dev/sr0', '/dev/sr1']
    for device in DEVICES_LIST:
        if device.path in EXCLUDED_DEVICES:
            DEVICES_LIST.remove(device)

    return DEVICES_LIST

def to_mount(DEVICE_PROPERTIES):
    print(f"I will mount {DEVICE_PROPERTIES.label}")

    MOUNTPOINT = f"/run/media/ghost/{DEVICE_PROPERTIES.label}"
    if not os.path.isdir(MOUNTPOINT):
        os.makedirs(MOUNTPOINT)

    if DEVICE_PROPERTIES.fstype == "ntfs":
        subprocess.run(shlex.split(f"sudo ntfs-3g {DEVICE_PROPERTIES.path} \"{MOUNTPOINT}\" -o uid=1000,gid=1000,utf8,dmask=027,fmask=137"))
    elif DEVICE_PROPERTIES.fstype == "Android":
        subprocess.run(shlex.split(f"simple-mtpfs {DEVICE_PROPERTIES.path} \"{MOUNTPOINT}\" -o allow_other"))
    else:
        subprocess.run(shlex.split(f"sudo mount -t auto {DEVICE_PROPERTIES.path} \"{MOUNTPOINT}\" -o uid=1000,gid=1000,utf8,dmask=027,fmask=137"))

def main():

    DEVICES = devices()

    for d in DEVICES:
        print(d)

    DEVICES_SELECTION = ''.join([f"{d.label:<15}[ {d.size:<10}{d.path:<20}{d.fstype:<10}{d.mountpoint} ]\n" for d in DEVICES]).encode('UTF-8')

    CHOSEN_DEVICE = run_fzf(DEVICES_SELECTION).decode().split('[')[0].strip()

    DEVICE_PROPERTIES = [d for d in DEVICES if d.label == CHOSEN_DEVICE][0] 

    if DEVICE_PROPERTIES.mountpoint:
        print(f"{DEVICE_PROPERTIES.label} is already mounted...")
    else:
        to_mount(DEVICE_PROPERTIES)
    
if __name__ == '__main__':
    main()

## [ TODO ] ---------------------------------------------------------------- ##

    ## - Unmount everything if mounted and delete directories.

## FIN _____________________________________________________________ ¯\_(ツ)_/¯
