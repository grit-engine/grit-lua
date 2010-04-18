# makefile for building Lua
# see ../INSTALL for installation instructions
# see ../Makefile and luaconf.h for further customization

# == CHANGE THE SETTINGS BELOW TO SUIT YOUR ENVIRONMENT =======================

# Your platform. See PLATS for possible values.
PLAT= none

CC= gcc
CFLAGS=-g -O0 -Wall -DLUA_USE_MKSTEMP -DLUA_USE_APICHECK
AR= ar rcu
RANLIB= ranlib
RM= rm -f
CAT=cat

# == END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LINE =========

LUA_A= liblua.a
MEGA_C= mega.c
MEGA_O= mega.o
CORE_C=	lapi.c lcode.c ldebug.c ldo.c ldump.c lfunc.c lgc.c llex.c lmem.c \
	lobject.c lopcodes.c lparser.c lstate.c lstring.c ltable.c ltm.c  \
	lundump.c lvm.c lzio.c
LIB_C= lauxlib.c lbaselib.c ldblib.c liolib.c lmathlib.c loslib.c ltablib.c \
	lstrlib.c loadlib.c linit.c

$(LUA_A): $(MEGA_O)
	$(AR) $@ $?
	$(RANLIB) $@

$(MEGA_C): $(LIB_C) $(CORE_C) 

clean:
	$(RM) $(MEGA_O)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

depend:
	@$(CC) $(CFLAGS) -MM $(MEGA_C)

$(MEGA_O): lapi.h lauxlib.h lcode.h ldebug.h ldo.h lfunc.h lgc.h llex.h 
$(MEGA_O): llimits.h lmem.h lobject.h lopcodes.h lparser.h lstate.h lstring.h
$(MEGA_O): ltable.h ltm.h luaconf.h lua.h lualib.h lundump.h lvm.h lzio.h
