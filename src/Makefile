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
# <Put a Description Here>
#
# Use: make [TARGET] [PLATFORM-OVERRIDES]
#
# Build Targets:
#      
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

# Platform Overrides
PLATFORM = 

# Architectures Specific Flags
LINKER_FILE = MKL25Z128xxx4_flash.ld
CPU = 
ARCH = 
SPECS = 

# Compiler Flags and Defines
CC = 
LD = 
LDFLAGS = 
CFLAGS = 
CPPFLAGs = 