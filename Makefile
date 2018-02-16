# My first makefile for any major project

CXX = g++
CXXFLAGS =
CPPFLAGS = -I ~/Hydra/include -I /usr/local/include/ -w
LDFLAGS =	-F /System/Library/Frameworks/ -L /usr/local/lib/ \
		-framework IOKit \
		-l glfw3 \
		-l GLEW.2.1.0 \
		-framework OpenGL \
		-framework CoreGraphics \
		-framework CoreFoundation \
		-framework CoreVideo \
		-framework Cocoa
SRCS = $(wildcard src/*.cpp)
OBJS = $(SRCS:src/%.cpp=objects/%.o)

all		: bin/main

objects/%.o	: src/%.cpp
		$(CXX) -M -MF build/$*.d $(CPPFLAGS) $<
		$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

clean 		:
		rm build/* objects/* bin/*

bin/main	: $(OBJS)
		$(CXX) $(LDFLAGS) $(OBJS) -o $@