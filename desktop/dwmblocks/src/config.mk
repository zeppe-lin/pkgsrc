# dwmblocks version
VERSION = 0.1zpln

# paths
PREFIX    = /usr/local
MANPREFIX = ${PREFIX}/share/man

# X support (uncomment to disable X11)
#NO_X  = -DNO_X

# DragonFly & FreeBSD (comment)
X11INC = /usr/local/include
X11LIB = /usr/local/lib

# NetBSD, OpenBSD (uncomment)
#X11INC = /usr/X11R6/include
#X11LIB = /usr/X11R6/lib

# includes and libs
INCS = -I${X11INC}
LIBS = -L${X11LIB} -lX11

# flags
CPPFLAGS = ${NO_X}
CFLAGS  += -pedantic -Wall -Wextra -Wno-deprecated-declarations
LDFLAGS += ${LIBS}

# compiler and linker
CC = cc
LD = ${CC}
