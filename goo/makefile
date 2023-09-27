PREFIX = /opt/cross-mint/m68k-atari-mint
CC = m68k-atari-mint-g++
AR = m68k-atari-mint-ar
RANLIB = m68k-atari-mint-ranlib
ARFLAGS = -rcs
CFLAGS = -m68020-60 -fomit-frame-pointer -fno-strict-aliasing -O2

INC_DIR = "include"

C_LIB_SOURCES = FixedPoint.cc GHash.cc GList.cc GString.cc gfile.cc gmem.cc gmempp.cc parseargs.c Trace.cc
C_LIB_OBJECTS = FixedPoint.o GHash.o GList.o GString.o gfile.o gmem.o gmempp.o parseargs.o Trace.o
C_TARGETS = libgoo.a

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

libgoo.a:
	$(AR) $(ARFLAGS) $@ $(C_LIB_OBJECTS)

clean:
	rm -f $(C_LIB_OBJECTS)

clean-all:
	rm -f $(ALL_TARGETS) $(C_LIB_OBJECTS)