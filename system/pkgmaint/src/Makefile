# pkgmaint version
VERSION  = 0.1

PROGRAMS = $(patsubst %.in,%,$(wildcard *.in))
MANPAGES = $(patsubst %.pod,%,$(wildcard *.pod))

all: ${PROGRAMS} ${MANPAGES}

%: %.in
	sed "s/@VERSION@/${VERSION}/" $<  >  $@

%: %.pod
	pod2man --nourls -r ${VERSION} -c ' ' -n $(basename $@) \
		-s $(subst .,,$(suffix $@)) $<  >  $@

check:
	@echo "=======> Check PODs for errors"
	@podchecker *.pod
	@echo "=======> Check URLs for non-200 response code"
	@grep -Eiho "https?://[^\"\\'> ]+" *.* | httpx -silent -fc 200 -sc

install: all
	mkdir -p ${DESTDIR}/usr/bin ${DESTDIR}/usr/share/man/man1
	cp -f ${PROGRAMS} ${DESTDIR}/usr/bin
	cd ${DESTDIR}/usr/bin && chmod 0755 ${PROGRAMS}
	cp -f ${MANPAGES} ${DESTDIR}/usr/share/man/man1

uninstall:
	cd ${DESTDIR}/usr/bin/             && rm -f ${PROGRAMS}
	cd ${DESTDIR}/usr/share/man/man1/  && rm -f ${MANPAGES}

clean:
	rm -f ${PROGRAMS} ${MANPAGES}

.PHONY: all install uninstall clean
