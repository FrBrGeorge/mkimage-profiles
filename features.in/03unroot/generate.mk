# this makefile is used as the last step during an individual
# feature configuration (that is, while building the actual profile
# from subprofiles and requested features)
#
# please note, it runs *after* copying subdirectories corresponding
# to requested subprofiles and *after* running generate.sh, see also
# features.in/Makefile
#
# for a real-world example, see syslinux feature

include $(BUILDDIR)/distcfg.mk

ifeq (,$(03NPL))
$(warning this is a "root-delition and strict-polkit addon" feature, who might want to include it? B])
endif

all:
	echo "03unroot added"
