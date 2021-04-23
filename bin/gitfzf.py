#!/usr/bin/env python
#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# gitfzf.py
#   created        : 2021-04-20 13:39:08 UTC
#   updated        : 2021-04-21 09:19:35 UTC
#   description    : Git with FZF.
#------------------------------------------------------------------------------

import os
import subprocess

home = os.path.expanduser('~')

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

def get_status(directory):
    _status = {}

    os.chdir(directory)

    _types_of_statuses = ['--others', '--modified', '--deleted', '--cache']
    for _type in _types_of_statuses:
        _check_status = subprocess.Popen(['git', 'ls-files', _type], stdout=subprocess.PIPE)
        for _file in _check_status.stdout:
            _file = _file.decode('utf-8')[:-1]
            if _type == '--others':
                _status[_file] = 'untracked'
            elif _type == '--modified':
                _status[_file] = 'modified'
            elif _type == '--deleted':
                _status[_file] = 'deleted'
            elif _type == '--cache' and _file not in _status:
                _status[_file] = 'new file'
            
    

    print(_status)

choices = get_gits()
viewer = 'ls {} | less'

gitdirs = subprocess.Popen(['echo', choices], stdout=subprocess.PIPE)

fzf = subprocess.Popen(
                ['fzf',
                 '--no-hscroll',
                 '-i',
                 '--exact',
                 '--preview-window=down:80%',
                 '--preview', viewer], stdin=gitdirs.stdout, stdout=subprocess.PIPE)

for result_git in fzf.stdout:
    if result_git is not None:
        result_git = result_git[:-1].decode('utf-8')
        actions = ['cd', 'ls', 'status']

        action_choices = subprocess.Popen(['echo', '\n'.join(actions)], stdout=subprocess.PIPE)

        fzf = subprocess.Popen(
                        ['fzf',
                        '--no-hscroll',
                        '-i',
                        '--exact'], stdin=action_choices.stdout, stdout=subprocess.PIPE)

        for result_action in fzf.stdout:
            result_action = result_action[:-1].decode('utf-8')

            if result_action == 'cd':
                os.chdir(result_git)
                print(os.getcwd())
                print(os.listdir())
            if result_action == 'ls':
                print(os.listdir(result_git))
            if result_action == 'status':
                get_status(result_git)
                


#--{ file:fin }----------------------------------------------------------------
