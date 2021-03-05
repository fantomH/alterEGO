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

repo_firefox="${repo}/config/.mozilla/firefox/"
local_firefox="${HOME}/.mozilla/firefox/"
profile_firefox='alterego-firefox.default'

if [[ ${1} == '--repo' ]]; then
    if [[ ${2} == 'firefox' ]]; then
        printf '%s\n' ":: Will update ${local_firefox} => ${repo_firefox}"
    fi
elif [[ ${1} == '--local' ]]; then
    if [[ ${2} == 'firefox' ]]; then
        printf '%s\n' ":: Will update ${repo_firefox}${profile_firefox} => ${local_firefox}${profile_firefox}"
	rm -rf ${local_firefox}${profile_firefox}
	sudo cp -r ${repo_firefox}${profile_firefox} ${local_firefox}
	sudo chown --recursive ${USER} ${local_firefox}${profile_firefox}
	
        printf '%s\n' "-> Done!.."
    fi
fi

#--{ file:fin }----------------------------------------------------------------
