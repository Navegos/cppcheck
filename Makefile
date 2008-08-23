SRCS=CheckBufferOverrun.cpp  CheckClass.cpp  CheckHeaders.cpp  CheckMemoryLeak.cpp  CheckOther.cpp  CommonCheck.cpp  tokenize.cpp
OBJS=$(SRCS:%.cpp=%.o)
	

%.o:	%.cpp
	g++ -Wall -pedantic -g -I. -o $@ -c $^

all:	${OBJS} main.o
	g++ -Wall -g -o cppcheck $^
test:	${OBJS} TestsRunner.o	MiniCppUnit.o	testmemleak.o	testbufferoverrun.o	testdivision.o
	g++ -Wall -g -o testsrunner $^
clean:
	rm -f *.o cppcheck_test cppcheck
