GCC = gcc
CFLAGS = -g -fprofile-arcs -ftest-coverage 
OBJECTS = simple_vector.o simple_xml.o
TESTPRG = test

all: test

# Deps
simple_vector.o: simple_vector.h
simple_xml.o: simple_vector.o simple_xml.h

%.o: %.c
	$(GCC) $(CFLAGS) -c $< -lgcov

test: test.c $(OBJECTS)
	$(GCC) $(CFLAGS) -c test.c -lgcov
	$(GCC) $(OBJECTS) test.o -o $(TESTPRG) -lgcov

clean:
	rm -rf *.o $(TESTPRG)
