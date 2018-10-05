#
# makefile for image and color utilities C library
#
#

CC = gcc -std=gnu99
FLAGS = -Wall
INCLUDES = -lm

imageDriver: imageUtils.o colorUtils.o imageDriver.c
	$(CC) $(FLAGS) $(INCLUDES) imageUtils.o colorUtils.o imageDriver.c -o imageDriver

imageUtils.o: imageUtils.c imageUtils.h
	$(CC) $(FLAGS) $(INCLUDES) -c imageUtils.c -o imageUtils.o

colorUtilsTesterCmocka: colorUtils.o colorUtilsTesterCmocka.c
	$(CC) $(FLAGS) colorUtils.o colorUtilsTesterCmocka.c -o colorUtilsTesterCmocka $(INCLUDES) -l cmocka

colorUtils.o: colorUtils.c colorUtils.h
	$(CC) $(FLAGS) $(INCLUDES) -c colorUtils.c -o colorUtils.o

clean:
	rm -f *~ *.o
