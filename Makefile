#******************************************************************************
# Copyright (C) 2017 by Alex Fosdick - University of Colorado
#
# Redistribution, modification or use of this software in source or binary
# forms is permitted as long as the files maintain this copyright. Users are 
# permitted to modify this and use it to learn about the field of embedded
# software. Alex Fosdick and the University of Colorado are not liable for any
# misuse of this material. 
#
#*****************************************************************************

#------------------------------------------------------------------------------
# Simple makefile for a build system for two target platforms
# Use: make [TARGET] [PLATFORM-OVERRIDES]
#
# Build Targets:
#		<FILE>.i  		Builds <FILE>.i implementation file (-E flag)
#		<FILE>.asm  	Builds <FILE>.asm assembly file 	(-S flag and objdump)
#		<FILE>.o  		Builds <FILE>.o object files 		(WIthout linking)
#		compile-all 	Compiles all object files without linking
#		build 			Compiles and links all object files into a final executable
#						Needes a.PHONY protection 
#		clean 			Removes all generated files
#						Needs a .PHONY protection
#
# Platform Overrides:
#		MSP432
#		HOST
#
#------------------------------------------------------------------------------
include sources.mk

# Architectures Specific Flags - only for ARM
CPU = cortex-m4
ARCH = thumb
MARCH = armv7e-m
MFLOATABI = hard
MFPU = fpv4-sp-d16
SPECS = nosys.specs

# Platform Specific Flags - only for MSP432
LINKER_FILE = MKL25Z128xxx4_flash.ld

# Compiler Flags and Defines
TARGET = c1m2
CPPFLAGS = $(INCLUDES) 
CFLAGS  = -Wall -Werror -g -O0 -std=c99 -I
LDFLAGS = -Wl,-Map=$(TARGET).map -T $(LINKER_FILE)

ifeq ($(PLATFORM),HOST)
	CC = gcc 
else
	CC = arm-none-eabi-gcc 
endif

OBJECTS = $(SOURCES:.c=.o)

%.o : %.c
	$(CC) -c $< $(CFLAGS) -o $@

.PHONY: build
build: all

.PHONY: all
all: $(TARGET).out

$(TARGET).out: $(OBJECTS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@

.PHONY: clean
clean:
	rm -f $(OBJECTS) $(TARGET).out $(TARGET).map