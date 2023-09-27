SUBDIRS = goo fofi splash xpdf
DESTDIR = xpdf_mint_release
PREFIX = $(DESTDIR)/usr
INCLUDE_DIR = $(PREFIX)/include/xpdf_mint
LIB_DIR = $(PREFIX)/lib
CONF_HEADERS = aconf.h aconf2.h

all:
	mkdir -p $(INCLUDE_DIR) $(LIB_DIR);
	for conf_file in $(CONF_HEADERS); do \
		cp -a $$conf_file $(INCLUDE_DIR); \
	done; \
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir; \
		cp -a $$dir/lib$${dir}.a $(LIB_DIR); \
		mkdir $(INCLUDE_DIR)/$${dir}; \
		cp -a $$dir/*.h $(INCLUDE_DIR)/$$dir; \
	done

clean:
	for dir in $(SUBDIRS); do \
		$(MAKE) clean -C $$dir; \
	done

clean-distrib:
	rm -rf $(DESTDIR)