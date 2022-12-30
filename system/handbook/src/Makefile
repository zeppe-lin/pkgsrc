# handbook version
VERSION = 0.99

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

all:

check:
	@podchecker handbook.7.pod
	@grep -Eiho "https?://[^\"\\'> ]+" *.* | httpx -silent -fc 200 -sc

man:
	pod2man --nourls -r ${VERSION} -n handbook -s 7 \
		-c "Zeppe-Lin Handbook" handbook.7.pod > handbook.7

install-man: man
	install -m 0644 -Dt ${DESTDIR}${MANPREFIX}/man7/ handbook.7

uninstall-man:
	rm -f ${DESTDIR}${MANPREFIX}/man7/handbook.7

clean:
	rm -f handbook.7

.PHONY: install-man uninstall-man clean
