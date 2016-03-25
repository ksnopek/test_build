  # build an executable named myprog from myprog.c
all: main.cpp 
	g++ -g -Wall -std=c++11 -o main main.cpp
clean: 
	$(RM) main
