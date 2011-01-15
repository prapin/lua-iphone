
LIB_OPTION=-bundle -undefined dynamic_lookup
# change these to reflect your Lua installation
PREFIX=		/usr/local
LUAVERSION=	5.1
LUAINC= 	$(PREFIX)/include
LUA_LIBDIR= 	$(PREFIX)/lib/lua/$(LUAVERSION)
LUABIN= 	$(PREFIX)/bin
LUA_DIR= $(PREFIX)/share/lua/$(LUAVERSION)
CC=gcc

all: src/alien/core.so src/alien/struct.so tests/libalientest$(LIB_EXT)

src/alien/core.o: src/alien/core.c
	$(CC) -c $(CFLAGS) -o src/alien/core.o src/alien/core.c
	
src/alien/core.so: src/alien/core.o
	export MACOSX_DEPLOYMENT_TARGET=10.3; $(CC) $(LIB_OPTION) -o src/alien/core.so src/alien/core.o -lgcc -lffi

src/alien/struct.so: src/alien/struct.o 
	export MACOSX_DEPLOYMENT_TARGET=10.3; $(CC) $(LIB_OPTION) -o src/alien/struct.so src/alien/struct.o

install: src/alien/core.so src/alien/struct.so
	mkdir -p $(LUA_LIBDIR)/alien
	cp src/alien/core.so $(LUA_LIBDIR)/alien
	#mkdir -p $(LUA_LIBDIR)/alien
	cp src/alien/struct.so $(LUA_LIBDIR)/alien
	cp src/alien.lua $(LUA_DIR)/
	#chmod +x src/constants
	#cp src/constants $(BIN_DIR)/
	#cp -r tests $(PREFIX)/
	#cp -r samples $(PREFIX)/
	#cp -r doc $(PREFIX)/

clean:
	find . -name "*.so" -o -name "*.o" -o -name "*.dylib" | xargs rm -f

upload-cvs:
	git archive --output alien-current.tar.gz master
	ncftpput -u mascarenhas ftp.luaforge.net alien/htdocs alien-current.tar.gz

upload-dist:
	git archive --output alien-$(VERSION).tar.gz master
	ncftpput -u mascarenhas ftp.luaforge.net alien/htdocs alien-$(VERSION).tar.gz
	ncftpput -u mascarenhas ftp.luaforge.net alien/htdocs doc/index.html

tests/libalientest$(LIB_EXT): tests/alientest.c
	$(CC) $(LIB_OPTION) $(CFLAGS) -o tests/libalientest$(LIB_EXT) tests/alientest.c

test:
	cd tests && lua -l luarocks.require test_alien.lua
