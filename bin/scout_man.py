#!/usr/bin/env python
#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# scout_man.py
#   created        : 2021-04-18 16:03:58 UTC
#   updated        : 2021-04-18 16:04:03 UTC
#   description    : Search man pages.
#------------------------------------------------------------------------------

import subprocess

viewer = 'man {1} | less'

manpages = subprocess.Popen(['man', '-k', ''], stdout=subprocess.PIPE)

fzf = subprocess.Popen(
                ['fzf',
                 '--no-hscroll',
                 '-i',
                 '--exact',
                 '--preview-window=down:80%',
                 '--preview', viewer], stdin=manpages.stdout, stdout=subprocess.PIPE)

for result in fzf.stdout:
    result = result.decode('UTF-8').split('- ')[0].strip()
    man_page = result.replace(')', '').split(' (') 
    man = f'man {man_page[1]} {man_page[0]} | less'
    subprocess.run(man, shell=True)

#--{ file:fin }----------------------------------------------------------------
