
include ./config.make

.PHONY: clean all

all: xfoil

orrs_db: libPlt
	$(MAKE) -C orrs

libPlt:
	@echo "Building libplt"
	$(MAKE) -C plotlib

xfoil: orrs_db libPlt
	@echo "Building xfoil"
	$(MAKE) -C bin

clean:
	@echo "Cleaning"
	$(MAKE) -C plotlib clean
	$(MAKE) -C orrs clean
	$(MAKE) -C bin clean
	