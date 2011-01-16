Lua for iPhone
==============

Version 5.1.4-1

Introduction
------------

[Lua](http://www.lua.org) is a powerful, fast, lightweight, embeddable scripting language.

Lua combines simple procedural syntax with powerful data description constructs based on associative arrays and extensible semantics. 
Lua is dynamically typed, runs by interpreting bytecode for a register-based virtual machine, and has automatic memory management with incremental garbage collection, making it ideal for configuration, scripting, and rapid prototyping. 

Lua for iPhone is a console distribution of Lua for jailbroken iPhones, that can be run interactively using
a SSH connection or MobileTerminal, or through scripts files just like Bash shell scripts.

Distribution
------------

Lua for iPhone is available as a .deb package through Cydia. The package installs the main interpreter executable
`lua`, a compiler interface `luac`, and a few common libraries. 

The interpreter as been patched to support completion using Readline, so try to press the `<tab>` key 
to obtain a list of matching words in the context. Please note however that the completion list
is just a cue and is by no mean exhaustive.

Documentation
-------------

Below is the official documentation of Lua and its installed modules:

* [Lua 5.1.4](lua/readme.html): the language and the standard libraries.
* [LuaFileSystem 1.5.0](lfs/index.html): an extension to deal with the file system.
* [LuaSocket 2.0.2](luasocket/index.html): a module with complete support for client/server networking.
* [CGILua 5.1.3](cgilua/index.html): a pure Lua module to implement CGI and Lua pages (similar to PHP).
* [Alien 5.0.0](alien/index.html): a library to call foreign functions from dynamic libraries.
* [Luaposix 5.1.7](http://alpinelinux.org/wiki/Luaposix): an extension to call POSIX functions like fork.
