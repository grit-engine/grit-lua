LUA_WEAK_C_SRCS= \
	lapi.c \
	lcode.c \
	lctype.c \
	ldebug.c \
	ldo.c \
	ldump.c \
	lfunc.c \
	lgc.c \
	llex.c \
	lmem.c \
	lobject.c \
	lopcodes.c \
	lparser.c \
	lstate.c \
	lstring.c \
	ltable.c \
	ltm.c \
	lundump.c \
	lvm.c \
	lzio.c \
	\
	lauxlib.c\
	lbaselib.c\
	lbitlib.c\
	lcorolib.c\
	ldblib.c\
	liolib.c\
	lmathlib.c\
	loslib.c\
	lstrlib.c\
	ltablib.c\
	loadlib.c\
	linit.c\

LUA_INCLUDE_DIRS= \
	.

LUA_DEFS= \
	LUA_USE_APICHECK \
	LUA_USE_MKSTEMP \
	LUA_USE_READLINE \

LUA_LDLIBS= \
	-lm \
	-lreadline \
