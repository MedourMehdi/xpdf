PREFIX = /opt/cross-mint/m68k-atari-mint
CC = m68k-atari-mint-g++
AR = m68k-atari-mint-ar
RANLIB = m68k-atari-mint-ranlib
ARFLAGS = -rcs
CFLAGS = -m68020-60 -fomit-frame-pointer -fno-strict-aliasing -O2

INC_DIR = "include"

C_LIB_SOURCES = Splash.cc SplashBitmap.cc SplashClip.cc SplashFTFont.cc SplashFTFontEngine.cc SplashFTFontFile.cc SplashFont.cc SplashFontEngine.cc SplashFontFile.cc SplashFontFileID.cc SplashPath.cc SplashPattern.cc SplashScreen.cc SplashState.cc SplashXPath.cc SplashXPathScanner.cc
C_LIB_OBJECTS = Splash.o SplashBitmap.o SplashClip.o SplashFTFont.o SplashFTFontEngine.o SplashFTFontFile.o SplashFont.o SplashFontEngine.o SplashFontFile.o SplashFontFileID.o SplashPath.o SplashPattern.o SplashScreen.o SplashState.o SplashXPath.o SplashXPathScanner.o
C_TARGETS = libsplash.a

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

libsplash.a:
	$(AR) $(ARFLAGS) $@ $(C_LIB_OBJECTS)

clean:
	rm -f $(C_LIB_OBJECTS)

clean-all:
	rm -f $(ALL_TARGETS) $(C_LIB_OBJECTS)