#!/usr/bin/env python
#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# bookmarks.py
#   created        : 2021-03-21 14:39:13 UTC
#   updated        : 2021-06-27 13:59:04 UTC
#   description    : Bookmarks.
#------------------------------------------------------------------------------

import os
import sqlite3 as sql
import subprocess
import tempfile
import webbrowser

con = sql.connect('/usr/local/share/bookmarks.db')
cur = con.cursor()

sqlite_select_query = """SELECT * from bookmarks"""
cur.execute(sqlite_select_query)
records = cur.fetchall()

options = set()
for row in records:
    try:
        title = f'{row[1]} - {row[2]}'
    except:
        title = f'{row[1]}'

    bk = f'{title:<100}: {row[3]} : {row[4]} : TAGS: {row[5]}\n'
    options.add(bk)

options = ''.join(sorted(list(options)))

with tempfile.NamedTemporaryFile(mode='w', delete=False) as f:
    f.write(options)
    f.seek(0)
    dumpfile = f.name

with open(dumpfile, 'r') as f:
    data = f.read().encode('UTF-8')

try:
    fzf = subprocess.run(['fzf', '--no-hscroll'], input=data, stdout=subprocess.PIPE)

    selection = fzf.stdout
    url = selection.decode('ascii').split(': ')[1]

    webbrowser.open_new_tab(url)
except:
    pass

con.close()
os.remove(dumpfile)

#--{ file:FIN }----------------------------------------------------------------
