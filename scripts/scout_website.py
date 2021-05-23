#!/usr/bin/env python
#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# scout_website.py
#   created        : 2021-05-21 20:02:34 UTC
#   updated        : 2021-05-21 20:02:34 UTC
#   description    : 
#------------------------------------------------------------------------------

import argparse
import re
import requests
import sys

def collect(base_url):

    while True:
        relative_links = ['']
        external_links = []
        urls = {}
        for link in relative_links:
            url = base_url + str(link)
            r = requests.get(url)
            url_text = r.text

            #### Saving webpages to dictionnary.

            urls[r.url] = {'text': url_text}

            print(f'CHECKING: {url}')

            #### Parsing text to find links.
            #... StackOverflow
            #... Regular expression to extract URL from an HTML link
            #... https://stackoverflow.com/a/499371
            regex = re.compile(r'a href=[\'"]?([^\'" >]+)')
            matches = re.findall(regex, url_text)

            
            count = len(relative_links)

            for link in matches:
                if link.startswith('/'):
                    if link not in relative_links:
                        print(f'-> found... {link}')
                        relative_links.append(link)

                else:
                    if link not in ['#', '\\']:
                        external_links.append(link)
                    
                        #### Remove duplicates
                        external_links = list(set(external_links))

        if count == len(relative_links):
            break

    return sorted(relative_links, key=str.lower), sorted(external_links, key=str.lower), urls

def search_words(words_to_search, urls):

    print(f"SEARCHING FOR... {words_to_search}")

    for k, v in urls.items():
        matches = re.findall(words_to_search, v['text'])
        if matches:
            print(f" -> found match in... {k}")

def main():

    parser = argparse.ArgumentParser()
    parser.add_argument("-u", "--url", type=str, help="Website to scout.")
    parser.add_argument("-c", "--collect", action="store_true", help="Scrapper.")
    parser.add_argument("-s", "--search", type=str, help="Search for word or expression.")

    args = parser.parse_args()
    base_url = args.url
    if args.collect:
        print(f"STARTING DATA COLLECTION...\n")
        rel, ext, urls = collect(base_url)
        print(f"\nCOLLECTED...\n")
        print(f" -> {len(urls)} pages.")
        print(f" -> {len(rel)} relative links.")
        print(f" -> {len(ext)} external links.\n")
    if args.search:
        words_to_search = args.search
        search_words(words_to_search, urls)
    
if __name__ == "__main__":
    main()

#--{ file:FIN }----------------------------------------------------------------
