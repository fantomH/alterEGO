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

def cloud_flare_decode_email(link):

    #### This solution to bypass Cloud Flare email encoding was found at
    #... https://usamaejaz.com/cloudflare-email-decoding/

    encoded_string = link.split('#')[-1]
    r = int(encoded_string[:2], 16)
    email = ''.join([chr(int(encoded_string[i:i+2], 16) ^ r) for i in range(2, len(encoded_string), 2)])
    return email

def get_root(base_url):
    
    if base_url.startswith('https://'):
        protocol = 'https://'
        remainder = base_url.split('//')[1]
    elif base_url.startswith('http://'):
        protocol = 'http://'
        remainder = base_url.split('//')[1]
    else:
        protocol = 'https://'
        remainder = base_url

    if '/' in remainder:
        remainder = remainder.split('/')[0] 

    root_url = protocol + remainder
    return root_url

def collect(base_url):

    root_url = get_root(base_url)

    while True:
        relative_links = [base_url]
        external_links = []
        emails = []
        urls = {}
        garbage = []
        for link in relative_links:
            r = requests.get(link)
            url_text = r.text

            #### Saving webpages to dictionnary.

            urls[r.url] = {'text': url_text}

            print(f'CHECKING: {r.url}')

            #### Parsing text to find links.
            #... StackOverflow
            #... Regular expression to extract URL from an HTML link
            #... https://stackoverflow.com/a/499371
            regex = re.compile(r'(?si)a.*?href=[\'"]?([^\'" >]+)')
            matches = re.findall(regex, url_text)
            
            count = len(relative_links)

            for link in matches:

                #### Checking if the link is a Cloudflare email protection link.
                if 'email-protection' in link:
                    # pass
                    email = cloud_flare_decode_email(link)
                    if email not in emails:
                        emails.append(email)

                elif link.startswith('/'):
                    link = root_url + link
                    if link not in relative_links:
                        print(f'-> found... {link}')
                        relative_links.append(link)

                elif link.startswith('http'):
                    if link not in external_links:
                        external_links.append(link)

                elif link not in (relative_links or external_links):
                    garbage.append(link)
                    
        if count == len(relative_links):
            break

    #### Remove duplicates
    garbage = list(set(garbage))

    # print(relative_links)
    # print(external_links)
    # print(emails)
    # print(garbage)

    return sorted(relative_links, key=str.lower), emails, sorted(external_links, key=str.lower), urls

def search_words(words_to_search, urls):

    print(f"SEARCHING FOR... {words_to_search}")

    for k, v in urls.items():
        matches = re.findall(words_to_search, v['text'])
        if matches:
            print(f" -> found match in... {k}")

def wordcount(urls):

    unwanted_chr = [',', '.', '*', '(', ')', '"', '“', '”', '‘', '’', '?', '!', '&', ';', ':', '[', ']']
    unwanted_chr_sub = {}
    banned_words = ['in']
    word_count = {}
    for c in unwanted_chr:
        unwanted_chr_sub[c] = ''

    for k, v in urls.items():
        code_content = v.get('text')
        regex = re.compile(r'(?s)<body.*?>(.*)</body>')
        body = re.findall(regex, code_content.lower())

        regex = re.compile(r'(?is)<br>')
        presub = re.sub(regex, '\n', ''.join(body))
        regex = re.compile(r'(?is)<script.*?/script>|<.*?>|\d|\w’')
        res = re.sub(regex, '', presub).lower().translate(str.maketrans(unwanted_chr_sub)).split()

        print(type(res))

        for w in res:
            if w not in banned_words and len(w) > 1:
                if w not in word_count:
                    word_count[w] = 1
                else:
                    word_count[w] += 1

    word_count = dict(sorted(word_count.items(), key=lambda item: item[1], reverse=True))
    return word_count

def main():

    parser = argparse.ArgumentParser()
    parser.add_argument("-u", "--url", type=str, help="Website to scout.")
    parser.add_argument("-c", "--collect", action="store_true", help="Scrapper.")
    parser.add_argument("-s", "--search", type=str, help="Search for word or expression.")
    parser.add_argument("--wordcount", action="store_true", help="Counts words.")

    args = parser.parse_args()
    base_url = args.url

    if args.collect:
        print(f"STARTING DATA COLLECTION...\n")
        rel, emails, ext, urls = collect(base_url)
        print(f"\nCOLLECTED...\n")
        print(f" -> {len(urls)} pages.")
        print(f" -> {len(rel)} relative links.")
        print(f" -> {len(emails)} emails.")
        print(f" -> {len(ext)} external links.\n")

    if args.search:
        words_to_search = args.search
        search_words(words_to_search, urls)

    if args.wordcount:
        word_count = wordcount(urls)
        for k, v in word_count.items():
            print(f"{k:.<30}: {v}")
    
if __name__ == "__main__":
    main()

#--{ file:FIN }----------------------------------------------------------------
