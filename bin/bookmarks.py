#!/usr/bin/env python
#--{ ZmFudG9tSA==: "Open the vault of knowledge" }-----------------------------
#
# bookmarks.py:
#   created:       '2021-03-21 14:39:13 UTC'
#   updated:       '2021-03-22 19:23:35 UTC'
#   description:   'Bookmarks.' 
#   dependencies:
#
#------------------------------{ alterEGO Linux }------------------------------

import sqlite3 as sql
import subprocess
import webbrowser

con = sql.connect('/usr/local/share/bookmarks.db')
cur = con.cursor()

sqlite_select_query = """SELECT * from bookmarks"""
cur.execute(sqlite_select_query)
records = cur.fetchall()

selection = ''
for row in records:
    try:
        title = f'{row[1]} - {row[2]}'
        selection = selection + f'{title:<60}: {row[3]}\n'
    except:
        title = f'{row[1]}'
        selection = selection + f'{title:<60}: {row[3]}\n'

echo = subprocess.Popen(['echo', selection], stdout=subprocess.PIPE)
fzf = subprocess.Popen(['fzf'], stdin=echo.stdout, stdout=subprocess.PIPE)

result = fzf.stdout
for x in result:
    url = x.decode('ascii').replace('\n', '').split(': ')[1]
    webbrowser.open_new_tab(url)

con.close()

#--{ file:fin }----------------------------------------------------------------
