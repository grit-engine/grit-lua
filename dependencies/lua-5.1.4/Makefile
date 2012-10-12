# makefile for building Lua

include ../../common.mk

LUA_CFLAGS = -DLUA_USE_MKSTEMP -DLUA_USE_APICHECK

# == END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LINE =========

LUA_A= liblua.a

$(LUA_A): mega.c
	$(CC) $(CFLAGS) $(LUA_CFLAGS) -c $< -o mega.o
	ar -rcus $@ mega.o

interpreter: interpreter.c $(LUA_A)
	$(CC) $(CFLAGS) $< $(LUA_A) -lm -o $@

test: test.c $(LUA_A)
	$(CC) $(CFLAGS) $< $(LUA_A) -lm -o $@


%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -fv mega.o test interpreter $(LUA_A)

$(LUA_A): lapi.c lua.h luaconf.h lapi.h lobject.h llimits.h ldebug.h lstate.h
$(LUA_A): ltm.h lzio.h lmem.h ldo.h lfunc.h lgc.h lstring.h ltable.h lundump.h
$(LUA_A): lvm.h lcode.c lcode.h llex.h lopcodes.h lparser.h ldebug.c ldo.c
$(LUA_A): ldump.c lfunc.c lgc.c llex.c lmem.c lobject.c lopcodes.c lparser.c
$(LUA_A): lstate.c lstring.c ltable.c ltm.c lundump.c lvm.c lzio.c lauxlib.c
$(LUA_A): lauxlib.h lbaselib.c lualib.h ldblib.c liolib.c lmathlib.c loslib.c
$(LUA_A): ltablib.c lstrlib.c loadlib.c linit.c
