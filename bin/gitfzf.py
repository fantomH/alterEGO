#!/usr/bin/env python

## { alterEGO Linux: "Open the vault of knowledge" } ----------------------- ##
##                                                                           ##
## gitfzf.py                                                                 ##
##   created       : 2021-04-20 13:39:08 UTC                                 ##
##   updated       : 2021-10-03 18:39:14 UTC                                 ##
##   description   : Git with FZF.                                           ##
## _________________________________________________________________________ ##

import os
import subprocess

home = os.path.expanduser('~')

def run_fzf(_input):
    viewer = 'ls {} | less'
    fzf = subprocess.Popen(
                    ['fzf',
                    '--pointer=❯',
                    '--prompt=SEARCH: ',
                    '--no-hscroll',
                    '-i',
                    '--exact'], stdin=_input.stdout, stdout=subprocess.PIPE)

    return fzf.stdout

def get_gits():
    gits = []

    for _path, _dirs, _files in os.walk(home):
        for d in _dirs:
            if d.endswith('.git')                                             \
                and '.cache/' not in _path                                    \
                and '.vim/' not in _path                                      \
                and '.dump_to_sort/' not in _path:
                if _path not in gits:
                    gits.append(_path)
    choices = '\n'.join(sorted(gits))
    return choices

def get_status(_directory):

    _statuses_list = {
                        '??': 'Untracked',
                        'A ': 'New file',
                        'AD': 'New and Deleted',
                        ' D': 'Deleted',
                        'AM': 'New and Modified',
                        ' M': 'Modified',
                     }
    _files_status = []
    os.chdir(_directory)

    _get_statuses = subprocess.Popen(['git', 'status', '--porcelain'], stdout=subprocess.PIPE)

    _statuses = _get_statuses.stdout

    for _line in _statuses:
        _line = _line.decode('utf-8')[:-1]
        _status = _statuses_list.get(_line[:2])
        _file = _line[3:]
        _files_status.append((_file, _status))

    _files_status.sort(key=lambda f: f[0].lower())

    if len(_files_status) > 0:
        return _files_status
    else:
        return f'[!] Nothing to do.'
        
choices = get_gits()

gitdirs = subprocess.Popen(['echo', choices], stdout=subprocess.PIPE)

fzfout = run_fzf(gitdirs)

for result_git in fzfout:
    if result_git is not None:
        result_git = result_git[:-1].decode('utf-8')
        actions = ['ranger', 'ls', 'status']

        action_choices = subprocess.Popen(['echo', '\n'.join(actions)], stdout=subprocess.PIPE)

        fzfout = run_fzf(action_choices)

        for result_action in fzfout:
            result_action = result_action[:-1].decode('utf-8')

            if result_action == 'ranger':
                subprocess.run(f'/usr/bin/ranger {result_git}', shell=True)
            if result_action == 'ls':
                print(os.listdir(result_git))
            if result_action == 'status':
                print(get_status(result_git))
                
## FIN _____________________________________________________________ ¯\_(ツ)_/¯
