#!/bin/bash
DISTRIB_ROOT=$PWD/distrib/root/usr
LUA_LIB=$DISTRIB_ROOT/share/lua/5.1
cd lua-5.1.4/
make
mkdir -p $DISTRIB_ROOT/bin
mkdir -p $DISTRIB_ROOT/include
mkdir -p $LUA_LIB
strip src/lua src/luac
cp src/lua src/luac $DISTRIB_ROOT/bin
cp src/lua.h src/luaconf.h src/lualib.h src/lauxlib.h etc/lua.hpp $DISTRIB_ROOT/include
cd ../luaposix-5.1.7
export C_INCLUDE_PATH=$DISTRIB_ROOT/include:$C_INCLUDE_PATH
make
cp posix.so $LUA_LIB
