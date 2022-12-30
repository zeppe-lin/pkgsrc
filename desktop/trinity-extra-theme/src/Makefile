DIRCOLORS  = ~/.dircolors
DUNSTRC    = ~/.config/dunst/dunstrc
#GITK      = ???
#HEXCHAT   = ???
NEWSBOAT   = ~/.newsboat/config
VIFM       = ~/.vifm/colors/trinity.vifm
VIM        = ~/.vim/colors/trinity.vim
WIRESHARK  = ~/.config/wireshark/preferences
XRESOURCES = ~/.Xresources
ZATHURA    = ~/.config/zathura/zathurarc

all:

import-local:
	[ -f ${DIRCOLORS}  ] && cp ${DIRCOLORS}  dircolors
	[ -f ${DUNSTRC}    ] && cp ${DUNSTRC}    dunst
	[ -f ${NEWSBOAT}   ] && cp ${NEWSBOAT}   newsboat
	[ -f ${VIFM}       ] && cp ${VIFM}       vifm
	[ -f ${VIM}        ] && cp ${VIM}        vim
	[ -f ${WIRESHARK}  ] && cp ${WIRESHARK}  wireshark
	[ -f ${XRESOURCES} ] && cp ${XRESOURCES} xresources
	[ -f ${ZATHURA}    ] && cp ${ZATHURA}    zathura

.PHONY: import-local
