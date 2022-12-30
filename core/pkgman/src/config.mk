# pkgman version
VERSION = 6.0

# flags
CPPFLAGS  = -DVERSION=\"${VERSION}\" -DNDEBUG
CXXFLAGS += -Wall -Wextra -Wconversion -Wcast-align -Wunused \
	    -Wshadow -Wcast-align -Wold-style-cast -std=c++17
LDFLAGS  += -lstdc++fs

# compiler and linker
CXX = c++
LD  = ${CXX}
