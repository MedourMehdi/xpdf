ifeq ($(PREFIX),)
PREFIX := $(DESTDIR)/usr
endif
ifeq ($(CXX),)
CXX := m68k-atari-mint-g++
endif
ifeq ($(AR),)
AR := m68k-atari-mint-ar
endif
ifeq ($(RANLIB),)
RANLIB := m68k-atari-mint-ranlib
endif
# ifeq ($(ARFLAGS),)
ARFLAGS := -rcs
# endif
ifeq ($(CXXFLAGS),)
CXXFLAGS := -m68020-60 -fomit-frame-pointer -fno-strict-aliasing -O2
endif

INC_DIR = "include"

C_LIB_SOURCES = AcroForm.cc Annot.cc Array.cc BuiltinFont.cc BuiltinFontTables.cc CMap.cc Catalog.cc CharCodeToUnicode.cc Decrypt.cc Dict.cc DisplayState.cc Error.cc FontEncodingTables.cc Function.cc Gfx.cc GfxFont.cc GfxState.cc GlobalParams.cc HTMLGen.cc ImageOutputDev.cc JArithmeticDecoder.cc JBIG2Stream.cc JPXStream.cc Lexer.cc Link.cc NameToCharCode.cc Object.cc OptionalContent.cc Outline.cc OutputDev.cc PDF417Barcode.cc PDFCore.cc PDFDoc.cc PDFDocEncoding.cc PSOutputDev.cc PSTokenizer.cc Page.cc Parser.cc PreScanOutputDev.cc SecurityHandler.cc ShadingImage.cc SplashOutputDev.cc Stream.cc TextOutputDev.cc TextString.cc TileCache.cc TileCompositor.cc TileMap.cc UTF8.cc UnicodeMap.cc UnicodeRemapping.cc UnicodeTypeTable.cc WebFont.cc XFAScanner.cc XRef.cc Zoox.cc
C_LIB_OBJECTS = AcroForm.o Annot.o Array.o BuiltinFont.o BuiltinFontTables.o CMap.o Catalog.o CharCodeToUnicode.o Decrypt.o Dict.o DisplayState.o Error.o FontEncodingTables.o Function.o Gfx.o GfxFont.o GfxState.o GlobalParams.o HTMLGen.o ImageOutputDev.o JArithmeticDecoder.o JBIG2Stream.o JPXStream.o Lexer.o Link.o NameToCharCode.o Object.o OptionalContent.o Outline.o OutputDev.o PDF417Barcode.o PDFCore.o PDFDoc.o PDFDocEncoding.o PSOutputDev.o PSTokenizer.o Page.o Parser.o PreScanOutputDev.o SecurityHandler.o ShadingImage.o SplashOutputDev.o Stream.o TextOutputDev.o TextString.o TileCache.o TileCompositor.o TileMap.o UTF8.o UnicodeMap.o UnicodeRemapping.o UnicodeTypeTable.o WebFont.o XFAScanner.o XRef.o Zoox.o

C_TARGETS = libxpdf.a

ALL_TARGETS = $(C_TARGETS)

lib: $(C_TARGETS)

install: $(C_TARGETS)
	install $(C_TARGETS) $(PREFIX)/lib/

uninstall:
	rm -f $(PREFIX)/lib/$(C_TARGETS)

$(C_TARGETS): $(C_LIB_OBJECTS) $(C_LIB_SOURCES:.c*=.h)

all: $(ALL_TARGETS)

$(C_LIB_OBJECTS):
	# $(CXX) $(CXXFLAGS) $(C_LIB_SOURCES) -o $@
	$(CXX) $(CXXFLAGS) -c $(C_LIB_SOURCES)

libxpdf.a:
	$(AR) $(ARFLAGS) $@ $(C_LIB_OBJECTS)

clean:
	rm -f $(C_LIB_OBJECTS)

clean-all:
	rm -f $(ALL_TARGETS) $(C_LIB_OBJECTS)