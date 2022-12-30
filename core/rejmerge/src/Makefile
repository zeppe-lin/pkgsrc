# rejmerge version
VERSION = 5.41

all: rejmerge rejmerge.8 rejmerge.conf.5

%: %.pod
	pod2man --nourls -r ${VERSION} -c ' ' -n $(basename $@) \
		-s $(subst .,,$(suffix $@)) $< > $@

%: %.in
	sed -e "s|@VERSION@|${VERSION}|g" $< > $@

check:
	@echo "=======> Check PODs for errors"
	@podchecker *.pod
	@echo "=======> Check URLs for non-200 response code"
	@grep -Eiho "https?://[^\"\\'> ]+" *.* | httpx -silent -fc 200 -sc

install: all
	mkdir -p ${DESTDIR}/usr/sbin
	mkdir -p ${DESTDIR}/usr/share/man/man5
	mkdir -p ${DESTDIR}/usr/share/man/man8
	cp -f rejmerge ${DESTDIR}/usr/sbin/
	chmod 0755     ${DESTDIR}/usr/sbin/rejmerge
	cp -f rejmerge.conf.5 ${DESTDIR}/usr/share/man/man5/
	cp -f rejmerge.8      ${DESTDIR}/usr/share/man/man8/

uninstall:
	rm -f ${DESTDIR}/usr/sbin/rejmerge
	rm -f ${DESTDIR}/usr/share/man/man5/rejmerge.conf.5
	rm -f ${DESTDIR}/usr/share/man/man8/rejmerge.8

clean:
	rm -f rejmerge rejmerge.8 rejmerge.conf.5

.PHONY: install uninstall clean
