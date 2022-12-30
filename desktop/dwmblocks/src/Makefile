.POSIX:

include config.mk

all: dwmblocks dwmblocks.1

%: %.pod
	pod2man -c ' ' -n dwmblocks -r ${VERSION} $^ > $@

.c.o:
	${CC} -c ${CFLAGS} ${CPPFLAGS} $<

config.h:
	cp config.def.h config.h

dwmblocks.o: config.h

dwmblocks: dwmblocks.o
	${LD} $^ ${LDFLAGS} -o $@

install: all
	mkdir -p          ${DESTDIR}${PREFIX}/bin/
	mkdir -p          ${DESTDIR}${MANPREFIX}/man1
	cp -f dwmblocks   ${DESTDIR}${PREFIX}/bin/
	cp -f dwmblocks.1 ${DESTDIR}${MANPREFIX}/man1/

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/dwmblocks
	rm -f ${DESTDIR}${MANPREFIX}/man1/dwmblocks.1

clean:
	rm -f dwmblocks dwmblocks.o dwmblocks.1

.PHONY: all install uninstall clean
