from collections import namedtuple

MenuOption = namedtuple('MenuOption', ['name', 'run', 'cmd', 'session', 'description', 'is_floating'])

#### Execute options:
#... 

additional_options = [
    MenuOption('all apps', 'launch', 'dmenu_run -nb \'#000\' -l 20 | xargs', 'ALLAPPS', 'Use dmenu_run to see all apps.', False),
    MenuOption('brave', 'launch', 'brave', 'BRAVE', 'Web browser.', False),
    MenuOption('dicom', 'terminal', 'bash ${HOME}/fH/scripts/dicomTAG.sh', 'DICOM', 'Browse DICOM tags.', True),
    MenuOption('emojis', 'stay_in_terminal', r"""bash ${HOME}/fH/scripts/emojis.sh && exit""", 'EMOJIS', 'Select emojis.', True),
    MenuOption('pamac', 'launch', 'pamac-manager', 'PAMAC', 'Package Manager based on libalpm with AUR and Appstream support.', False),
    MenuOption('pdfman', 'stay_in_terminal', '${HOME}/fH/scripts/pdfman.sh && exit', 'PDFMAN', 'Open man in pdf.', True),
    MenuOption('toggle audio', 'launch', 'bash ${HOME}/fH/scripts/toggle_audio_device.sh && exit', 'AUDIO', 'Toggle audio device.', False),
    MenuOption('Work RDP', 'launch', 'remmina --connect=/home/ghost/.local/share/remmina/group_rdp_work_ws-18-02-mtl-radiologymontreal-com.remmina', 'WILLWORK', 'Connect to work. mstsc', False),
    ]
