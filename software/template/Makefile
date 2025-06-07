include /f-of-e-tools/tools/sunflower/conf/setup.conf

TREEROOT = $(SUNFLOWERROOT)
GB3_ROOT = /gb3-resources

TARGET-ARCH	= riscv32-elf
TARGET		= riscv

PROGRAM		= template
INIT		= init

INCLUDE_DIR = ../include

OPTFLAGS	= -O0
CFLAGS		= -march=rv32i -mabi=ilp32 $(TARGET-ARCH-FLAGS) -Wall
ASFLAGS		= --march=rv32i --mabi=ilp32
INCLUDES	= -I$(INCLUDE_DIR)
LDFLAGS		= -L$(TOOLSLIB)/$(TARGET) -Map $(PROGRAM).map -Tsail.ld
SREC2HEX	= srec2hex

OBJS		=\
		$(INIT).o\
		$(PROGRAM).o\

nosf:	$(PROGRAM) $(PROGRAM).sr Makefile

$(INIT).o: $(INIT).S
	$(AS) $(ASFLAGS) $(INIT).S -o $(INIT).o

$(PROGRAM): $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $@ -lc -lm -lgcc

$(PROGRAM).sr:$(PROGRAM)
	$(OBJCOPY) -O srec $(PROGRAM) $@

$(PROGRAM).o: $(PROGRAM).S Makefile
	$(AS) $(ASFLAGS) $(PROGRAM).S -o $(PROGRAM).o


install: nosf
	mkdir -p $(GB3_ROOT)/build/programs/
	$(SREC2HEX) -b 16384 $(PROGRAM).sr
	cp program.hex $(GB3_ROOT)/build/programs/
	cp data.hex $(GB3_ROOT)/build/programs/
	cp $(PROGRAM) $(GB3_ROOT)/build/programs/object

clean:
	$(RM) init.i *.o $(PROGRAM) $(PROGRAM).sr $(PROGRAM).map
	$(RM) $(GB3_ROOT)/build/programs/program.hex $(GB3_ROOT)/build/programs/data.hex $(GB3_ROOT)/build/programs/object
