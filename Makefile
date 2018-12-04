#生成共享库

CC=g++
#生成的目标名称
TARGET = libCommon_tool.$(SOEXT)

#当前目录下所有的cpp源文件
SRCS = $(wildcard *.cpp)

#所有的.o文件列表
OBJS=$(SRCS:.cpp=.o)

CCFLAGS = -Wall 
#头文件路径
INCS = -I$(PROJECT_INCS)
CCFLAGS += $(INCS) 

#依赖的动态库
#LIBS = -lpthread 


$(TARGET):$(OBJS)
	#$(CC) -shared -o $@ $<
	$(CC) -shared -o $(TARGET) $^
	cp $(TARGET) $(PROJECT_LIB)
	rm -rf $(OBJS)

clean:
	rm -rf $(TARGET) $(OBJS)
%.o:%.c
	$(CC) $(CFLAG) -o $@ -fPIC -c $<

include $(PROJECT_BASE_MKFILE)/Makefile.GNU
