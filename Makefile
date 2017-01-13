SCRIPT = ghradl
BIN := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))/bin/$(SCRIPT)

DEFAULT_PREFIX = ~/.local/bin
PREFIX := $(DEFAULT_PREFIX)

all:
	@echo "Run 'make install' to link $(SCRIPT)"
	@echo "Run 'make uninstall' to unlink $(SCRIPT)"
	@echo ""
	@echo "The default install directory is $(DEFAULT_PREFIX)"
	@echo "Run 'make PREFIX=<path> [install|uninstall]' to link the scripts elsewhere"
	@echo "WARNING: Make does not handle spaces in paths!"

install:
	@echo "Linking $(SCRIPT) to $(BIN) in $(PREFIX)"
	@echo ""
	mkdir -p $(PREFIX)
	ln -sf $(BIN) $(PREFIX)

uninstall:
	@echo "Unlinking $(SCRIPT) from $(PREFIX)"
	@echo ""
	find $(PREFIX) -maxdepth 1 -name $(SCRIPT) -type l -exec rm {} +
