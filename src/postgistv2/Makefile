# The name of the shared library to be built from the multiple
# source files in the GeoExt codebase.
MODULE_big = postgistv2

# As our extension uses multiple files, we have to
# set OBJS
OBJS = postgist.o hexutils.o trajectory.o

# The extension name: geoext
EXTENSION = postgist

# Files that will be installed under prefix/share/geoext
DATA = postgistv2--0.1.0.sql  # the script used to install the extension

# SHLIB_LINK += $(filter -lm, $(LIBS) )
# SHLIB_LINK += /usr/lib/postgresql/9.6/lib/postgis-2.3.so `xml2-config --libs`
#
# PG_CPPFLAGS += -I../postgis-2.3 -I../postgis-2.3/postgis -I../postgis-2.3/liblwgeom -I../postgis-2.3/libpgcommon
# PG_CPPFLAGS += `xml2-config --cflags`

SHLIB_LINK = /opt/postgis-2.3.2/libpgcommon/libpgcommon.a /opt/postgis-2.3.2/postgis/postgis-2.3.so -L/usr/local/lib -lgeos_c -lproj -llwgeom

PG_CPPFLAGS = -I/usr/local/include -I/opt/postgis-2.3.2/liblwgeom/ -I/opt/postgis-2.3.2/libpgcommon/ -I/opt/postgis-2.3.2/postgis/ -fPIC


# SHLIB_LINK = /opt/postgis-2.2/libpgcommon/libpgcommon.a /opt/postgis-2.2/postgis/postgis-2.1.so -L/usr/local/lib -lgeos_c -lproj -llwgeom -lxml2 -ljson-c
#
# PG_CPPFLAGS = -I/usr/local/include -I/opt/postgis-2.2/liblwgeom/ -I/opt/postgis-2.2/libpgcommon/ -I/opt/postgis-2.2/postgis/ -I/usr/local/include/libxml2 -fPIC

# Files that will be installed under prefix/doc/geoext
#DOCS = README.geoext

# Build based on pg_config framework
PG_CONFIG = pg_config

PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
