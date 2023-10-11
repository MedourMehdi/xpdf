BIN_FILES = pdfdetach pdffonts pdfimages pdfinfo pdftohtml pdftopng pdftoppm pdftops pdftotext
ifeq ($(DESTDIR),)
DESTDIR := xpdf_mint_release
endif
ifeq ($(PREFIX),)
PREFIX := $(DESTDIR)/usr
endif
BIN_DIR = $(PREFIX)/bin

all:
	mkdir -p ../$(BIN_DIR);
	for bin_file in $(BIN_FILES); do \
		$(MAKE) -f $$bin_file.mk; \
	done; \
	cp -a ./bin/* ../$(BIN_DIR)


clean:
	for bin_file in $(BIN_FILES); do \
		$(MAKE) -f $$bin_file.mk clean; \
	done; \