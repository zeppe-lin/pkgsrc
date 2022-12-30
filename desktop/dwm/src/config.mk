# See LICENSE file for copyright and license details.

# dwm version
VERSION = 6.1zpln

# optional xinerama support (comment to disable)
XINERAMAFLAGS = -DXINERAMA
XINERAMALIBS = -lXinerama

# optional per window keyboard layout support (comment to disable)
PWKL = -DPWKL

# optional windows title support (comment to disable)
WINTITLE = -DWINTITLE

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

# DragonFlyBSD, FreeBSD (uncomment to disable)
#X11INC = /usr/local/include
#X11LIB = /usr/local/lib
#FT2INC = /usr/local/include/freetype2

# NetBSD, OpenBSD (uncomment do enable)
#X11INC = /usr/X11R6/include
#X11LIB = /usr/X11R6/lib

# Linux
X11INC = /usr/include
X11LIB = /usr/lib
FT2INC = /usr/include/freetype2

FT2LIB = -lfontconfig -lXft

# includes and libs
INCS = -I${X11INC} -I${FT2INC}
LIBS = -L${X11LIB} -lX11 ${FT2LIB} ${XINERAMALIBS}

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_C_SOURCE=200809L \
	   -DVERSION=\"${VERSION}\" ${INCS} \
	   ${XINERAMAFLAGS} ${PWKL} ${WINTITLE}
CFLAGS  += -std=c99 -pedantic -Wall -Wextra -Wformat
LDFLAGS += ${LIBS}

# compiler and linker
CC = cc
LD = ${CC}

# vim:cc=72:tw=70
# End of file.
