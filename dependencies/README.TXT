First, run get_deps.sh to pull source code from the web.  Then compile each package.

Lua:
cd into the src/ directory then run "make liblua.a"

Ogre:
run "make -f ../grit_ogre.mk"
Ogre has a heap of dependencies: boost_thread libfreeimage libzzip

Bullet:
run ./autogen.sh, then ./configure, then jam

Quex:
nothing to do, it's a python script
(you may have to install python though)
