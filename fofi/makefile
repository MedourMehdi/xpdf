PREFIX = /opt/cross-mint/m68k-atari-mint
CC = m68k-atari-mint-g++
AR = m68k-atari-mint-ar
RANLIB = m68k-atari-mint-ranlib
ARFLAGS = -rcs
CFLAGS = -m68020-60 -fomit-frame-pointer -fno-strict-aliasing -O2

INC_DIR = "include"

C_LIB_SOURCES = FoFiBase.cc FoFiEncodings.cc FoFiIdentifier.cc FoFiTrueType.cc FoFiType1.cc FoFiType1C.cc
C_LIB_OBJECTS = FoFiBase.o FoFiEncodings.o FoFiIdentifier.o FoFiTrueType.o FoFiType1.o FoFiType1C.o
C_TARGETS = libfofi.a

ALL_TARGETS = $(C_TARGETS)

lib: $(C_TARGETS)

install: $(C_TARGETS)
	install $(C_TARGETS) $(PREFIX)/lib/

uninstall:
	rm -f $(PREFIX)/lib/$(C_TARGETS)

$(C_TARGETS): $(C_LIB_OBJECTS) $(C_LIB_SOURCES:.c*=.h)

all: $(ALL_TARGETS)

$(C_LIB_OBJECTS):
	$(CC) $(CFLAGS) -c $(C_LIB_SOURCES)

libfofi.a:
	$(AR) $(ARFLAGS) $@ $(C_LIB_OBJECTS)

clean:
	rm -f $(C_LIB_OBJECTS)

clean-all:
	rm -f $(ALL_TARGETS) $(C_LIB_OBJECTS)