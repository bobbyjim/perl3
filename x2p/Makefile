# $Header: Makefile.SH,v 3.0.1.1 89/10/26 23:29:11 lwall Locked $
#
# $Log:	Makefile.SH,v $
# Revision 3.0.1.1  89/10/26  23:29:11  lwall
# patch1: in x2p/Makefile.SH, added dependency on ../config.sh
# 
# Revision 3.0  89/10/18  15:33:52  lwall
# 3.0 baseline
# 
# Revision 2.0.1.2  88/09/07  17:13:30  lwall
# patch14: added redirection of stderr to /dev/null
# 
# Revision 2.0.1.1  88/07/11  23:13:39  root
# patch2: now expects more shift/reduce errors
# 
# Revision 2.0  88/06/05  00:15:31  root
# Baseline version 2.0.
# 
# 

CC = cc
bin = /usr/local/bin
lib = 
mansrc = /usr/man/man1
manext = 1
CFLAGS = -E -O
LDFLAGS = 
SMALL = 
LARGE =  
mallocsrc = 
mallocobj = 

libs =  -lm 

public = a2p s2p

private = 

manpages = a2p.man s2p.man

util =

sh = Makefile.SH makedepend.SH

h = EXTERN.h INTERN.h config.h handy.h hash.h a2p.h str.h util.h

c = hash.c $(mallocsrc) str.c util.c walk.c

obj = hash.o $(mallocobj) str.o util.o walk.o

lintflags = -phbvxac

addedbyconf = Makefile.old bsd eunice filexp loc pdp11 usg v7

# grrr
SHELL = /bin/sh

.c.o:
	$(CC) -c $(CFLAGS) $(LARGE) $*.c

all: $(public) $(private) $(util)
	touch all

a2p: $(obj) a2p.o
	$(CC) $(LARGE) $(LDFLAGS) $(obj) a2p.o $(libs) -o a2p

a2p.c: a2p.y
	@ echo Expect 208 shift/reduce conflicts...
	yacc a2p.y
	mv y.tab.c a2p.c

a2p.o: a2p.c a2py.c a2p.h EXTERN.h util.h INTERN.h handy.h ../config.h
	$(CC) -c $(CFLAGS) $(LARGE) a2p.c

install: a2p s2p
# won't work with csh
	export PATH || exit 1
	- mv $(bin)/a2p $(bin)/a2p.old 2>/dev/null
	- mv $(bin)/s2p $(bin)/s2p.old 2>/dev/null
	- if test `pwd` != $(bin); then cp $(public) $(bin); fi
	cd $(bin); \
for pub in $(public); do \
chmod +x `basename $$pub`; \
done
#	chmod +x makedir
#	- ./makedir `filexp $(lib)`
#	- \
#if test `pwd` != `filexp $(lib)`; then \
#cp $(private) `filexp $(lib)`; \
#fi
#	cd `filexp $(lib)`; \
#for priv in $(private); do \
#chmod +x `basename $$priv`; \
#done
	- if test `pwd` != $(mansrc); then \
for page in $(manpages); do \
cp $$page $(mansrc)/`basename $$page .man`.$(manext); \
done; \
fi

clean:
	rm -f *.o

realclean:
	rm -f a2p *.orig */*.orig *.o core $(addedbyconf)

# The following lint has practically everything turned on.  Unfortunately,
# you have to wade through a lot of mumbo jumbo that can't be suppressed.
# If the source file has a /*NOSTRICT*/ somewhere, ignore the lint message
# for that spot.

lint:
	lint $(lintflags) $(defs) $(c) > a2p.fuzz

depend: ../makedepend
	../makedepend

clist:
	echo $(c) | tr ' ' '\012' >.clist

hlist:
	echo $(h) | tr ' ' '\012' >.hlist

shlist:
	echo $(sh) | tr ' ' '\012' >.shlist

config.sh: ../config.sh
	rm -f config.sh
	ln ../config.sh .

