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

def get_all_links(base_url):

    while True:
        relative_links = ['']
        external_links = []
        for link in relative_links:
            url = base_url + str(link)
            r = requests.get(url).text

            print(f'CHECKING: {url}')

            #### Parsing text to find links.
            #... StackOverflow
            #... Regular expression to extract URL from an HTML link
            #... https://stackoverflow.com/a/499371
            regex = re.compile(r'a href=[\'"]?([^\'" >]+)')
            matches = re.findall(regex, r)

            
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
            print('FINISHED...')
            break

    return sorted(relative_links, key=str.lower), sorted(external_links, key=str.lower)


def main():

    parser = argparse.ArgumentParser()
    parser.add_argument("-w", "--website", type=str, help="Website to scout.")

    args = parser.parse_args()
    if args.website:
        base_url = args.website
        rel, ext = get_all_links(base_url)
    
if __name__ == "__main__":
    main()

#--{ file:FIN }----------------------------------------------------------------
