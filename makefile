LIB_SUBDIRS = goo fofi splash xpdf 
TOOLS_SUBDIRS = tools
ifeq ($(DESTDIR),)
DESTDIR := xpdf_mint_release
endif
ifeq ($(PREFIX),)
PREFIX := $(DESTDIR)/usr
endif
INCLUDE_DIR = $(PREFIX)/include/xpdf_mint
LIB_DIR = $(PREFIX)/lib
CONF_HEADERS = aconf.h aconf2.h
INSTALL = /usr/bin/install -c

all:
	mkdir -p $(INCLUDE_DIR) $(LIB_DIR);
	for conf_file in $(CONF_HEADERS); do \
		cp -a $$conf_file $(INCLUDE_DIR); \
	done; \
	for dir in $(LIB_SUBDIRS); do \
		$(MAKE) -C $$dir; \
		cp -a $$dir/lib$${dir}.a $(LIB_DIR); \
		mkdir -p $(INCLUDE_DIR)/$${dir}; \
		cp -a $$dir/*.h $(INCLUDE_DIR)/$$dir; \
	done; \
	for dir in $(TOOLS_SUBDIRS); do \
		$(MAKE) -C $$dir; \
	done

clean:
	for dir in $(LIB_SUBDIRS); do \
		$(MAKE) clean -C $$dir; \
	done
	for dir in $(TOOLS_SUBDIRS); do \
		$(MAKE) clean -C $$dir; \
	done

clean-distrib:
	for dir in $(TOOLS_SUBDIRS); do \
		$(MAKE) clean -C $$dir; \
	done; \
	for dir in $(LIB_SUBDIRS); do \
		$(MAKE) clean-all -C $$dir; \
	done; \
	rm -rf $(DESTDIR)