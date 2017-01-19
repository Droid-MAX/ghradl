SCRIPT = ghradl
BIN := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))/bin/$(SCRIPT)

DEFAULT_PREFIX = ~/.local
PREFIX := $(DEFAULT_PREFIX)

all:
	@echo "Run 'make install' to link $(SCRIPT) into $(PREFIX)/bin"
	@echo "Run 'make uninstall' to unlink $(SCRIPT) into $(PREFIX)/bin"
	@echo ""
	@echo "The default prefix is $(DEFAULT_PREFIX)"
	@echo "Run 'make PREFIX=<path> [install|uninstall]' to link the scripts elsewhere"
	@echo "WARNING: Make does not handle spaces in paths!"

install:
	@echo "Linking $(SCRIPT) into $(PREFIX)/bin"
	@echo ""
	mkdir -p $(PREFIX)/bin
	ln -sf $(BIN) $(PREFIX)/bin

uninstall:
	@echo "Unlinking $(SCRIPT) from $(PREFIX)/bin"
	@echo ""
	find $(PREFIX)/bin -maxdepth 1 -name $(SCRIPT) -type l -exec rm {} +
