#!/usr/bin/make -f

define USAGE
Usage: make [-j JOBS] [TARGET...] [PKGSRCDIR="PATH..."]
Check Zeppe-Lin package source(s) for typical errors.

TARGETS:

Check footprint files for typical errors:

footprint-all         perform all footprint checks listed below
├── footprint-sugid   check for SUID/SGID files and dirs
├── footprint-ww      check for world-writeable files and dirs
├── footprint-dirs    check for invalid directories like /usr/info
└── footprint-junk    check for junk files like perllocal.pod, etc

Check packages' source collections for missing dependencies:

deps-all              perform all dependency checks listed below
├── deps-core         check for missing deps for core collection
├── deps-system       check for missing deps for system collection
├── deps-xorg         check for missing deps for xorg collection
├── deps-desktop      check for missing deps for desktop collection
└── deps-stuff        check for missing deps for stuff collection

By default, PKGSRCDIR variable is set to the following packages
sources collections:
  ${CURDIR}/core
  ${CURDIR}/system
  ${CURDIR}/xorg
  ${CURDIR}/desktop
  ${CURDIR}/stuff
endef

PKGSRCDIR = ${CURDIR}/core    \
	    ${CURDIR}/system  \
	    ${CURDIR}/xorg    \
	    ${CURDIR}/desktop \
	    ${CURDIR}/stuff   \

all: help

######################################################################
# Check footprint files for typical errors.                          #
######################################################################

footprint-all: footprint-sugid footprint-ww footprint-dirs footprint-junk

# check for SUID/SGID files and dirs
footprint-sugid:
	@find ${PKGSRCDIR} -type f -name .footprint -exec awk '{     \
	if ($$1 ~ /^[^d]..s....../)                                  \
	  print "suid file found: "FILENAME": "$$3;                  \
	if ($$1 ~ /^[^d].....s.../)                                  \
	  print "sgid file found: "FILENAME": "$$3;                  \
	if ($$1 ~ /^d..s....../)                                     \
	  print "suid directory found: "FILENAME": "$$3;             \
	if ($$1 ~ /^d.....s.../)                                     \
	  print "sgid directory found: "FILENAME": "$$3;             \
	}' {} \;

# check for world-writeable files and dirs
footprint-ww:
	@find ${PKGSRCDIR} -type f -name .footprint -exec awk '{     \
	if ($$1 ~ /^d.......w[^t]/)                                  \
	  print "world writeable directory found: "FILENAME": "$$0;  \
	if ($$1 ~ /^-.......w./)                                     \
	  print "world writeable file found: "FILENAME": "$$0;       \
	}' {} \;

# check for invalid directories
footprint-dirs:
	@find ${PKGSRCDIR} -type f -name .footprint -exec awk '{     \
	if ($$3 ~ /^usr\/man\//                                      \
	 || $$3 ~ /^usr\/local\//                                    \
	 || $$3 ~ /^usr\/share\/locale\//                            \
	 || $$3 ~ /^usr\/share\/doc\//                               \
	 || $$3 ~ /^usr\/info\//                                     \
	 || $$3 ~ /^usr\/share\/info\//                              \
	 || $$3 ~ /^usr\/libexec\//                                  \
	 || $$3 ~ /^usr\/man\/\.\.\//                                \
	 || $$3 ~ /^usr\/share\/man\/\.\.\//                         \
	 ) print "invalid directory found: "FILENAME": "$$3;         \
	if ($$3 ~ /^usr\/share\/man\/[^\/]+$$/)                      \
	   print "invalid man location found: "FILENAME": "$$3;      \
	}' {} \;

# check for junk files
footprint-junk:
	@find ${PKGSRCDIR} -type f -name .footprint -exec awk '{     \
	if ($$3 ~ /\/.*\/perllocal\.pod$$/                           \
	 || $$3 ~ /\/perl5\/.*\/\.packlist$$/                        \
	 || $$3 ~ /\/perl5\/.*\/[^\/]+\.bs$$/                        \
	 ) print "junk file found: "FILENAME": "$$3;                 \
	}' {} \; -exec awk -v IGNORECASE=1 '{                        \
	if ($$3 ~ /\/AUTHORS$$/                                      \
	 || $$3 ~ /\/BUGS$$/                                         \
	 || $$3 ~ /\/COPYING$$/                                      \
	 || $$3 ~ /\/CHANGELOG$$/                                    \
	 ||($$3 ~ /\/INSTALL$$/ && $$3 !~ /^usr\/bin\/install$$/)    \
	 || $$3 ~ /\/NEWS$$/                                         \
	 || $$3 ~ /\/README$$/                                       \
	 || $$3 ~ /\/README.TXT$$/                                   \
	 || $$3 ~ /\/README.md$$/                                    \
	 || $$3 ~ /\/THANKS$$/                                       \
	 || $$3 ~ /\/TODO$$/                                         \
	 ) print "junk file found: "FILENAME": "$$3;                 \
	}' {} \;

