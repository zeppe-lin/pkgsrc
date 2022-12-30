# revdep version
VERSION = 2.1

# flags
CPPFLAGS  = -DVERSION=\"${VERSION}\"
CXXFLAGS += -std=c++11 -Wall -Wextra -pedantic
LDFLAGS  += --static $(shell pkg-config --libs --static libelf)

# compiler and linker
CXX = c++
LD  = ${CXX}
