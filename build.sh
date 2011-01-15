#!/bin/bash
DISTRIB_ROOT=$PWD/distrib/usr
LUA_LIB=$DISTRIB_ROOT/share/lua/5.1
mkdir -p $DISTRIB_ROOT/../DEBIAN
cp control $DISTRIB_ROOT/../DEBIAN
cd lua-5.1.4/
make
mkdir -p $DISTRIB_ROOT/bin
mkdir -p $DISTRIB_ROOT/include
mkdir -p $LUA_LIB
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
cp src/http.lua src/url.lua src/tp.lua src/ftp.lua src/smtp.lua $LUA_LIB/socket
cp src/socket.so $LUA_LIB/socket/core.so
cp src/ltn12.lua src/socket.lua src/mime.lua   $LUA_LIB
cp src/mime.so  $LUA_LIB/mime/core.so
cd ../alien-5.0
make
mkdir -p $LUA_LIB/alien
cp src/alien/core.so src/alien/struct.so $LUA_LIB/alien
cp src/alien.lua $LUA_LIB
cd ../cgilua-5.1.3
mkdir -p $LUA_LIB/cgilua
cp src/cgilua/cgilua.lua $LUA_LIB
cp src/cgilua/authentication.lua src/cgilua/cookies.lua src/cgilua/dispatcher.lua src/cgilua/loader.lua src/cgilua/lp.lua src/cgilua/mime.lua src/cgilua/post.lua src/cgilua/readuntil.lua src/cgilua/serialize.lua src/cgilua/session.lua src/cgilua/urlcode.lua $LUA_LIB/cgilua
cd ..
dpkg-deb -b distrib lua-5.1.4-1.deb
echo "To test the installation, run"
echo "    sudo dpkg -i lua-5.1.4-1.deb"
echo "    sudo dpkg -r lua51"
