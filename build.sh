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
cd ../luafilesystem-1.5.0
make
cp src/lfs.so $LUA_LIB
cd ../luasocket-2.0.2
make
mkdir -p $LUA_LIB/socket
mkdir -p $LUA_LIB/mime
cp src/http.lua src/url.lua src/tp.lua src/ftp.lua src/smtp.lua src/socket.so $LUA_LIB/socket
cp src/ltn12.lua src/socket.lua src/mime.lua   $LUA_LIB
cp src/mime.so  $LUA_LIB/mime
