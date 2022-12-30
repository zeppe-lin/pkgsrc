.POSIX:

include config.mk

all: qemuconf qemuconf.1 qemuconf-import.1

%: %.pod
	pod2man --nourls -c ' ' -r ${VERSION} -s 1 \
		-n $(basename $@) $< > $@

.c.o:
	${CC} -c ${CFLAGS} ${CPPFLAGS} $<

qemuconf: qemuconf.o
	${LD} -o $@ ${LDFLAGS} $^

check: qemuconf
	@echo "=======> Check POD for errors"
	@podchecker *.pod
	@echo "=======> Check URLs for non-200 response code"
	@grep -Eiho "https?://[^\"\\'> ]+" *.* | httpx -silent -fc 200 -s
	@echo "=======> Check qemuconf for correct parsing"
	@tests/run.sh

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	cp -f qemuconf   qemuconf-import   ${DESTDIR}${PREFIX}/bin/
	cp -f qemuconf.1 qemuconf-import.1 ${DESTDIR}${MANPREFIX}/man1/
	chmod +x ${DESTDIR}${PREFIX}/bin/qemuconf-import

uninstall:
	cd ${DESTDIR}${PREFIX}/bin     && rm -f qemuconf   qemuconf-import
	cd ${DESTDIR}${MANPREFIX}/man1 && rm -f qemuconf.1 qemuconf-import.1

clean:
	rm -f qemuconf qemuconf.o qemuconf.1 qemuconf-import.1

.PHONY: all install uninstall check clean
