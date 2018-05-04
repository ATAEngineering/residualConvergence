# Set CHEM_BASE to point to the CHEM installation directory to compile
# this module
#
# To use a module, compile the module and then put the resulting shared object
# file either in the installed lib directory with chem or some other place that
# is contained in the LD_LIBRARY_PATH.  Once this is done, the module can be
# by placing 'loadModule: MODULE_NAME' into the top of the vars file
#
# Makefile SETUP:
# Set CHEM_BASE to the directory where CHEM is installed
# Set MODULE_NAME to the name of your module
# Set OBJS to list '.o' files that will be compiled into your module

CHEM_BASE?=/usr/local/loci/chem/chem

MODULE_NAME=residualConvergence

# Put objects in the module here
OBJS = residualConvergence.o

###########################################################################
# No changes required below this line
###########################################################################
include $(CHEM_BASE)/chem.conf
include $(LOCI_BASE)/Loci.conf

INCLUDES = -I$(CHEM_BASE)/include -I$(CHEM_BASE)/include/fluidPhysics
#uncomment this for a debugging compile
#COPT=-O0 -g 

LOCAL_LIBS = 

JUNK = *~  core ti_files ii_files rii_files

LIB_OBJS=$(OBJS:.o=_lo.o)

all: $(MODULE_NAME)_m.so 

$(MODULE_NAME)_m.so: $(LIB_OBJS)
	$(SHARED_LD) $(SHARED_LD_FLAGS) $(MODULE_NAME)_m.so $(LIB_FLAGS) $(LIB_OBJS)
FRC : 

clean:
	rm -fr $(OBJS) $(LIB_OBJS) $(MODULE_NAME)_m.so $(JUNK)

install: $(MODULE_NAME)_m.so
	cp $(MODULE_NAME)_m.so $(CHEM_BASE)/lib

LOCI_FILES = $(wildcard *.loci)
LOCI_LPP_FILES = $(LOCI_FILES:.loci=.cc)

distclean: 
	rm $(DEPEND_FILES)
	rm -fr $(OBJS) $(LIB_OBJS) $(MODULE_NAME)_m.so $(JUNK) $(LOCI_LPP_FILES)

DEPEND_FILES=$(subst .o,.d,$(OBJS))


#include automatically generated dependencies
-include $(DEPEND_FILES)
