# Basic Makefile for (un)installing the files, and creating archives manually.
#
# Supports standard GNU Makefile variables for specifying the paths:
# * prefix
# * datarootdir
# * datadir
# * DESTDIR
#

SHELL        = /bin/bash

AUTHOR       = adobe
PACKAGE      = mapping-resources-pdf
NAME         = $(AUTHOR)-$(PACKAGE)

# So far there's no versioning in place. If there will be any, then we will
# switch to commented line below...
VERSION      =
ARCHIVE_NAME = $(NAME)
#ARCHIVE_NAME = $(NAME)-$(VERSION)

GIT_ARCHIVE_TYPE = tar.gz

prefix       = /usr/local
datarootdir  = $(prefix)/share
datadir      = $(datarootdir)
packagedir   = $(datadir)/$(AUTHOR)/resources/mapping

# Folder names:
PDF_mappings_other = pdf2other
PDF_mappings_unicode = pdf2unicode

# Other related files:
DISTFILES    =                          \
	LICENSE.txt                     \
	Makefile                        \
	README.md                       \

.PHONY: install uninstall

# Create the necessary directories first, and then install all the files:
install:
	install -m 0755 -d $(DESTDIR)$(packagedir)
	install -m 0755 -d $(DESTDIR)$(packagedir)/$(PDF_mappings_other)
	install -m 0755 -d $(DESTDIR)$(packagedir)/$(PDF_mappings_unicode)

	install -m 0644 -p $(PDF_mappings_other)/*   $(DESTDIR)$(packagedir)/$(PDF_mappings_other)/
	install -m 0644 -p $(PDF_mappings_unicode)/* $(DESTDIR)$(packagedir)/$(PDF_mappings_unicode)/

# Other files might be written in $(packagedir), remove only what has been installed:
uninstall:
	rm -rf $(DESTDIR)$(packagedir)/$(PDF_mappings_other)
	rm -rf $(DESTDIR)$(packagedir)/$(PDF_mappings_unicode)

# We are putting the source files into subfolder, same as Github does for its releases:
git-archive:
	git archive -v --format=$(GIT_ARCHIVE_TYPE) --prefix=$(ARCHIVE_NAME)/ HEAD -o $(ARCHIVE_NAME).$(GIT_ARCHIVE_TYPE)

# The --transform option is what will put the source files into a $(ARCHIVE_NAME) subdirectory:
tar.bz2:
	tar --transform="s|^|$(ARCHIVE_NAME)/|" -cjvf $(ARCHIVE_NAME).tar.bz2 $(PDF_mappings_other) $(PDF_mappings_unicode) $(DISTFILES)

tar.gz:
	tar --transform="s|^|$(ARCHIVE_NAME)/|" -czvf $(ARCHIVE_NAME).tar.gz  $(PDF_mappings_other) $(PDF_mappings_unicode) $(DISTFILES)

tar.xz:
	tar --transform="s|^|$(ARCHIVE_NAME)/|" -cJvf $(ARCHIVE_NAME).tar.xz  $(PDF_mappings_other) $(PDF_mappings_unicode) $(DISTFILES)
