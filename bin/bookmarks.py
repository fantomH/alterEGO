#!/usr/bin/env python
#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# bookmarks.py
#   created        : 2021-03-21 14:39:13 UTC
#   updated        : 2021-05-24 14:43:22 UTC
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

selection = set()
for row in records:
    try:
        title = f'{row[1]} - {row[2]}'
    except:
        title = f'{row[1]}'

    bk = f'{title:<100}: {row[3]} : {row[4]} : TAGS: {row[5]}\n'
    selection.add(bk)

selection = ''.join(sorted(list(selection)))

with tempfile.NamedTemporaryFile(mode='w', delete=False) as f:
    f.write(selection)
    f.seek(0)
    dumpfile = f.name

cat = subprocess.Popen(['cat', dumpfile], stdout=subprocess.PIPE)
fzf = subprocess.Popen(['fzf', '--no-hscroll'], stdin=cat.stdout, stdout=subprocess.PIPE)

result = fzf.stdout
for x in result:
    url = x.decode('ascii').split(': ')[1]
    webbrowser.open_new_tab(url)

con.close()
os.remove(dumpfile)

#--{ file:FIN }----------------------------------------------------------------
