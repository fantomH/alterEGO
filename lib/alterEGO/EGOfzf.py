#!/usr/bin/env python

## { alterEGO Linux: "Open the vault of knowledge" } ----------------------- ##
##                                                                           ##
## ego-fzf.py                                                                ##
##   created       : 2021-10-04 11:22:03 UTC                                 ##
##   updated       : 2021-10-04 11:22:11 UTC                                 ##
##   description   : FZF related                                             ##
## _________________________________________________________________________ ##

import subprocess

fzf_url = 'https://github.com/junegunn/fzf'

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

## FIN _____________________________________________________________ ¯\_(ツ)_/¯