######################################################################
# Check for missing declared dependencies in packages' sources.      #
######################################################################

deps-all: deps-core deps-system deps-xorg deps-desktop deps-stuff

deps-core:
	@find ${CURDIR}/core -type f -name Pkgfile -print            \
	 | cut -d/ -f5,6 | while IFS=/ read -r DIR PKG; do           \
	     pkgman --root= --no-std-config                          \
	     --config-append="pkgsrcdir ${CURDIR}/core"              \
	     dep --all $$PKG                                         \
	     | awk -v d=$$DIR -v p=$$PKG '/not found/{               \
	         printf "%s/%s depends on %s which is missing in "   \
		 "core collection\n", d, p, $$1;                     \
	       }';                                                   \
	   done

deps-system:
	@find ${CURDIR}/system -type f -name Pkgfile -print          \
	 | cut -d/ -f5,6 | while IFS=/ read -r DIR PKG; do           \
	     pkgman --root= --no-std-config                          \
	     --config-append="pkgsrcdir ${CURDIR}/system"            \
	     --config-append="pkgsrcdir ${CURDIR}/core"              \
	     dep --all $$PKG                                         \
	     | awk -v d=$$DIR -v p=$$PKG '/not found/{               \
	         printf "%s/%s depends on %s which is missing in "   \
		 "core and system collection\n", d, p, $$1;          \
	       }';                                                   \
	   done

deps-xorg:
	@find ${CURDIR}/xorg -type f -name Pkgfile -print            \
	 | cut -d/ -f5,6 | while IFS=/ read -r DIR PKG; do           \
	     pkgman --root= --no-std-config                          \
	     --config-append="pkgsrcdir ${CURDIR}/xorg"              \
	     --config-append="pkgsrcdir ${CURDIR}/system"            \
	     --config-append="pkgsrcdir ${CURDIR}/core"              \
	     dep --all $$PKG                                         \
	     | awk -v d=$$DIR -v p=$$PKG '/not found/{               \
	         printf "%s/%s depends on %s which is missing in "   \
		 "core, system and xorg collections\n", d, p, $$1;   \
	       }';                                                   \
	   done

deps-desktop:
	@find ${CURDIR}/desktop -type f -name Pkgfile -print         \
	 | cut -d/ -f5,6 | while IFS=/ read -r DIR PKG; do           \
	     pkgman --root= --no-std-config                          \
	     --config-append="pkgsrcdir ${CURDIR}/desktop"           \
	     --config-append="pkgsrcdir ${CURDIR}/xorg"              \
	     --config-append="pkgsrcdir ${CURDIR}/system"            \
	     --config-append="pkgsrcdir ${CURDIR}/core"              \
	     dep --all $$PKG                                         \
	     | awk -v d=$$DIR -v p=$$PKG '/not found/{               \
	         printf "%s/%s depends on %s which is missing in "   \
		 "core, system, xorg and desktop collections\n",     \
		 d, p, $$1;                                          \
	       }';                                                   \
	   done

deps-stuff:
	@find ${CURDIR}/stuff -type f -name Pkgfile -print           \
	 | cut -d/ -f5,6 | while IFS=/ read -r DIR PKG; do           \
	     pkgman --root= --no-std-config                          \
	     --config-append="pkgsrcdir ${CURDIR}/stuff"             \
	     --config-append="pkgsrcdir ${CURDIR}/desktop"           \
	     --config-append="pkgsrcdir ${CURDIR}/xorg"              \
	     --config-append="pkgsrcdir ${CURDIR}/system"            \
	     --config-append="pkgsrcdir ${CURDIR}/core"              \
	     dep --all $$PKG                                         \
	     | awk -v d=$$DIR -v p=$$PKG '/not found/{               \
	         printf "%s/%s depends on %s which is missing in "   \
		 "core, system, xorg, desktop and stuff collections\n",\
		 d, p, $$1;                                          \
	       }';                                                   \
	   done

help:
	@echo $(info ${USAGE})

.PHONY: all help
.PHONY: footprint-all deps-all
.PHONY: footprint-sugid footprint-ww footprint-dirs footprint-junk
.PHONY: deps-core deps-system deps-xorg deps-desktop deps-stuff

# vim:cc=72:tw=70
# End of file.
