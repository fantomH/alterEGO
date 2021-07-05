#!/usr/bin/env python
#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# scout_pymodules.py
#   created        : 2021-04-18 13:53:49 UTC
#   updated        : 2021-07-05 11:02:20 UTC
#   description    : Search Python modules.
#------------------------------------------------------------------------------

import pkgutil
import subprocess

viewer = 'python -m pydoc {1} | less'
selection = ''

for mod in pkgutil.iter_modules():
    _name = mod.name
    _path = mod.module_finder.path

    if _name != 'antigravity':
        selection = selection + f'{_name:<50}{_path}\n'

echo = subprocess.Popen(['printf', selection], stdout=subprocess.PIPE)
fzf = subprocess.Popen(
                ['fzf',
                 '--no-hscroll',
                 '-i',
                 '--exact',
                 '--preview-window=down:80%',
                 '--preview', viewer], stdin=echo.stdout, stdout=subprocess.PIPE)

for result in fzf.stdout:
    result = result.decode('UTF-8').split()[0].strip()
    subprocess.run(f"python -m pydoc {result} | less", shell=True)

#--{ file:FIN }----------------------------------------------------------------