# AUTOMATICALLY GENERATED MAKE DEPENDENCIES--PUT NOTHING BELOW THIS LINE
# If this runs make out of memory, delete /usr/include lines.
hash.o: ../config.h
hash.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
hash.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
hash.o: /usr/include/_ansi.h
hash.o: /usr/include/_newlib_version.h
hash.o: /usr/include/bits/byteswap.h
hash.o: /usr/include/bits/endian.h
hash.o: /usr/include/bits/wordsize.h
hash.o: /usr/include/ctype.h
hash.o: /usr/include/cygwin/config.h
hash.o: /usr/include/endian.h
hash.o: /usr/include/machine/_default_types.h
hash.o: /usr/include/machine/_endian.h
hash.o: /usr/include/machine/_types.h
hash.o: /usr/include/machine/endian.h
hash.o: /usr/include/machine/ieeefp.h
hash.o: /usr/include/machine/types.h
hash.o: /usr/include/newlib.h
hash.o: /usr/include/stdio.h
hash.o: /usr/include/sys/_pthreadtypes.h
hash.o: /usr/include/sys/_sigset.h
hash.o: /usr/include/sys/_stdint.h
hash.o: /usr/include/sys/_timespec.h
hash.o: /usr/include/sys/_timeval.h
hash.o: /usr/include/sys/_types.h
hash.o: /usr/include/sys/cdefs.h
hash.o: /usr/include/sys/config.h
hash.o: /usr/include/sys/features.h
hash.o: /usr/include/sys/lock.h
hash.o: /usr/include/sys/reent.h
hash.o: /usr/include/sys/select.h
hash.o: /usr/include/sys/stdio.h
hash.o: /usr/include/sys/sysmacros.h
hash.o: /usr/include/sys/timespec.h
hash.o: /usr/include/sys/types.h
hash.o: /usr/include/xlocale.h
hash.o: <built-in>
hash.o: <command-line>
hash.o: a2p.h
hash.o: EXTERN.h
hash.o: handy.h
hash.o: hash.c
hash.o: hash.h
hash.o: str.h
hash.o: util.h
str.o: ../config.h
str.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
str.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
str.o: /usr/include/_ansi.h
str.o: /usr/include/_newlib_version.h
str.o: /usr/include/bits/byteswap.h
str.o: /usr/include/bits/endian.h
str.o: /usr/include/bits/wordsize.h
str.o: /usr/include/ctype.h
str.o: /usr/include/cygwin/config.h
str.o: /usr/include/endian.h
str.o: /usr/include/machine/_default_types.h
str.o: /usr/include/machine/_endian.h
str.o: /usr/include/machine/_types.h
str.o: /usr/include/machine/endian.h
str.o: /usr/include/machine/ieeefp.h
str.o: /usr/include/machine/types.h
str.o: /usr/include/newlib.h
str.o: /usr/include/stdio.h
str.o: /usr/include/sys/_pthreadtypes.h
str.o: /usr/include/sys/_sigset.h
str.o: /usr/include/sys/_stdint.h
str.o: /usr/include/sys/_timespec.h
str.o: /usr/include/sys/_timeval.h
str.o: /usr/include/sys/_types.h
str.o: /usr/include/sys/cdefs.h
str.o: /usr/include/sys/config.h
str.o: /usr/include/sys/features.h
str.o: /usr/include/sys/lock.h
str.o: /usr/include/sys/reent.h
str.o: /usr/include/sys/select.h
str.o: /usr/include/sys/stdio.h
str.o: /usr/include/sys/sysmacros.h
str.o: /usr/include/sys/timespec.h
str.o: /usr/include/sys/types.h
str.o: /usr/include/xlocale.h
str.o: <built-in>
str.o: <command-line>
str.o: a2p.h
str.o: EXTERN.h
str.o: handy.h
str.o: hash.h
str.o: str.c
str.o: str.h
str.o: util.h
util.o: ../config.h
util.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
util.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
util.o: /usr/include/_ansi.h
util.o: /usr/include/_newlib_version.h
util.o: /usr/include/bits/byteswap.h
util.o: /usr/include/bits/endian.h
util.o: /usr/include/bits/wordsize.h
util.o: /usr/include/ctype.h
util.o: /usr/include/cygwin/config.h
util.o: /usr/include/endian.h
util.o: /usr/include/machine/_default_types.h
util.o: /usr/include/machine/_endian.h
util.o: /usr/include/machine/_types.h
util.o: /usr/include/machine/endian.h
util.o: /usr/include/machine/ieeefp.h
util.o: /usr/include/machine/types.h
util.o: /usr/include/newlib.h
util.o: /usr/include/stdio.h
util.o: /usr/include/sys/_pthreadtypes.h
util.o: /usr/include/sys/_sigset.h
util.o: /usr/include/sys/_stdint.h
util.o: /usr/include/sys/_timespec.h
util.o: /usr/include/sys/_timeval.h
util.o: /usr/include/sys/_types.h
util.o: /usr/include/sys/cdefs.h
util.o: /usr/include/sys/config.h
util.o: /usr/include/sys/features.h
util.o: /usr/include/sys/lock.h
util.o: /usr/include/sys/reent.h
util.o: /usr/include/sys/select.h
util.o: /usr/include/sys/stdio.h
util.o: /usr/include/sys/sysmacros.h
util.o: /usr/include/sys/timespec.h
util.o: /usr/include/sys/types.h
util.o: /usr/include/xlocale.h
util.o: <built-in>
util.o: <command-line>
util.o: a2p.h
util.o: EXTERN.h
util.o: handy.h
util.o: hash.h
util.o: INTERN.h
util.o: str.h
util.o: util.c
util.o: util.h
walk.o: ../config.h
walk.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
walk.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
walk.o: /usr/include/_ansi.h
walk.o: /usr/include/_newlib_version.h
walk.o: /usr/include/bits/byteswap.h
walk.o: /usr/include/bits/endian.h
walk.o: /usr/include/bits/wordsize.h
walk.o: /usr/include/ctype.h
walk.o: /usr/include/cygwin/config.h
walk.o: /usr/include/endian.h
walk.o: /usr/include/machine/_default_types.h
walk.o: /usr/include/machine/_endian.h
walk.o: /usr/include/machine/_types.h
walk.o: /usr/include/machine/endian.h
walk.o: /usr/include/machine/ieeefp.h
walk.o: /usr/include/machine/types.h
walk.o: /usr/include/newlib.h
walk.o: /usr/include/stdio.h
walk.o: /usr/include/sys/_pthreadtypes.h
walk.o: /usr/include/sys/_sigset.h
walk.o: /usr/include/sys/_stdint.h
walk.o: /usr/include/sys/_timespec.h
walk.o: /usr/include/sys/_timeval.h
walk.o: /usr/include/sys/_types.h
walk.o: /usr/include/sys/cdefs.h
walk.o: /usr/include/sys/config.h
walk.o: /usr/include/sys/features.h
walk.o: /usr/include/sys/lock.h
walk.o: /usr/include/sys/reent.h
walk.o: /usr/include/sys/select.h
walk.o: /usr/include/sys/stdio.h
walk.o: /usr/include/sys/sysmacros.h
walk.o: /usr/include/sys/timespec.h
walk.o: /usr/include/sys/types.h
walk.o: /usr/include/xlocale.h
walk.o: <built-in>
walk.o: <command-line>
walk.o: a2p.h
walk.o: EXTERN.h
walk.o: handy.h
walk.o: hash.h
walk.o: str.h
walk.o: util.h
walk.o: walk.c
: Makefile.SH config.sh ; /bin/sh Makefile.SH
: makedepend.SH config.sh ; /bin/sh makedepend.SH
# WARNING: Put nothing here or make depend will gobble it up!
