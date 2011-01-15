#!/bin/sh
DEST_DIR=../distrib/root/usr
cd lua-5.1.4/
make
mkdir -p $DEST_DIR/bin
mkdir -p $DEST_DIR/include
strip src/lua src/luac
cp src/lua src/luac $DEST_DIR/bin
cp src/lua.h src/luaconf.h src/lualib.h src/lauxlib.h etc/lua.hpp $DEST_DIR/include
