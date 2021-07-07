#!/usr/bin/env bash
#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
# 
# nmapNSE.sh
#   created     : 2020-12-09 12:01:59 UTC
#   updated     : 2021-07-06 12:02:53 UTC
#   description : Fetch the list of nmap scripts.
# -----------------------------------------------------------------------------

#### Verify if $HOME/tmp exists.

if [[ ! -e ${HOME}/tmp ]]; then
    mkdir -p ${HOME}/tmp
fi

output_file="${HOME}/tmp/nmap_scripts.dump"

#### Creates the temporary file in /tmp.
python - <<EOF
import os.path
import re
import requests

url = 'https://nmap.org/nsedoc/index.html'
output_file = os.path.expanduser('~') + '/tmp/nmap_scripts.dump'

r = requests.get(url)
data = r.text

rex_table = re.compile(r'(?s)<table class="file_list">(.*?)</table>')
found_table = re.search(rex_table, data).group(1)

rex_scripts = re.compile(r'(?s)<tr>(.*?)</tr>')
found_scripts = re.findall(rex_scripts, found_table)

script_list = []
for script in found_scripts:
    script_dict = {}
    try:
        _script_name = re.search(r'name.*?html">(.*?)<', script).group(1)
        script_dict['name'] = _script_name
    except:
        script_dict['name'] = 'NULL'

    try:
        _script_desc = re.search(r'(?s)summary">.*?<p>(.*?)</p>', script).group(1)
        _script_desc = _script_desc.replace('<li>', '').replace('</li>', ', ').replace('<ul>', '').replace('</ul>', '').replace('\n', ' ').replace('  ', ' ')
        script_dict['desc'] = _script_desc
    except:
        script_dict['desc'] = 'NULL'

    script_list.append(script_dict)

maxLEN = 0
for d in script_list:
    nameLEN = len(d.get('name'))
    if nameLEN > maxLEN:
        maxLEN = nameLEN + 1

with open(output_file, 'w') as file_out:
    for x in script_list:
        file_out.write(f"{x.get('name'):{maxLEN}}|{x.get('desc')}\n")
EOF

result=$(cat ${output_file}                                                   \
         | grep -v "^NULL"                                                    \
         | fzf --no-hscroll                                                   \
               --delimiter='\|'                                               \
               --reverse                                                      \
               --header='NMAP scripts'                                        \
               --no-info                                                      \
               --preview='printf "%b%s" "{1}\\n\\nDESCRIPTION:\\n{2}"'        \
               --preview-window=down:wrap                                     \
         | awk -F '|' '{ print $1 }'                                          \
         | sed 's/ //g')

[[ -z ${result} ]] && exit 1

firefox "https://nmap.org/nsedoc/scripts/${result}.html"

#### Cleaning up.

rm ${output_file}

#--{ file:FIN }----------------------------------------------------------------
