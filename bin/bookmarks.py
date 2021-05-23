#!/usr/bin/env python
#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# bookmarks.py
#   created        : 2021-03-21 14:39:13 UTC
#   updated        : 2021-04-30 14:21:51 UTC
#   description    : Bookmarks.
#------------------------------------------------------------------------------

import sqlite3 as sql
import subprocess
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

    bk = f'{title:}: {row[3]} : TAGS: {row[5]}\n'
    selection.add(bk)

selection = ''.join(sorted(list(selection)))

echo = subprocess.Popen(['echo', selection], stdout=subprocess.PIPE)
fzf = subprocess.Popen(['fzf', '--no-hscroll'], stdin=echo.stdout, stdout=subprocess.PIPE)

result = fzf.stdout
for x in result:
    url = x.decode('ascii').split(': ')[1]
    webbrowser.open_new_tab(url)

con.close()

#--{ file:FIN }----------------------------------------------------------------
