#--{ ZmFudG9tSA==: "Open the vault of knowledge" }-----------------------------
#
# ego-background.sh:
#   created:       '2021-04-01 12:38:04 UTC'
#   updated:       '2021-04-01 12:38:10 UTC'
#   description:   'Change backgrounds.' 
#   dependencies:
#     - feh
#     - sxiv
#
#------------------------------{ alterEGO Linux }------------------------------

  # -- This script launches `sxiv` and shows alterEGO backgrounds.
  # .. Uses the 'mark' feature to output the name of the images to STDOUT.
  # .. To select a background, press 'm' and 'q' to quit.

  bgdir="/usr/local/share/backgrounds"

  selection=$(sxiv -t ${bgdir} -o)

  feh --bg-max ${selection}

#--{ file:fin }----------------------------------------------------------------
