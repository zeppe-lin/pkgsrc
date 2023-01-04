ABOUT
-----
This directory contains *pkgsrc* -- packages' sources collections:
packages' build scripts and sometime packages' source code which make
up so-called "GNU/Linux distribution".  *Zeppe-Lin* contains software
written by a lot of different people, and each software package comes
with its own license, chosen by its author(s).  To find out how
package is licensed, have a look at its source code.  Sometimes, for
obsolete software or software whose source code is hard to find, the
package' source (build scripts and so) may contain side by side the
source code of the software itself.  As a rule, there is a license
file next to the source code, which may differ from the *pkgsrc*
license.  If there is no license file, then the code is distributed
under the same conditions as the *pkgsrc* itself.  Feel free to open
an issue if you find the missing one.

See [Zeppe-Lin Handbook](https://zeppe-lin.github.io) for an initial
introduction to *Zeppe-Lin*.

PKGSRC
------
They were originally forked from *CRUX 3.6 ports* and thus inherits
CRUX' license and copyrights.  All packages' sources (build scripts)
in *Zeppe-Lin* are Copyright (C) 2000-2021 by Per Lidén and CRUX
development team and released under the GNU General Public license
version 3 or (at your opinion) any later version.

The original sources can be downloaded from:
1. https://crux.nu/gitweb/?p=ports/core.git;a=snapshot;h=8892897fa5565861102cf7368edb118b19e11761;sf=tgz
2. https://crux.nu/gitweb/?p=ports/core.git;a=tree;h=8892897fa5565861102cf7368edb118b19e11761;hb=d2cef9dd2ac01f84411c2f6c780cd558ab87f89f

These build scripts were further reworked: they were rewritten in the
POSIX sh(1) and *Zeppe-Lin* had its own criteria for what packages
should be in so-called *core* collection, what should be in *opt*,
*xorg* and so on.

See [The Packages' Sources
System](https://zeppe-lin.github.io/#THE-PACKAGES-SOURCES-SYSTEM) for
an introduction in "what pkgsrc is" and "how to use it".

INSTALL
-------
See the [Zeppe-Lin Handbook / Install
Zeppe-Lin](https://zeppe-lin.github.io/#INSTALL-ZEPPE-LIN) for
installation instructions.

LICENSE
-------
Since *Zeppe-Lin* is a Linux distribution, it contains software
written by a lot of different people. Each software package comes with
its license, chosen by its author(s).  To find out how a particular
package is licensed, have a look at its source code.

All build scripts in *core*, *system*, *xorg*, *desktop* and *stuff*
are licensed through the GNU General Public License v3 or later
<http://gnu.org/licenses/gpl.html>.
Read the *COPYING* file for copying conditions.
Read the *COPYRIGHT* file for copyright notices.


<!-- vim:sw=2:ts=2:sts=2:et:cc=72:tw=70
End of file. -->
