PWD = $(shell pwd)
SRC_DIR = $(PWD)/../../src/

TOPLEVEL_LANG = verilog
VERILOG_SOURCES = $(wildcard $(SRC_DIR)/*.v)
SIM = vcs

include $(shell cocotb-config --makefiles)/Makefile.sim


test:
	@echo $(SRC_DIR)
	@echo $(VERILOG_SOURCES)
