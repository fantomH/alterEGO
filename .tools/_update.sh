#!/usr/bin/env bash
#--{ ZmFudG9tSA==: "Open the vault of knowledge" }-----------------------------
#
# .alteregorc:
#   created:       '2021-03-05 02:14:03 UTC'
#   updated:       '2021-03-05 02:14:03 UTC'
#   description:   '' 
#   dependencies:
#
#------------------------------{ alterEGO Linux }------------------------------

repo="/usr/local/alterEGO"

repo_firefox="${repo}/config/.mozilla/firefox/alterego-firefox.default"
local_firefox="${HOME}/.mozilla/firefox/alterego-firefox.default"

if [[ ${1} == '--repo' ]]; then
    if [[ ${2} == 'firefox' ]]; then
        printf '%s\n' ":: Will update ${local_firefox} => ${repo_firefox}"
elif [[ ${1} == '--local' ]]; then
    if [[ ${2} == 'firefox' ]]; then
        printf '%s\n' ":: Will update ${repo_firefox} => ${local_firefox}"
fi

#--{ file:fin }----------------------------------------------------------------
