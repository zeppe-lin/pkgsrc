.POSIX:

include config.mk

all: xkbswitch xkbswitch.1

.c.o:
	${CC} -c ${CFLAGS} ${CPPFLAGS} $<

%: %.pod
	pod2man -c ' ' -n xkbswitch -r ${VERSION} $^ > $@

xkbswitch: xkbswitch.o
	${LD} $^ ${LDFLAGS} -o $@

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	cp xkbswitch   ${DESTDIR}${PREFIX}/bin/
	cp xkbswitch.1 ${DESTDIR}${MANPREFIX}/man1/

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/xkbswitch
	rm -f ${DESTDIR}${MANPREFIX}/man1/xkbswitch.1

clean:
	rm -f xkbswitch xkbswitch.o xkbswitch.1

.PHONY: all install uninstall clean
