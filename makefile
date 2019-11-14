vpath %.c ./Src
vpath %.h ./Inc
CC = gcc_S
SRC_PATH = ./Src/
LINK_TARGET = app.exe
INCLUDE_PATH = ./Inc/
DEPENDENCY_PATH = ./Dependencies/
OBJ = main.o LCD.o DIO.o
CLEAN_TARGET = $(LINK_TARGET) $(OBJ)
all:$(LINK_TARGET)
	echo Building done !
clean:
	-rm $(CLEAN_TARGET)
	echo Cleaning done !
$(LINK_TARGET): $(OBJ) code.o
# name of the specified object file should be explicitly added here
	$(CC) $(OBJ) code.o -o $@
# and here also
	echo Linking done !
%.o: %.c
	$(CC) -c -I$(INCLUDE_PATH) $< -o $@
# rule to generate a dep file by using the C preprocessor
%(DEPENDENCY_PATH).d: %.c
	$(CC) $(CFLAGS) $< -MM -MT $(@:$(DEPENDENCY_PATH).d=.o) >$@
