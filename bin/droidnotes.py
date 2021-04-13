#!/usr/bin/env python
#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# droidnotes.py
#   created     : 2021-04-12 20:04:43 UTC
#   updated     : 2021-04-12 20:04:49 UTC
#   description : droidnotes tools
#------------------------------------------------------------------------------

import bs4
import re

def file_init(file):
    
    with open(file, 'r') as f:
        data = f.read()

        _DN = bs4.BeautifulSoup(data, 'html.parser')
        return _DN

def toc(text):
    articles = TXT.find_all('article')

    for a in articles:
        _id = a['id']
        _title = a.find('h1').text
        print(f'<a href="#{_id}">{_title}</a><br />')

if __name__ == "__main__":

    file = '/home/ghost/gits/droidnotes/droidnotes.html'
    TXT = file_init(file)

    toc(TXT)
