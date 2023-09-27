_CC = m68k-atari-mint-g++
SRC_DIR := ./
OBJ_DIR := ./build
BIN_DIR := ./bin

LIB_XPDF := $(shell realpath ../xpdf/libxpdf.a)
LIB_FOFI := $(shell realpath ../fofi/libfofi.a)
LIB_GOO := $(shell realpath ../goo/libgoo.a)
LIB_SPLASH := $(shell realpath ../splash/libsplash.a)

SRC := $(wildcard $(SRC_DIR)/pdftotext.cpp)

BIN := $(BIN_DIR)/pdftotext.ttp

OBJ := $(SRC:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

_CPPFLAGS := -I./

_CFLAGS   := -m68020-60 -fomit-frame-pointer -fno-strict-aliasing -O2 

_LDFLAGS  :=

_LDLIBS   := $(LIB_XPDF) $(LIB_FOFI) $(LIB_GOO) $(LIB_SPLASH) -lpng16 -lz -lpthread -lfreetype -lbz2

.PHONY: all clean

all: $(BIN)

$(BIN): $(OBJ) | $(BIN_DIR)
	$(_CC) $(_LDFLAGS) $^ $(_LDLIBS) -o $@
	m68k-atari-mint-strip $(BIN)
	
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	@mkdir -p $(@D)
	$(_CC) $(_CPPFLAGS) $(_CFLAGS) -c $< -o $@

$(BIN_DIR) $(OBJ_DIR):
	@mkdir -p $(@D)

clean:
	@$(RM) -rv $(BIN) $(OBJ_DIR)

-include $(OBJ:.o=.d)