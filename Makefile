# $Header: Makefile.SH,v 3.0.1.1 89/10/26 23:00:38 lwall Locked $
#
# $Log:	Makefile.SH,v $
# Revision 3.0.1.1  89/10/26  23:00:38  lwall
# patch1: Makefile.SH needed some more .h dependecies
# 
# Revision 3.0  89/10/18  15:06:43  lwall
# 3.0 baseline
# 

CC = cc
bin = /usr/local/bin
privlib = /usr/local/lib/perl
mansrc = /usr/man/man1
manext = 1
CFLAGS = -E -O 
LDFLAGS = 
SMALL = 
LARGE =  
mallocsrc = 
mallocobj = 
SLN = ln -s

libs =  -lm    

public = perl taintperl 

private = 

MAKE = make

manpages = perl.man

util =

sh = Makefile.SH makedepend.SH

h1 = EXTERN.h INTERN.h arg.h array.h cmd.h config.h form.h handy.h
h2 = hash.h perl.h regcomp.h regexp.h spat.h stab.h str.h util.h

h = $(h1) $(h2)

c1 = array.c cmd.c cons.c consarg.c doarg.c doio.c dolist.c dump.c
c2 = eval.c form.c hash.c $(mallocsrc) perly.c regcomp.c regexec.c
c3 = stab.c str.c toke.c util.c

c = $(c1) $(c2) $(c3)

obj1 = array.o cmd.o cons.o consarg.o doarg.o doio.o dolist.o dump.o
obj2 = eval.o form.o hash.o $(mallocobj) perly.o regcomp.o regexec.o
obj3 = stab.o str.o toke.o util.o

obj = $(obj1) $(obj2) $(obj3)

tobj1 = tarray.o tcmd.o tcons.o tconsarg.o tdoarg.o tdoio.o tdolist.o tdump.o
tobj2 = teval.o tform.o thash.o $(mallocobj) tregcomp.o tregexec.o
tobj3 = tstab.o tstr.o ttoke.o tutil.o

tobj = $(tobj1) $(tobj2) $(tobj3)

lintflags = -hbvxac

addedbyconf = Makefile.old bsd eunice filexp loc pdp11 usg v7

# grrr
SHELL = /bin/sh

.c.o:
	$(CC) -c $(CFLAGS) $(LARGE) $*.c

all: $(public) $(private) $(util) perl.man x2p/all
	touch all

x2p/all:
	cd x2p; $(MAKE) all

# This is the standard version that contains no "taint" checks and is
# used for all scripts that aren't set-id or running under something set-id.

perl: perl.o $(obj)
	$(CC) $(LARGE) $(LDFLAGS) $(obj) perl.o $(libs) -o perl

# This version, if specified in Configure, does ONLY those scripts which need
# set-id emulation.  Suidperl must be setuid root.  It contains the "taint"
# checks as well as the special code to validate that the script in question
# has been invoked correctly.

suidperl: tperl.o sperly.o $(tobj)
	$(CC) $(LARGE) $(LDFLAGS) sperly.o $(tobj) tperl.o $(libs) -o suidperl

# This version interprets scripts that are already set-id either via a wrapper
# or through the kernel allowing set-id scripts (bad idea).  Taintperl must
# NOT be setuid to root or anything else.  The only difference between it
# and normal perl is the presence of the "taint" checks.

taintperl: tperl.o tperly.o $(tobj)
	$(CC) $(LARGE) $(LDFLAGS) tperly.o $(tobj) tperl.o $(libs) -o taintperl

# Replicating all this junk is yucky, but I don't see a portable way to fix it.

tperl.o: perl.c perly.h $(h)
	/bin/rm -f tperl.c
	$(SLN) perl.c tperl.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tperl.c
	/bin/rm -f tperl.c

tperly.o: perly.c perly.h $(h)
	/bin/rm -f tperly.c
	$(SLN) perly.c tperly.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tperly.c
	/bin/rm -f tperly.c

sperly.o: perly.c perly.h patchlevel.h $(h)
	/bin/rm -f sperly.c
	$(SLN) perly.c sperly.c
	$(CC) -c -DTAINT -DIAMSUID $(CFLAGS) $(LARGE) sperly.c
	/bin/rm -f sperly.c

tarray.o: array.c $(h)
	/bin/rm -f tarray.c
	$(SLN) array.c tarray.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tarray.c
	/bin/rm -f tarray.c

tcmd.o: cmd.c $(h)
	/bin/rm -f tcmd.c
	$(SLN) cmd.c tcmd.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tcmd.c
	/bin/rm -f tcmd.c

tcons.o: cons.c $(h)
	/bin/rm -f tcons.c
	$(SLN) cons.c tcons.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tcons.c
	/bin/rm -f tcons.c

tconsarg.o: consarg.c $(h)
	/bin/rm -f tconsarg.c
	$(SLN) consarg.c tconsarg.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tconsarg.c
	/bin/rm -f tconsarg.c

tdoarg.o: doarg.c $(h)
	/bin/rm -f tdoarg.c
	$(SLN) doarg.c tdoarg.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tdoarg.c
	/bin/rm -f tdoarg.c

tdoio.o: doio.c $(h)
	/bin/rm -f tdoio.c
	$(SLN) doio.c tdoio.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tdoio.c
	/bin/rm -f tdoio.c

tdolist.o: dolist.c $(h)
	/bin/rm -f tdolist.c
	$(SLN) dolist.c tdolist.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tdolist.c
	/bin/rm -f tdolist.c

tdump.o: dump.c $(h)
	/bin/rm -f tdump.c
	$(SLN) dump.c tdump.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tdump.c
	/bin/rm -f tdump.c

teval.o: eval.c $(h)
	/bin/rm -f teval.c
	$(SLN) eval.c teval.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) teval.c
	/bin/rm -f teval.c

tform.o: form.c $(h)
	/bin/rm -f tform.c
	$(SLN) form.c tform.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tform.c
	/bin/rm -f tform.c

thash.o: hash.c $(h)
	/bin/rm -f thash.c
	$(SLN) hash.c thash.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) thash.c
	/bin/rm -f thash.c

tregcomp.o: regcomp.c $(h)
	/bin/rm -f tregcomp.c
	$(SLN) regcomp.c tregcomp.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tregcomp.c
	/bin/rm -f tregcomp.c

tregexec.o: regexec.c $(h)
	/bin/rm -f tregexec.c
	$(SLN) regexec.c tregexec.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tregexec.c
	/bin/rm -f tregexec.c

tstab.o: stab.c $(h)
	/bin/rm -f tstab.c
	$(SLN) stab.c tstab.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tstab.c
	/bin/rm -f tstab.c

tstr.o: str.c $(h)
	/bin/rm -f tstr.c
	$(SLN) str.c tstr.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tstr.c
	/bin/rm -f tstr.c

ttoke.o: toke.c $(h)
	/bin/rm -f ttoke.c
	$(SLN) toke.c ttoke.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) ttoke.c
	/bin/rm -f ttoke.c

tutil.o: util.c $(h)
	/bin/rm -f tutil.c
	$(SLN) util.c tutil.c
	$(CC) -c -DTAINT $(CFLAGS) $(LARGE) tutil.c
	/bin/rm -f tutil.c

perl.c perly.h: perl.y
	@ echo Expect 25 shift/reduce errors...
	yacc -d perl.y
	mv y.tab.c perl.c
	mv y.tab.h perly.h

perl.o: perl.c perly.h $(h)
	$(CC) -c $(CFLAGS) $(LARGE) perl.c

perl.man: perl.man.1 perl.man.2 perl.man.3 perl.man.4 patchlevel.h perl
	./perl  -e '($$r,$$p)=$$]=~/(\d+\.\d+).*\n\D*(\d+)/;' \
		-e 'print ".ds RP Release $$r Patchlevel $$p\n";' >perl.man
	cat perl.man.[1-4] >>perl.man

install: all
# won't work with csh
	export PATH || exit 1
	- rm -f $(bin)/perl.old $(bin)/suidperl $(bin)/taintperl
	- mv $(bin)/perl $(bin)/perl.old 2>/dev/null
	- if test `pwd` != $(bin); then cp $(public) $(bin); fi
	- cd $(bin); \
for pub in $(public); do \
chmod +x `basename $$pub`; \
done
	- chmod 755 $(bin)/taintperl 2>/dev/null
	- test $(bin) = /usr/bin || rm -f /usr/bin/perl
	- test $(bin) = /usr/bin || $(SLN) $(bin)/perl /usr/bin || cp $(bin)/perl /usr/bin
	- sh ./makedir $(privlib)
	- \
if test `pwd` != $(privlib); then \
cp $(private) lib/*.pl $(privlib); \
fi
#	cd $(privlib); \
#for priv in $(private); do \
#chmod +x `basename $$priv`; \
#done
	- if test `pwd` != $(mansrc); then \
for page in $(manpages); do \
cp $$page $(mansrc)/`basename $$page .man`.$(manext); \
done; \
fi
	cd x2p; $(MAKE) install

clean:
	rm -f *.o all perl taintperl perl.man
	cd x2p; $(MAKE) clean

realclean:
	cd x2p; $(MAKE) realclean
	rm -f perl *.orig */*.orig *~ */*~ *.o core $(addedbyconf) perl.man
	rm -f perl.c perly.h t/perl Makefile config.h makedepend makedir
	rm -f x2p/Makefile

# The following lint has practically everything turned on.  Unfortunately,
# you have to wade through a lot of mumbo jumbo that can't be suppressed.
# If the source file has a /*NOSTRICT*/ somewhere, ignore the lint message
# for that spot.

lint: perl.c $(c)
	lint $(lintflags) $(defs) perl.c $(c) > perl.fuzz

depend: makedepend
	- test -f perly.h || cp /dev/null perly.h
	./makedepend
	- test -s perly.h || /bin/rm -f perly.h
	cd x2p; $(MAKE) depend

test: perl
	- chmod +x t/TEST t/base.* t/comp.* t/cmd.* t/io.* t/op.*; \
	cd t && (rm -f perl; $(SLN) ../perl .) && ./perl TEST

clist:
	echo $(c) | tr ' ' '\012' >.clist

hlist:
	echo $(h) | tr ' ' '\012' >.hlist

shlist:
	echo $(sh) | tr ' ' '\012' >.shlist

# AUTOMATICALLY GENERATED MAKE DEPENDENCIES--PUT NOTHING BELOW THIS LINE
# If this runs make out of memory, delete /usr/include lines.
array.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
array.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
array.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
array.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
array.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
array.o: /usr/include/_ansi.h
array.o: /usr/include/_newlib_version.h
array.o: /usr/include/asm/byteorder.h
array.o: /usr/include/asm/socket.h
array.o: /usr/include/bits/byteswap.h
array.o: /usr/include/bits/endian.h
array.o: /usr/include/bits/wordsize.h
array.o: /usr/include/ctype.h
array.o: /usr/include/cygwin/_socketflags.h
array.o: /usr/include/cygwin/_ucred.h
array.o: /usr/include/cygwin/config.h
array.o: /usr/include/cygwin/if.h
array.o: /usr/include/cygwin/in.h
array.o: /usr/include/cygwin/in6.h
array.o: /usr/include/cygwin/signal.h
array.o: /usr/include/cygwin/socket.h
array.o: /usr/include/cygwin/sockios.h
array.o: /usr/include/cygwin/stat.h
array.o: /usr/include/cygwin/time.h
array.o: /usr/include/dirent.h
array.o: /usr/include/endian.h
array.o: /usr/include/features.h
array.o: /usr/include/limits.h
array.o: /usr/include/machine/_default_types.h
array.o: /usr/include/machine/_endian.h
array.o: /usr/include/machine/_time.h
array.o: /usr/include/machine/_types.h
array.o: /usr/include/machine/endian.h
array.o: /usr/include/machine/ieeefp.h
array.o: /usr/include/machine/setjmp.h
array.o: /usr/include/machine/time.h
array.o: /usr/include/machine/types.h
array.o: /usr/include/netinet/in.h
array.o: /usr/include/newlib.h
array.o: /usr/include/setjmp.h
array.o: /usr/include/signal.h
array.o: /usr/include/stdint.h
array.o: /usr/include/stdio.h
array.o: /usr/include/sys/_intsup.h
array.o: /usr/include/sys/_pthreadtypes.h
array.o: /usr/include/sys/_sigset.h
array.o: /usr/include/sys/_stdint.h
array.o: /usr/include/sys/_timespec.h
array.o: /usr/include/sys/_timeval.h
array.o: /usr/include/sys/_types.h
array.o: /usr/include/sys/cdefs.h
array.o: /usr/include/sys/config.h
array.o: /usr/include/sys/dirent.h
array.o: /usr/include/sys/features.h
array.o: /usr/include/sys/ioctl.h
array.o: /usr/include/sys/lock.h
array.o: /usr/include/sys/param.h
array.o: /usr/include/sys/reent.h
array.o: /usr/include/sys/select.h
array.o: /usr/include/sys/signal.h
array.o: /usr/include/sys/socket.h
array.o: /usr/include/sys/stat.h
array.o: /usr/include/sys/stdio.h
array.o: /usr/include/sys/sysmacros.h
array.o: /usr/include/sys/termios.h
array.o: /usr/include/sys/time.h
array.o: /usr/include/sys/times.h
array.o: /usr/include/sys/timespec.h
array.o: /usr/include/sys/types.h
array.o: /usr/include/sys/ucontext.h
array.o: /usr/include/sys/uio.h
array.o: /usr/include/time.h
array.o: /usr/include/xlocale.h
array.o: <built-in>
array.o: <command-line>
array.o: arg.h
array.o: array.c
array.o: array.h
array.o: cmd.h
array.o: config.h
array.o: EXTERN.h
array.o: form.h
array.o: handy.h
array.o: hash.h
array.o: perl.h
array.o: regexp.h
array.o: spat.h
array.o: stab.h
array.o: str.h
array.o: util.h
cmd.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
cmd.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
cmd.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
cmd.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
cmd.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
cmd.o: /usr/include/_ansi.h
cmd.o: /usr/include/_newlib_version.h
cmd.o: /usr/include/asm/byteorder.h
cmd.o: /usr/include/asm/socket.h
cmd.o: /usr/include/bits/byteswap.h
cmd.o: /usr/include/bits/endian.h
cmd.o: /usr/include/bits/wordsize.h
cmd.o: /usr/include/ctype.h
cmd.o: /usr/include/cygwin/_socketflags.h
cmd.o: /usr/include/cygwin/_ucred.h
cmd.o: /usr/include/cygwin/config.h
cmd.o: /usr/include/cygwin/if.h
cmd.o: /usr/include/cygwin/in.h
cmd.o: /usr/include/cygwin/in6.h
cmd.o: /usr/include/cygwin/signal.h
cmd.o: /usr/include/cygwin/socket.h
cmd.o: /usr/include/cygwin/sockios.h
cmd.o: /usr/include/cygwin/stat.h
cmd.o: /usr/include/cygwin/time.h
cmd.o: /usr/include/dirent.h
cmd.o: /usr/include/endian.h
cmd.o: /usr/include/features.h
cmd.o: /usr/include/limits.h
cmd.o: /usr/include/machine/_default_types.h
cmd.o: /usr/include/machine/_endian.h
cmd.o: /usr/include/machine/_time.h
cmd.o: /usr/include/machine/_types.h
cmd.o: /usr/include/machine/endian.h
cmd.o: /usr/include/machine/ieeefp.h
cmd.o: /usr/include/machine/setjmp.h
cmd.o: /usr/include/machine/time.h
cmd.o: /usr/include/machine/types.h
cmd.o: /usr/include/netinet/in.h
cmd.o: /usr/include/newlib.h
cmd.o: /usr/include/setjmp.h
cmd.o: /usr/include/signal.h
cmd.o: /usr/include/stdint.h
cmd.o: /usr/include/stdio.h
cmd.o: /usr/include/sys/_intsup.h
cmd.o: /usr/include/sys/_pthreadtypes.h
cmd.o: /usr/include/sys/_sigset.h
cmd.o: /usr/include/sys/_stdint.h
cmd.o: /usr/include/sys/_timespec.h
cmd.o: /usr/include/sys/_timeval.h
cmd.o: /usr/include/sys/_types.h
cmd.o: /usr/include/sys/cdefs.h
cmd.o: /usr/include/sys/config.h
cmd.o: /usr/include/sys/dirent.h
cmd.o: /usr/include/sys/features.h
cmd.o: /usr/include/sys/ioctl.h
cmd.o: /usr/include/sys/lock.h
cmd.o: /usr/include/sys/param.h
cmd.o: /usr/include/sys/reent.h
cmd.o: /usr/include/sys/select.h
cmd.o: /usr/include/sys/signal.h
cmd.o: /usr/include/sys/socket.h
cmd.o: /usr/include/sys/stat.h
cmd.o: /usr/include/sys/stdio.h
cmd.o: /usr/include/sys/sysmacros.h
cmd.o: /usr/include/sys/termios.h
cmd.o: /usr/include/sys/time.h
cmd.o: /usr/include/sys/times.h
cmd.o: /usr/include/sys/timespec.h
cmd.o: /usr/include/sys/types.h
cmd.o: /usr/include/sys/ucontext.h
cmd.o: /usr/include/sys/uio.h
cmd.o: /usr/include/time.h
cmd.o: /usr/include/xlocale.h
cmd.o: <built-in>
cmd.o: <command-line>
cmd.o: arg.h
cmd.o: array.h
cmd.o: cmd.c
cmd.o: cmd.h
cmd.o: config.h
cmd.o: EXTERN.h
cmd.o: form.h
cmd.o: handy.h
cmd.o: hash.h
cmd.o: perl.h
cmd.o: regexp.h
cmd.o: spat.h
cmd.o: stab.h
cmd.o: str.h
cmd.o: util.h
cons.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
cons.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
cons.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
cons.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
cons.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
cons.o: /usr/include/_ansi.h
cons.o: /usr/include/_newlib_version.h
cons.o: /usr/include/asm/byteorder.h
cons.o: /usr/include/asm/socket.h
cons.o: /usr/include/bits/byteswap.h
cons.o: /usr/include/bits/endian.h
cons.o: /usr/include/bits/wordsize.h
cons.o: /usr/include/ctype.h
cons.o: /usr/include/cygwin/_socketflags.h
cons.o: /usr/include/cygwin/_ucred.h
cons.o: /usr/include/cygwin/config.h
cons.o: /usr/include/cygwin/if.h
cons.o: /usr/include/cygwin/in.h
cons.o: /usr/include/cygwin/in6.h
cons.o: /usr/include/cygwin/signal.h
cons.o: /usr/include/cygwin/socket.h
cons.o: /usr/include/cygwin/sockios.h
cons.o: /usr/include/cygwin/stat.h
cons.o: /usr/include/cygwin/time.h
cons.o: /usr/include/dirent.h
cons.o: /usr/include/endian.h
cons.o: /usr/include/features.h
cons.o: /usr/include/limits.h
cons.o: /usr/include/machine/_default_types.h
cons.o: /usr/include/machine/_endian.h
cons.o: /usr/include/machine/_time.h
cons.o: /usr/include/machine/_types.h
cons.o: /usr/include/machine/endian.h
cons.o: /usr/include/machine/ieeefp.h
cons.o: /usr/include/machine/setjmp.h
cons.o: /usr/include/machine/time.h
cons.o: /usr/include/machine/types.h
cons.o: /usr/include/netinet/in.h
cons.o: /usr/include/newlib.h
cons.o: /usr/include/setjmp.h
cons.o: /usr/include/signal.h
cons.o: /usr/include/stdint.h
cons.o: /usr/include/stdio.h
cons.o: /usr/include/sys/_intsup.h
cons.o: /usr/include/sys/_pthreadtypes.h
cons.o: /usr/include/sys/_sigset.h
cons.o: /usr/include/sys/_stdint.h
cons.o: /usr/include/sys/_timespec.h
cons.o: /usr/include/sys/_timeval.h
cons.o: /usr/include/sys/_types.h
cons.o: /usr/include/sys/cdefs.h
cons.o: /usr/include/sys/config.h
cons.o: /usr/include/sys/dirent.h
cons.o: /usr/include/sys/features.h
cons.o: /usr/include/sys/ioctl.h
cons.o: /usr/include/sys/lock.h
cons.o: /usr/include/sys/param.h
cons.o: /usr/include/sys/reent.h
cons.o: /usr/include/sys/select.h
cons.o: /usr/include/sys/signal.h
cons.o: /usr/include/sys/socket.h
cons.o: /usr/include/sys/stat.h
cons.o: /usr/include/sys/stdio.h
cons.o: /usr/include/sys/sysmacros.h
cons.o: /usr/include/sys/termios.h
cons.o: /usr/include/sys/time.h
cons.o: /usr/include/sys/times.h
cons.o: /usr/include/sys/timespec.h
cons.o: /usr/include/sys/types.h
cons.o: /usr/include/sys/ucontext.h
cons.o: /usr/include/sys/uio.h
cons.o: /usr/include/time.h
cons.o: /usr/include/xlocale.h
cons.o: <built-in>
cons.o: <command-line>
cons.o: arg.h
cons.o: array.h
cons.o: cmd.h
cons.o: config.h
cons.o: cons.c
cons.o: EXTERN.h
cons.o: form.h
cons.o: handy.h
cons.o: hash.h
cons.o: perl.h
cons.o: perly.h
cons.o: regexp.h
cons.o: spat.h
cons.o: stab.h
cons.o: str.h
cons.o: util.h
consarg.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
consarg.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
consarg.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
consarg.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
consarg.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
consarg.o: /usr/include/_ansi.h
consarg.o: /usr/include/_newlib_version.h
consarg.o: /usr/include/asm/byteorder.h
consarg.o: /usr/include/asm/socket.h
consarg.o: /usr/include/bits/byteswap.h
consarg.o: /usr/include/bits/endian.h
consarg.o: /usr/include/bits/wordsize.h
consarg.o: /usr/include/ctype.h
consarg.o: /usr/include/cygwin/_socketflags.h
consarg.o: /usr/include/cygwin/_ucred.h
consarg.o: /usr/include/cygwin/config.h
consarg.o: /usr/include/cygwin/if.h
consarg.o: /usr/include/cygwin/in.h
consarg.o: /usr/include/cygwin/in6.h
consarg.o: /usr/include/cygwin/signal.h
consarg.o: /usr/include/cygwin/socket.h
consarg.o: /usr/include/cygwin/sockios.h
consarg.o: /usr/include/cygwin/stat.h
consarg.o: /usr/include/cygwin/time.h
consarg.o: /usr/include/dirent.h
consarg.o: /usr/include/endian.h
consarg.o: /usr/include/features.h
consarg.o: /usr/include/limits.h
consarg.o: /usr/include/machine/_default_types.h
consarg.o: /usr/include/machine/_endian.h
consarg.o: /usr/include/machine/_time.h
consarg.o: /usr/include/machine/_types.h
consarg.o: /usr/include/machine/endian.h
consarg.o: /usr/include/machine/ieeefp.h
consarg.o: /usr/include/machine/setjmp.h
consarg.o: /usr/include/machine/time.h
consarg.o: /usr/include/machine/types.h
consarg.o: /usr/include/netinet/in.h
consarg.o: /usr/include/newlib.h
consarg.o: /usr/include/setjmp.h
consarg.o: /usr/include/signal.h
consarg.o: /usr/include/stdint.h
consarg.o: /usr/include/stdio.h
consarg.o: /usr/include/sys/_intsup.h
consarg.o: /usr/include/sys/_pthreadtypes.h
consarg.o: /usr/include/sys/_sigset.h
consarg.o: /usr/include/sys/_stdint.h
consarg.o: /usr/include/sys/_timespec.h
consarg.o: /usr/include/sys/_timeval.h
consarg.o: /usr/include/sys/_types.h
consarg.o: /usr/include/sys/cdefs.h
consarg.o: /usr/include/sys/config.h
consarg.o: /usr/include/sys/dirent.h
consarg.o: /usr/include/sys/features.h
consarg.o: /usr/include/sys/ioctl.h
consarg.o: /usr/include/sys/lock.h
consarg.o: /usr/include/sys/param.h
consarg.o: /usr/include/sys/reent.h
consarg.o: /usr/include/sys/select.h
consarg.o: /usr/include/sys/signal.h
consarg.o: /usr/include/sys/socket.h
consarg.o: /usr/include/sys/stat.h
consarg.o: /usr/include/sys/stdio.h
consarg.o: /usr/include/sys/sysmacros.h
consarg.o: /usr/include/sys/termios.h
consarg.o: /usr/include/sys/time.h
consarg.o: /usr/include/sys/times.h
consarg.o: /usr/include/sys/timespec.h
consarg.o: /usr/include/sys/types.h
consarg.o: /usr/include/sys/ucontext.h
consarg.o: /usr/include/sys/uio.h
consarg.o: /usr/include/time.h
consarg.o: /usr/include/xlocale.h
consarg.o: <built-in>
consarg.o: <command-line>
consarg.o: arg.h
consarg.o: array.h
consarg.o: cmd.h
consarg.o: config.h
consarg.o: consarg.c
consarg.o: EXTERN.h
consarg.o: form.h
consarg.o: handy.h
consarg.o: hash.h
consarg.o: perl.h
consarg.o: regexp.h
consarg.o: spat.h
consarg.o: stab.h
consarg.o: str.h
consarg.o: util.h
doarg.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
doarg.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
doarg.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
doarg.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
doarg.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
doarg.o: /usr/include/_ansi.h
doarg.o: /usr/include/_newlib_version.h
doarg.o: /usr/include/asm/byteorder.h
doarg.o: /usr/include/asm/socket.h
doarg.o: /usr/include/bits/byteswap.h
doarg.o: /usr/include/bits/endian.h
doarg.o: /usr/include/bits/wordsize.h
doarg.o: /usr/include/ctype.h
doarg.o: /usr/include/cygwin/_socketflags.h
doarg.o: /usr/include/cygwin/_ucred.h
doarg.o: /usr/include/cygwin/config.h
doarg.o: /usr/include/cygwin/if.h
doarg.o: /usr/include/cygwin/in.h
doarg.o: /usr/include/cygwin/in6.h
doarg.o: /usr/include/cygwin/signal.h
doarg.o: /usr/include/cygwin/socket.h
doarg.o: /usr/include/cygwin/sockios.h
doarg.o: /usr/include/cygwin/stat.h
doarg.o: /usr/include/cygwin/time.h
doarg.o: /usr/include/dirent.h
doarg.o: /usr/include/endian.h
doarg.o: /usr/include/features.h
doarg.o: /usr/include/limits.h
doarg.o: /usr/include/machine/_default_types.h
doarg.o: /usr/include/machine/_endian.h
doarg.o: /usr/include/machine/_time.h
doarg.o: /usr/include/machine/_types.h
doarg.o: /usr/include/machine/endian.h
doarg.o: /usr/include/machine/ieeefp.h
doarg.o: /usr/include/machine/setjmp.h
doarg.o: /usr/include/machine/time.h
doarg.o: /usr/include/machine/types.h
doarg.o: /usr/include/netinet/in.h
doarg.o: /usr/include/newlib.h
doarg.o: /usr/include/setjmp.h
doarg.o: /usr/include/signal.h
doarg.o: /usr/include/stdint.h
doarg.o: /usr/include/stdio.h
doarg.o: /usr/include/sys/_intsup.h
doarg.o: /usr/include/sys/_pthreadtypes.h
doarg.o: /usr/include/sys/_sigset.h
doarg.o: /usr/include/sys/_stdint.h
doarg.o: /usr/include/sys/_timespec.h
doarg.o: /usr/include/sys/_timeval.h
doarg.o: /usr/include/sys/_types.h
doarg.o: /usr/include/sys/cdefs.h
doarg.o: /usr/include/sys/config.h
doarg.o: /usr/include/sys/dirent.h
doarg.o: /usr/include/sys/features.h
doarg.o: /usr/include/sys/ioctl.h
doarg.o: /usr/include/sys/lock.h
doarg.o: /usr/include/sys/param.h
doarg.o: /usr/include/sys/reent.h
doarg.o: /usr/include/sys/select.h
doarg.o: /usr/include/sys/signal.h
doarg.o: /usr/include/sys/socket.h
doarg.o: /usr/include/sys/stat.h
doarg.o: /usr/include/sys/stdio.h
doarg.o: /usr/include/sys/sysmacros.h
doarg.o: /usr/include/sys/termios.h
doarg.o: /usr/include/sys/time.h
doarg.o: /usr/include/sys/times.h
doarg.o: /usr/include/sys/timespec.h
doarg.o: /usr/include/sys/types.h
doarg.o: /usr/include/sys/ucontext.h
doarg.o: /usr/include/sys/uio.h
doarg.o: /usr/include/time.h
doarg.o: /usr/include/xlocale.h
doarg.o: <built-in>
doarg.o: <command-line>
doarg.o: arg.h
doarg.o: array.h
doarg.o: cmd.h
doarg.o: config.h
doarg.o: doarg.c
doarg.o: EXTERN.h
doarg.o: form.h
doarg.o: handy.h
doarg.o: hash.h
doarg.o: perl.h
doarg.o: regexp.h
doarg.o: spat.h
doarg.o: stab.h
doarg.o: str.h
doarg.o: util.h
doio.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
doio.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
doio.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
doio.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
doio.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
doio.o: /usr/include/_ansi.h
doio.o: /usr/include/_newlib_version.h
doio.o: /usr/include/asm/byteorder.h
doio.o: /usr/include/asm/socket.h
doio.o: /usr/include/bits/byteswap.h
doio.o: /usr/include/bits/endian.h
doio.o: /usr/include/bits/wordsize.h
doio.o: /usr/include/ctype.h
doio.o: /usr/include/cygwin/_socketflags.h
doio.o: /usr/include/cygwin/_ucred.h
doio.o: /usr/include/cygwin/config.h
doio.o: /usr/include/cygwin/grp.h
doio.o: /usr/include/cygwin/if.h
doio.o: /usr/include/cygwin/in.h
doio.o: /usr/include/cygwin/in6.h
doio.o: /usr/include/cygwin/signal.h
doio.o: /usr/include/cygwin/socket.h
doio.o: /usr/include/cygwin/sockios.h
doio.o: /usr/include/cygwin/stat.h
doio.o: /usr/include/cygwin/time.h
doio.o: /usr/include/dirent.h
doio.o: /usr/include/endian.h
doio.o: /usr/include/errno.h
doio.o: /usr/include/features.h
doio.o: /usr/include/grp.h
doio.o: /usr/include/inttypes.h
doio.o: /usr/include/limits.h
doio.o: /usr/include/machine/_default_types.h
doio.o: /usr/include/machine/_endian.h
doio.o: /usr/include/machine/_time.h
doio.o: /usr/include/machine/_types.h
doio.o: /usr/include/machine/endian.h
doio.o: /usr/include/machine/ieeefp.h
doio.o: /usr/include/machine/setjmp.h
doio.o: /usr/include/machine/time.h
doio.o: /usr/include/machine/types.h
doio.o: /usr/include/netdb.h
doio.o: /usr/include/netinet/in.h
doio.o: /usr/include/newlib.h
doio.o: /usr/include/pwd.h
doio.o: /usr/include/setjmp.h
doio.o: /usr/include/signal.h
doio.o: /usr/include/stdint.h
doio.o: /usr/include/stdio.h
doio.o: /usr/include/sys/_intsup.h
doio.o: /usr/include/sys/_pthreadtypes.h
doio.o: /usr/include/sys/_sigset.h
doio.o: /usr/include/sys/_stdint.h
doio.o: /usr/include/sys/_timespec.h
doio.o: /usr/include/sys/_timeval.h
doio.o: /usr/include/sys/_types.h
doio.o: /usr/include/sys/cdefs.h
doio.o: /usr/include/sys/config.h
doio.o: /usr/include/sys/dirent.h
doio.o: /usr/include/sys/errno.h
doio.o: /usr/include/sys/features.h
doio.o: /usr/include/sys/ioctl.h
doio.o: /usr/include/sys/lock.h
doio.o: /usr/include/sys/param.h
doio.o: /usr/include/sys/reent.h
doio.o: /usr/include/sys/select.h
doio.o: /usr/include/sys/signal.h
doio.o: /usr/include/sys/socket.h
doio.o: /usr/include/sys/stat.h
doio.o: /usr/include/sys/stdio.h
doio.o: /usr/include/sys/sysmacros.h
doio.o: /usr/include/sys/termios.h
doio.o: /usr/include/sys/time.h
doio.o: /usr/include/sys/times.h
doio.o: /usr/include/sys/timespec.h
doio.o: /usr/include/sys/types.h
doio.o: /usr/include/sys/ucontext.h
doio.o: /usr/include/sys/uio.h
doio.o: /usr/include/time.h
doio.o: /usr/include/xlocale.h
doio.o: <built-in>
doio.o: <command-line>
doio.o: arg.h
doio.o: array.h
doio.o: cmd.h
doio.o: config.h
doio.o: doio.c
doio.o: EXTERN.h
doio.o: form.h
doio.o: handy.h
doio.o: hash.h
doio.o: perl.h
doio.o: regexp.h
doio.o: spat.h
doio.o: stab.h
doio.o: str.h
doio.o: util.h
dolist.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
dolist.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
dolist.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
dolist.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
dolist.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
dolist.o: /usr/include/_ansi.h
dolist.o: /usr/include/_newlib_version.h
dolist.o: /usr/include/asm/byteorder.h
dolist.o: /usr/include/asm/socket.h
dolist.o: /usr/include/bits/byteswap.h
dolist.o: /usr/include/bits/endian.h
dolist.o: /usr/include/bits/wordsize.h
dolist.o: /usr/include/ctype.h
dolist.o: /usr/include/cygwin/_socketflags.h
dolist.o: /usr/include/cygwin/_ucred.h
dolist.o: /usr/include/cygwin/config.h
dolist.o: /usr/include/cygwin/if.h
dolist.o: /usr/include/cygwin/in.h
dolist.o: /usr/include/cygwin/in6.h
dolist.o: /usr/include/cygwin/signal.h
dolist.o: /usr/include/cygwin/socket.h
dolist.o: /usr/include/cygwin/sockios.h
dolist.o: /usr/include/cygwin/stat.h
dolist.o: /usr/include/cygwin/time.h
dolist.o: /usr/include/dirent.h
dolist.o: /usr/include/endian.h
dolist.o: /usr/include/features.h
dolist.o: /usr/include/limits.h
dolist.o: /usr/include/machine/_default_types.h
dolist.o: /usr/include/machine/_endian.h
dolist.o: /usr/include/machine/_time.h
dolist.o: /usr/include/machine/_types.h
dolist.o: /usr/include/machine/endian.h
dolist.o: /usr/include/machine/ieeefp.h
dolist.o: /usr/include/machine/setjmp.h
dolist.o: /usr/include/machine/time.h
dolist.o: /usr/include/machine/types.h
dolist.o: /usr/include/netinet/in.h
dolist.o: /usr/include/newlib.h
dolist.o: /usr/include/setjmp.h
dolist.o: /usr/include/signal.h
dolist.o: /usr/include/stdint.h
dolist.o: /usr/include/stdio.h
dolist.o: /usr/include/sys/_intsup.h
dolist.o: /usr/include/sys/_pthreadtypes.h
dolist.o: /usr/include/sys/_sigset.h
dolist.o: /usr/include/sys/_stdint.h
dolist.o: /usr/include/sys/_timespec.h
dolist.o: /usr/include/sys/_timeval.h
dolist.o: /usr/include/sys/_types.h
dolist.o: /usr/include/sys/cdefs.h
dolist.o: /usr/include/sys/config.h
dolist.o: /usr/include/sys/dirent.h
dolist.o: /usr/include/sys/features.h
dolist.o: /usr/include/sys/ioctl.h
dolist.o: /usr/include/sys/lock.h
dolist.o: /usr/include/sys/param.h
dolist.o: /usr/include/sys/reent.h
dolist.o: /usr/include/sys/select.h
dolist.o: /usr/include/sys/signal.h
dolist.o: /usr/include/sys/socket.h
dolist.o: /usr/include/sys/stat.h
dolist.o: /usr/include/sys/stdio.h
dolist.o: /usr/include/sys/sysmacros.h
dolist.o: /usr/include/sys/termios.h
dolist.o: /usr/include/sys/time.h
dolist.o: /usr/include/sys/times.h
dolist.o: /usr/include/sys/timespec.h
dolist.o: /usr/include/sys/types.h
dolist.o: /usr/include/sys/ucontext.h
dolist.o: /usr/include/sys/uio.h
dolist.o: /usr/include/time.h
dolist.o: /usr/include/xlocale.h
dolist.o: <built-in>
dolist.o: <command-line>
dolist.o: arg.h
dolist.o: array.h
dolist.o: cmd.h
dolist.o: config.h
dolist.o: dolist.c
dolist.o: EXTERN.h
dolist.o: form.h
dolist.o: handy.h
dolist.o: hash.h
dolist.o: perl.h
dolist.o: regexp.h
dolist.o: spat.h
dolist.o: stab.h
dolist.o: str.h
dolist.o: util.h
dump.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
dump.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
dump.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
dump.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
dump.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
dump.o: /usr/include/_ansi.h
dump.o: /usr/include/_newlib_version.h
dump.o: /usr/include/asm/byteorder.h
dump.o: /usr/include/asm/socket.h
dump.o: /usr/include/bits/byteswap.h
dump.o: /usr/include/bits/endian.h
dump.o: /usr/include/bits/wordsize.h
dump.o: /usr/include/ctype.h
dump.o: /usr/include/cygwin/_socketflags.h
dump.o: /usr/include/cygwin/_ucred.h
dump.o: /usr/include/cygwin/config.h
dump.o: /usr/include/cygwin/if.h
dump.o: /usr/include/cygwin/in.h
dump.o: /usr/include/cygwin/in6.h
dump.o: /usr/include/cygwin/signal.h
dump.o: /usr/include/cygwin/socket.h
dump.o: /usr/include/cygwin/sockios.h
dump.o: /usr/include/cygwin/stat.h
dump.o: /usr/include/cygwin/time.h
dump.o: /usr/include/dirent.h
dump.o: /usr/include/endian.h
dump.o: /usr/include/features.h
dump.o: /usr/include/limits.h
dump.o: /usr/include/machine/_default_types.h
dump.o: /usr/include/machine/_endian.h
dump.o: /usr/include/machine/_time.h
dump.o: /usr/include/machine/_types.h
dump.o: /usr/include/machine/endian.h
dump.o: /usr/include/machine/ieeefp.h
dump.o: /usr/include/machine/setjmp.h
dump.o: /usr/include/machine/time.h
dump.o: /usr/include/machine/types.h
dump.o: /usr/include/netinet/in.h
dump.o: /usr/include/newlib.h
dump.o: /usr/include/setjmp.h
dump.o: /usr/include/signal.h
dump.o: /usr/include/stdint.h
dump.o: /usr/include/stdio.h
dump.o: /usr/include/sys/_intsup.h
dump.o: /usr/include/sys/_pthreadtypes.h
dump.o: /usr/include/sys/_sigset.h
dump.o: /usr/include/sys/_stdint.h
dump.o: /usr/include/sys/_timespec.h
dump.o: /usr/include/sys/_timeval.h
dump.o: /usr/include/sys/_types.h
dump.o: /usr/include/sys/cdefs.h
dump.o: /usr/include/sys/config.h
dump.o: /usr/include/sys/dirent.h
dump.o: /usr/include/sys/features.h
dump.o: /usr/include/sys/ioctl.h
dump.o: /usr/include/sys/lock.h
dump.o: /usr/include/sys/param.h
dump.o: /usr/include/sys/reent.h
dump.o: /usr/include/sys/select.h
dump.o: /usr/include/sys/signal.h
dump.o: /usr/include/sys/socket.h
dump.o: /usr/include/sys/stat.h
dump.o: /usr/include/sys/stdio.h
dump.o: /usr/include/sys/sysmacros.h
dump.o: /usr/include/sys/termios.h
dump.o: /usr/include/sys/time.h
dump.o: /usr/include/sys/times.h
dump.o: /usr/include/sys/timespec.h
dump.o: /usr/include/sys/types.h
dump.o: /usr/include/sys/ucontext.h
dump.o: /usr/include/sys/uio.h
dump.o: /usr/include/time.h
dump.o: /usr/include/xlocale.h
dump.o: <built-in>
dump.o: <command-line>
dump.o: arg.h
dump.o: array.h
dump.o: cmd.h
dump.o: config.h
dump.o: dump.c
dump.o: EXTERN.h
dump.o: form.h
dump.o: handy.h
dump.o: hash.h
dump.o: perl.h
dump.o: regexp.h
dump.o: spat.h
dump.o: stab.h
dump.o: str.h
dump.o: util.h
eval.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
eval.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
eval.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
eval.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
eval.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
eval.o: /usr/include/_ansi.h
eval.o: /usr/include/_newlib_version.h
eval.o: /usr/include/asm/byteorder.h
eval.o: /usr/include/asm/socket.h
eval.o: /usr/include/bits/byteswap.h
eval.o: /usr/include/bits/endian.h
eval.o: /usr/include/bits/wordsize.h
eval.o: /usr/include/ctype.h
eval.o: /usr/include/cygwin/_socketflags.h
eval.o: /usr/include/cygwin/_ucred.h
eval.o: /usr/include/cygwin/config.h
eval.o: /usr/include/cygwin/if.h
eval.o: /usr/include/cygwin/in.h
eval.o: /usr/include/cygwin/in6.h
eval.o: /usr/include/cygwin/signal.h
eval.o: /usr/include/cygwin/socket.h
eval.o: /usr/include/cygwin/sockios.h
eval.o: /usr/include/cygwin/stat.h
eval.o: /usr/include/cygwin/time.h
eval.o: /usr/include/dirent.h
eval.o: /usr/include/endian.h
eval.o: /usr/include/errno.h
eval.o: /usr/include/features.h
eval.o: /usr/include/limits.h
eval.o: /usr/include/machine/_default_types.h
eval.o: /usr/include/machine/_endian.h
eval.o: /usr/include/machine/_time.h
eval.o: /usr/include/machine/_types.h
eval.o: /usr/include/machine/endian.h
eval.o: /usr/include/machine/ieeefp.h
eval.o: /usr/include/machine/setjmp.h
eval.o: /usr/include/machine/time.h
eval.o: /usr/include/machine/types.h
eval.o: /usr/include/netinet/in.h
eval.o: /usr/include/newlib.h
eval.o: /usr/include/setjmp.h
eval.o: /usr/include/signal.h
eval.o: /usr/include/stdint.h
eval.o: /usr/include/stdio.h
eval.o: /usr/include/sys/_intsup.h
eval.o: /usr/include/sys/_pthreadtypes.h
eval.o: /usr/include/sys/_sigset.h
eval.o: /usr/include/sys/_stdint.h
eval.o: /usr/include/sys/_timespec.h
eval.o: /usr/include/sys/_timeval.h
eval.o: /usr/include/sys/_types.h
eval.o: /usr/include/sys/cdefs.h
eval.o: /usr/include/sys/config.h
eval.o: /usr/include/sys/dirent.h
eval.o: /usr/include/sys/errno.h
eval.o: /usr/include/sys/features.h
eval.o: /usr/include/sys/ioctl.h
eval.o: /usr/include/sys/lock.h
eval.o: /usr/include/sys/param.h
eval.o: /usr/include/sys/reent.h
eval.o: /usr/include/sys/select.h
eval.o: /usr/include/sys/signal.h
eval.o: /usr/include/sys/socket.h
eval.o: /usr/include/sys/stat.h
eval.o: /usr/include/sys/stdio.h
eval.o: /usr/include/sys/sysmacros.h
eval.o: /usr/include/sys/termios.h
eval.o: /usr/include/sys/time.h
eval.o: /usr/include/sys/times.h
eval.o: /usr/include/sys/timespec.h
eval.o: /usr/include/sys/types.h
eval.o: /usr/include/sys/ucontext.h
eval.o: /usr/include/sys/uio.h
eval.o: /usr/include/time.h
eval.o: /usr/include/xlocale.h
eval.o: <built-in>
eval.o: <command-line>
eval.o: arg.h
eval.o: array.h
eval.o: cmd.h
eval.o: config.h
eval.o: eval.c
eval.o: evalargs.xc
eval.o: EXTERN.h
eval.o: form.h
eval.o: handy.h
eval.o: hash.h
eval.o: perl.h
eval.o: regexp.h
eval.o: spat.h
eval.o: stab.h
eval.o: str.h
eval.o: util.h
form.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
form.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
form.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
form.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
form.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
form.o: /usr/include/_ansi.h
form.o: /usr/include/_newlib_version.h
form.o: /usr/include/asm/byteorder.h
form.o: /usr/include/asm/socket.h
form.o: /usr/include/bits/byteswap.h
form.o: /usr/include/bits/endian.h
form.o: /usr/include/bits/wordsize.h
form.o: /usr/include/ctype.h
form.o: /usr/include/cygwin/_socketflags.h
form.o: /usr/include/cygwin/_ucred.h
form.o: /usr/include/cygwin/config.h
form.o: /usr/include/cygwin/if.h
form.o: /usr/include/cygwin/in.h
form.o: /usr/include/cygwin/in6.h
form.o: /usr/include/cygwin/signal.h
form.o: /usr/include/cygwin/socket.h
form.o: /usr/include/cygwin/sockios.h
form.o: /usr/include/cygwin/stat.h
form.o: /usr/include/cygwin/time.h
form.o: /usr/include/dirent.h
form.o: /usr/include/endian.h
form.o: /usr/include/features.h
form.o: /usr/include/limits.h
form.o: /usr/include/machine/_default_types.h
form.o: /usr/include/machine/_endian.h
form.o: /usr/include/machine/_time.h
form.o: /usr/include/machine/_types.h
form.o: /usr/include/machine/endian.h
form.o: /usr/include/machine/ieeefp.h
form.o: /usr/include/machine/setjmp.h
form.o: /usr/include/machine/time.h
form.o: /usr/include/machine/types.h
form.o: /usr/include/netinet/in.h
form.o: /usr/include/newlib.h
form.o: /usr/include/setjmp.h
form.o: /usr/include/signal.h
form.o: /usr/include/stdint.h
form.o: /usr/include/stdio.h
form.o: /usr/include/sys/_intsup.h
form.o: /usr/include/sys/_pthreadtypes.h
form.o: /usr/include/sys/_sigset.h
form.o: /usr/include/sys/_stdint.h
form.o: /usr/include/sys/_timespec.h
form.o: /usr/include/sys/_timeval.h
form.o: /usr/include/sys/_types.h
form.o: /usr/include/sys/cdefs.h
form.o: /usr/include/sys/config.h
form.o: /usr/include/sys/dirent.h
form.o: /usr/include/sys/features.h
form.o: /usr/include/sys/ioctl.h
form.o: /usr/include/sys/lock.h
form.o: /usr/include/sys/param.h
form.o: /usr/include/sys/reent.h
form.o: /usr/include/sys/select.h
form.o: /usr/include/sys/signal.h
form.o: /usr/include/sys/socket.h
form.o: /usr/include/sys/stat.h
form.o: /usr/include/sys/stdio.h
form.o: /usr/include/sys/sysmacros.h
form.o: /usr/include/sys/termios.h
form.o: /usr/include/sys/time.h
form.o: /usr/include/sys/times.h
form.o: /usr/include/sys/timespec.h
form.o: /usr/include/sys/types.h
form.o: /usr/include/sys/ucontext.h
form.o: /usr/include/sys/uio.h
form.o: /usr/include/time.h
form.o: /usr/include/xlocale.h
form.o: <built-in>
form.o: <command-line>
form.o: arg.h
form.o: array.h
form.o: cmd.h
form.o: config.h
form.o: EXTERN.h
form.o: form.c
form.o: form.h
form.o: handy.h
form.o: hash.h
form.o: perl.h
form.o: regexp.h
form.o: spat.h
form.o: stab.h
form.o: str.h
form.o: util.h
hash.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
hash.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
hash.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
hash.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
hash.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
hash.o: /usr/include/_ansi.h
hash.o: /usr/include/_newlib_version.h
hash.o: /usr/include/asm/byteorder.h
hash.o: /usr/include/asm/socket.h
hash.o: /usr/include/bits/byteswap.h
hash.o: /usr/include/bits/endian.h
hash.o: /usr/include/bits/wordsize.h
hash.o: /usr/include/ctype.h
hash.o: /usr/include/cygwin/_socketflags.h
hash.o: /usr/include/cygwin/_ucred.h
hash.o: /usr/include/cygwin/config.h
hash.o: /usr/include/cygwin/if.h
hash.o: /usr/include/cygwin/in.h
hash.o: /usr/include/cygwin/in6.h
hash.o: /usr/include/cygwin/signal.h
hash.o: /usr/include/cygwin/socket.h
hash.o: /usr/include/cygwin/sockios.h
hash.o: /usr/include/cygwin/stat.h
hash.o: /usr/include/cygwin/time.h
hash.o: /usr/include/dirent.h
hash.o: /usr/include/endian.h
hash.o: /usr/include/errno.h
hash.o: /usr/include/features.h
hash.o: /usr/include/limits.h
hash.o: /usr/include/machine/_default_types.h
hash.o: /usr/include/machine/_endian.h
hash.o: /usr/include/machine/_time.h
hash.o: /usr/include/machine/_types.h
hash.o: /usr/include/machine/endian.h
hash.o: /usr/include/machine/ieeefp.h
hash.o: /usr/include/machine/setjmp.h
hash.o: /usr/include/machine/time.h
hash.o: /usr/include/machine/types.h
hash.o: /usr/include/netinet/in.h
hash.o: /usr/include/newlib.h
hash.o: /usr/include/setjmp.h
hash.o: /usr/include/signal.h
hash.o: /usr/include/stdint.h
hash.o: /usr/include/stdio.h
hash.o: /usr/include/sys/_intsup.h
hash.o: /usr/include/sys/_pthreadtypes.h
hash.o: /usr/include/sys/_sigset.h
hash.o: /usr/include/sys/_stdint.h
hash.o: /usr/include/sys/_timespec.h
hash.o: /usr/include/sys/_timeval.h
hash.o: /usr/include/sys/_types.h
hash.o: /usr/include/sys/cdefs.h
hash.o: /usr/include/sys/config.h
hash.o: /usr/include/sys/dirent.h
hash.o: /usr/include/sys/errno.h
hash.o: /usr/include/sys/features.h
hash.o: /usr/include/sys/ioctl.h
hash.o: /usr/include/sys/lock.h
hash.o: /usr/include/sys/param.h
hash.o: /usr/include/sys/reent.h
hash.o: /usr/include/sys/select.h
hash.o: /usr/include/sys/signal.h
hash.o: /usr/include/sys/socket.h
hash.o: /usr/include/sys/stat.h
hash.o: /usr/include/sys/stdio.h
hash.o: /usr/include/sys/sysmacros.h
hash.o: /usr/include/sys/termios.h
hash.o: /usr/include/sys/time.h
hash.o: /usr/include/sys/times.h
hash.o: /usr/include/sys/timespec.h
hash.o: /usr/include/sys/types.h
hash.o: /usr/include/sys/ucontext.h
hash.o: /usr/include/sys/uio.h
hash.o: /usr/include/time.h
hash.o: /usr/include/xlocale.h
hash.o: <built-in>
hash.o: <command-line>
hash.o: arg.h
hash.o: array.h
hash.o: cmd.h
hash.o: config.h
hash.o: EXTERN.h
hash.o: form.h
hash.o: handy.h
hash.o: hash.c
hash.o: hash.h
hash.o: perl.h
hash.o: regexp.h
hash.o: spat.h
hash.o: stab.h
hash.o: str.h
hash.o: util.h
perly.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
perly.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
perly.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
perly.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
perly.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
perly.o: /usr/include/_ansi.h
perly.o: /usr/include/_newlib_version.h
perly.o: /usr/include/asm/byteorder.h
perly.o: /usr/include/asm/socket.h
perly.o: /usr/include/bits/byteswap.h
perly.o: /usr/include/bits/endian.h
perly.o: /usr/include/bits/wordsize.h
perly.o: /usr/include/ctype.h
perly.o: /usr/include/cygwin/_socketflags.h
perly.o: /usr/include/cygwin/_ucred.h
perly.o: /usr/include/cygwin/config.h
perly.o: /usr/include/cygwin/if.h
perly.o: /usr/include/cygwin/in.h
perly.o: /usr/include/cygwin/in6.h
perly.o: /usr/include/cygwin/signal.h
perly.o: /usr/include/cygwin/socket.h
perly.o: /usr/include/cygwin/sockios.h
perly.o: /usr/include/cygwin/stat.h
perly.o: /usr/include/cygwin/time.h
perly.o: /usr/include/dirent.h
perly.o: /usr/include/endian.h
perly.o: /usr/include/features.h
perly.o: /usr/include/limits.h
perly.o: /usr/include/machine/_default_types.h
perly.o: /usr/include/machine/_endian.h
perly.o: /usr/include/machine/_time.h
perly.o: /usr/include/machine/_types.h
perly.o: /usr/include/machine/endian.h
perly.o: /usr/include/machine/ieeefp.h
perly.o: /usr/include/machine/setjmp.h
perly.o: /usr/include/machine/time.h
perly.o: /usr/include/machine/types.h
perly.o: /usr/include/netinet/in.h
perly.o: /usr/include/newlib.h
perly.o: /usr/include/setjmp.h
perly.o: /usr/include/signal.h
perly.o: /usr/include/stdint.h
perly.o: /usr/include/stdio.h
perly.o: /usr/include/sys/_intsup.h
perly.o: /usr/include/sys/_pthreadtypes.h
perly.o: /usr/include/sys/_sigset.h
perly.o: /usr/include/sys/_stdint.h
perly.o: /usr/include/sys/_timespec.h
perly.o: /usr/include/sys/_timeval.h
perly.o: /usr/include/sys/_types.h
perly.o: /usr/include/sys/cdefs.h
perly.o: /usr/include/sys/config.h
perly.o: /usr/include/sys/dirent.h
perly.o: /usr/include/sys/features.h
perly.o: /usr/include/sys/ioctl.h
perly.o: /usr/include/sys/lock.h
perly.o: /usr/include/sys/param.h
perly.o: /usr/include/sys/reent.h
perly.o: /usr/include/sys/select.h
perly.o: /usr/include/sys/signal.h
perly.o: /usr/include/sys/socket.h
perly.o: /usr/include/sys/stat.h
perly.o: /usr/include/sys/stdio.h
perly.o: /usr/include/sys/sysmacros.h
perly.o: /usr/include/sys/termios.h
perly.o: /usr/include/sys/time.h
perly.o: /usr/include/sys/times.h
perly.o: /usr/include/sys/timespec.h
perly.o: /usr/include/sys/types.h
perly.o: /usr/include/sys/ucontext.h
perly.o: /usr/include/sys/uio.h
perly.o: /usr/include/time.h
perly.o: /usr/include/xlocale.h
perly.o: <built-in>
perly.o: <command-line>
perly.o: arg.h
perly.o: array.h
perly.o: cmd.h
perly.o: config.h
perly.o: EXTERN.h
perly.o: form.h
perly.o: handy.h
perly.o: hash.h
perly.o: patchlevel.h
perly.o: perl.h
perly.o: perly.c
perly.o: perly.h
perly.o: regexp.h
perly.o: spat.h
perly.o: stab.h
perly.o: str.h
perly.o: util.h
regcomp.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
regcomp.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
regcomp.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
regcomp.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
regcomp.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
regcomp.o: /usr/include/_ansi.h
regcomp.o: /usr/include/_newlib_version.h
regcomp.o: /usr/include/asm/byteorder.h
regcomp.o: /usr/include/asm/socket.h
regcomp.o: /usr/include/bits/byteswap.h
regcomp.o: /usr/include/bits/endian.h
regcomp.o: /usr/include/bits/wordsize.h
regcomp.o: /usr/include/ctype.h
regcomp.o: /usr/include/cygwin/_socketflags.h
regcomp.o: /usr/include/cygwin/_ucred.h
regcomp.o: /usr/include/cygwin/config.h
regcomp.o: /usr/include/cygwin/if.h
regcomp.o: /usr/include/cygwin/in.h
regcomp.o: /usr/include/cygwin/in6.h
regcomp.o: /usr/include/cygwin/signal.h
regcomp.o: /usr/include/cygwin/socket.h
regcomp.o: /usr/include/cygwin/sockios.h
regcomp.o: /usr/include/cygwin/stat.h
regcomp.o: /usr/include/cygwin/time.h
regcomp.o: /usr/include/dirent.h
regcomp.o: /usr/include/endian.h
regcomp.o: /usr/include/features.h
regcomp.o: /usr/include/limits.h
regcomp.o: /usr/include/machine/_default_types.h
regcomp.o: /usr/include/machine/_endian.h
regcomp.o: /usr/include/machine/_time.h
regcomp.o: /usr/include/machine/_types.h
regcomp.o: /usr/include/machine/endian.h
regcomp.o: /usr/include/machine/ieeefp.h
regcomp.o: /usr/include/machine/setjmp.h
regcomp.o: /usr/include/machine/time.h
regcomp.o: /usr/include/machine/types.h
regcomp.o: /usr/include/netinet/in.h
regcomp.o: /usr/include/newlib.h
regcomp.o: /usr/include/setjmp.h
regcomp.o: /usr/include/signal.h
regcomp.o: /usr/include/stdint.h
regcomp.o: /usr/include/stdio.h
regcomp.o: /usr/include/sys/_intsup.h
regcomp.o: /usr/include/sys/_pthreadtypes.h
regcomp.o: /usr/include/sys/_sigset.h
regcomp.o: /usr/include/sys/_stdint.h
regcomp.o: /usr/include/sys/_timespec.h
regcomp.o: /usr/include/sys/_timeval.h
regcomp.o: /usr/include/sys/_types.h
regcomp.o: /usr/include/sys/cdefs.h
regcomp.o: /usr/include/sys/config.h
regcomp.o: /usr/include/sys/dirent.h
regcomp.o: /usr/include/sys/features.h
regcomp.o: /usr/include/sys/ioctl.h
regcomp.o: /usr/include/sys/lock.h
regcomp.o: /usr/include/sys/param.h
regcomp.o: /usr/include/sys/reent.h
regcomp.o: /usr/include/sys/select.h
regcomp.o: /usr/include/sys/signal.h
regcomp.o: /usr/include/sys/socket.h
regcomp.o: /usr/include/sys/stat.h
regcomp.o: /usr/include/sys/stdio.h
regcomp.o: /usr/include/sys/sysmacros.h
regcomp.o: /usr/include/sys/termios.h
regcomp.o: /usr/include/sys/time.h
regcomp.o: /usr/include/sys/times.h
regcomp.o: /usr/include/sys/timespec.h
regcomp.o: /usr/include/sys/types.h
regcomp.o: /usr/include/sys/ucontext.h
regcomp.o: /usr/include/sys/uio.h
regcomp.o: /usr/include/time.h
regcomp.o: /usr/include/xlocale.h
regcomp.o: <built-in>
regcomp.o: <command-line>
regcomp.o: arg.h
regcomp.o: array.h
regcomp.o: cmd.h
regcomp.o: config.h
regcomp.o: EXTERN.h
regcomp.o: form.h
regcomp.o: handy.h
regcomp.o: hash.h
regcomp.o: INTERN.h
regcomp.o: perl.h
regcomp.o: regcomp.c
regcomp.o: regcomp.h
regcomp.o: regexp.h
regcomp.o: spat.h
regcomp.o: stab.h
regcomp.o: str.h
regcomp.o: util.h
regexec.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
regexec.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
regexec.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
regexec.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
regexec.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
regexec.o: /usr/include/_ansi.h
regexec.o: /usr/include/_newlib_version.h
regexec.o: /usr/include/asm/byteorder.h
regexec.o: /usr/include/asm/socket.h
regexec.o: /usr/include/bits/byteswap.h
regexec.o: /usr/include/bits/endian.h
regexec.o: /usr/include/bits/wordsize.h
regexec.o: /usr/include/ctype.h
regexec.o: /usr/include/cygwin/_socketflags.h
regexec.o: /usr/include/cygwin/_ucred.h
regexec.o: /usr/include/cygwin/config.h
regexec.o: /usr/include/cygwin/if.h
regexec.o: /usr/include/cygwin/in.h
regexec.o: /usr/include/cygwin/in6.h
regexec.o: /usr/include/cygwin/signal.h
regexec.o: /usr/include/cygwin/socket.h
regexec.o: /usr/include/cygwin/sockios.h
regexec.o: /usr/include/cygwin/stat.h
regexec.o: /usr/include/cygwin/time.h
regexec.o: /usr/include/dirent.h
regexec.o: /usr/include/endian.h
regexec.o: /usr/include/features.h
regexec.o: /usr/include/limits.h
regexec.o: /usr/include/machine/_default_types.h
regexec.o: /usr/include/machine/_endian.h
regexec.o: /usr/include/machine/_time.h
regexec.o: /usr/include/machine/_types.h
regexec.o: /usr/include/machine/endian.h
regexec.o: /usr/include/machine/ieeefp.h
regexec.o: /usr/include/machine/setjmp.h
regexec.o: /usr/include/machine/time.h
regexec.o: /usr/include/machine/types.h
regexec.o: /usr/include/netinet/in.h
regexec.o: /usr/include/newlib.h
regexec.o: /usr/include/setjmp.h
regexec.o: /usr/include/signal.h
regexec.o: /usr/include/stdint.h
regexec.o: /usr/include/stdio.h
regexec.o: /usr/include/sys/_intsup.h
regexec.o: /usr/include/sys/_pthreadtypes.h
regexec.o: /usr/include/sys/_sigset.h
regexec.o: /usr/include/sys/_stdint.h
regexec.o: /usr/include/sys/_timespec.h
regexec.o: /usr/include/sys/_timeval.h
regexec.o: /usr/include/sys/_types.h
regexec.o: /usr/include/sys/cdefs.h
regexec.o: /usr/include/sys/config.h
regexec.o: /usr/include/sys/dirent.h
regexec.o: /usr/include/sys/features.h
regexec.o: /usr/include/sys/ioctl.h
regexec.o: /usr/include/sys/lock.h
regexec.o: /usr/include/sys/param.h
regexec.o: /usr/include/sys/reent.h
regexec.o: /usr/include/sys/select.h
regexec.o: /usr/include/sys/signal.h
regexec.o: /usr/include/sys/socket.h
regexec.o: /usr/include/sys/stat.h
regexec.o: /usr/include/sys/stdio.h
regexec.o: /usr/include/sys/sysmacros.h
regexec.o: /usr/include/sys/termios.h
regexec.o: /usr/include/sys/time.h
regexec.o: /usr/include/sys/times.h
regexec.o: /usr/include/sys/timespec.h
regexec.o: /usr/include/sys/types.h
regexec.o: /usr/include/sys/ucontext.h
regexec.o: /usr/include/sys/uio.h
regexec.o: /usr/include/time.h
regexec.o: /usr/include/xlocale.h
regexec.o: <built-in>
regexec.o: <command-line>
regexec.o: arg.h
regexec.o: array.h
regexec.o: cmd.h
regexec.o: config.h
regexec.o: EXTERN.h
regexec.o: form.h
regexec.o: handy.h
regexec.o: hash.h
regexec.o: perl.h
regexec.o: regcomp.h
regexec.o: regexec.c
regexec.o: regexp.h
regexec.o: spat.h
regexec.o: stab.h
regexec.o: str.h
regexec.o: util.h
stab.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
stab.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
stab.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
stab.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
stab.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
stab.o: /usr/include/_ansi.h
stab.o: /usr/include/_newlib_version.h
stab.o: /usr/include/asm/byteorder.h
stab.o: /usr/include/asm/socket.h
stab.o: /usr/include/bits/byteswap.h
stab.o: /usr/include/bits/endian.h
stab.o: /usr/include/bits/wordsize.h
stab.o: /usr/include/ctype.h
stab.o: /usr/include/cygwin/_socketflags.h
stab.o: /usr/include/cygwin/_ucred.h
stab.o: /usr/include/cygwin/config.h
stab.o: /usr/include/cygwin/if.h
stab.o: /usr/include/cygwin/in.h
stab.o: /usr/include/cygwin/in6.h
stab.o: /usr/include/cygwin/signal.h
stab.o: /usr/include/cygwin/socket.h
stab.o: /usr/include/cygwin/sockios.h
stab.o: /usr/include/cygwin/stat.h
stab.o: /usr/include/cygwin/time.h
stab.o: /usr/include/dirent.h
stab.o: /usr/include/endian.h
stab.o: /usr/include/features.h
stab.o: /usr/include/limits.h
stab.o: /usr/include/machine/_default_types.h
stab.o: /usr/include/machine/_endian.h
stab.o: /usr/include/machine/_time.h
stab.o: /usr/include/machine/_types.h
stab.o: /usr/include/machine/endian.h
stab.o: /usr/include/machine/ieeefp.h
stab.o: /usr/include/machine/setjmp.h
stab.o: /usr/include/machine/time.h
stab.o: /usr/include/machine/types.h
stab.o: /usr/include/netinet/in.h
stab.o: /usr/include/newlib.h
stab.o: /usr/include/setjmp.h
stab.o: /usr/include/signal.h
stab.o: /usr/include/stdint.h
stab.o: /usr/include/stdio.h
stab.o: /usr/include/sys/_intsup.h
stab.o: /usr/include/sys/_pthreadtypes.h
stab.o: /usr/include/sys/_sigset.h
stab.o: /usr/include/sys/_stdint.h
stab.o: /usr/include/sys/_timespec.h
stab.o: /usr/include/sys/_timeval.h
stab.o: /usr/include/sys/_types.h
stab.o: /usr/include/sys/cdefs.h
stab.o: /usr/include/sys/config.h
stab.o: /usr/include/sys/dirent.h
stab.o: /usr/include/sys/features.h
stab.o: /usr/include/sys/ioctl.h
stab.o: /usr/include/sys/lock.h
stab.o: /usr/include/sys/param.h
stab.o: /usr/include/sys/reent.h
stab.o: /usr/include/sys/select.h
stab.o: /usr/include/sys/signal.h
stab.o: /usr/include/sys/socket.h
stab.o: /usr/include/sys/stat.h
stab.o: /usr/include/sys/stdio.h
stab.o: /usr/include/sys/sysmacros.h
stab.o: /usr/include/sys/termios.h
stab.o: /usr/include/sys/time.h
stab.o: /usr/include/sys/times.h
stab.o: /usr/include/sys/timespec.h
stab.o: /usr/include/sys/types.h
stab.o: /usr/include/sys/ucontext.h
stab.o: /usr/include/sys/uio.h
stab.o: /usr/include/time.h
stab.o: /usr/include/xlocale.h
stab.o: <built-in>
stab.o: <command-line>
stab.o: arg.h
stab.o: array.h
stab.o: cmd.h
stab.o: config.h
stab.o: EXTERN.h
stab.o: form.h
stab.o: handy.h
stab.o: hash.h
stab.o: perl.h
stab.o: regexp.h
stab.o: spat.h
stab.o: stab.c
stab.o: stab.h
stab.o: str.h
stab.o: util.h
str.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
str.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
str.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
str.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
str.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
str.o: /usr/include/_ansi.h
str.o: /usr/include/_newlib_version.h
str.o: /usr/include/asm/byteorder.h
str.o: /usr/include/asm/socket.h
str.o: /usr/include/bits/byteswap.h
str.o: /usr/include/bits/endian.h
str.o: /usr/include/bits/wordsize.h
str.o: /usr/include/ctype.h
str.o: /usr/include/cygwin/_socketflags.h
str.o: /usr/include/cygwin/_ucred.h
str.o: /usr/include/cygwin/config.h
str.o: /usr/include/cygwin/if.h
str.o: /usr/include/cygwin/in.h
str.o: /usr/include/cygwin/in6.h
str.o: /usr/include/cygwin/signal.h
str.o: /usr/include/cygwin/socket.h
str.o: /usr/include/cygwin/sockios.h
str.o: /usr/include/cygwin/stat.h
str.o: /usr/include/cygwin/time.h
str.o: /usr/include/dirent.h
str.o: /usr/include/endian.h
str.o: /usr/include/features.h
str.o: /usr/include/limits.h
str.o: /usr/include/machine/_default_types.h
str.o: /usr/include/machine/_endian.h
str.o: /usr/include/machine/_time.h
str.o: /usr/include/machine/_types.h
str.o: /usr/include/machine/endian.h
str.o: /usr/include/machine/ieeefp.h
str.o: /usr/include/machine/setjmp.h
str.o: /usr/include/machine/time.h
str.o: /usr/include/machine/types.h
str.o: /usr/include/netinet/in.h
str.o: /usr/include/newlib.h
str.o: /usr/include/setjmp.h
str.o: /usr/include/signal.h
str.o: /usr/include/stdint.h
str.o: /usr/include/stdio.h
str.o: /usr/include/sys/_intsup.h
str.o: /usr/include/sys/_pthreadtypes.h
str.o: /usr/include/sys/_sigset.h
str.o: /usr/include/sys/_stdint.h
str.o: /usr/include/sys/_timespec.h
str.o: /usr/include/sys/_timeval.h
str.o: /usr/include/sys/_types.h
str.o: /usr/include/sys/cdefs.h
str.o: /usr/include/sys/config.h
str.o: /usr/include/sys/dirent.h
str.o: /usr/include/sys/features.h
str.o: /usr/include/sys/ioctl.h
str.o: /usr/include/sys/lock.h
str.o: /usr/include/sys/param.h
str.o: /usr/include/sys/reent.h
str.o: /usr/include/sys/select.h
str.o: /usr/include/sys/signal.h
str.o: /usr/include/sys/socket.h
str.o: /usr/include/sys/stat.h
str.o: /usr/include/sys/stdio.h
str.o: /usr/include/sys/sysmacros.h
str.o: /usr/include/sys/termios.h
str.o: /usr/include/sys/time.h
str.o: /usr/include/sys/times.h
str.o: /usr/include/sys/timespec.h
str.o: /usr/include/sys/types.h
str.o: /usr/include/sys/ucontext.h
str.o: /usr/include/sys/uio.h
str.o: /usr/include/time.h
str.o: /usr/include/xlocale.h
str.o: <built-in>
str.o: <command-line>
str.o: arg.h
str.o: array.h
str.o: cmd.h
str.o: config.h
str.o: EXTERN.h
str.o: form.h
str.o: handy.h
str.o: hash.h
str.o: perl.h
str.o: perly.h
str.o: regexp.h
str.o: spat.h
str.o: stab.h
str.o: str.c
str.o: str.h
str.o: util.h
toke.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
toke.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
toke.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
toke.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
toke.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
toke.o: /usr/include/_ansi.h
toke.o: /usr/include/_newlib_version.h
toke.o: /usr/include/asm/byteorder.h
toke.o: /usr/include/asm/socket.h
toke.o: /usr/include/bits/byteswap.h
toke.o: /usr/include/bits/endian.h
toke.o: /usr/include/bits/wordsize.h
toke.o: /usr/include/ctype.h
toke.o: /usr/include/cygwin/_socketflags.h
toke.o: /usr/include/cygwin/_ucred.h
toke.o: /usr/include/cygwin/config.h
toke.o: /usr/include/cygwin/if.h
toke.o: /usr/include/cygwin/in.h
toke.o: /usr/include/cygwin/in6.h
toke.o: /usr/include/cygwin/signal.h
toke.o: /usr/include/cygwin/socket.h
toke.o: /usr/include/cygwin/sockios.h
toke.o: /usr/include/cygwin/stat.h
toke.o: /usr/include/cygwin/time.h
toke.o: /usr/include/dirent.h
toke.o: /usr/include/endian.h
toke.o: /usr/include/features.h
toke.o: /usr/include/limits.h
toke.o: /usr/include/machine/_default_types.h
toke.o: /usr/include/machine/_endian.h
toke.o: /usr/include/machine/_time.h
toke.o: /usr/include/machine/_types.h
toke.o: /usr/include/machine/endian.h
toke.o: /usr/include/machine/ieeefp.h
toke.o: /usr/include/machine/setjmp.h
toke.o: /usr/include/machine/time.h
toke.o: /usr/include/machine/types.h
toke.o: /usr/include/netinet/in.h
toke.o: /usr/include/newlib.h
toke.o: /usr/include/setjmp.h
toke.o: /usr/include/signal.h
toke.o: /usr/include/stdint.h
toke.o: /usr/include/stdio.h
toke.o: /usr/include/sys/_intsup.h
toke.o: /usr/include/sys/_pthreadtypes.h
toke.o: /usr/include/sys/_sigset.h
toke.o: /usr/include/sys/_stdint.h
toke.o: /usr/include/sys/_timespec.h
toke.o: /usr/include/sys/_timeval.h
toke.o: /usr/include/sys/_types.h
toke.o: /usr/include/sys/cdefs.h
toke.o: /usr/include/sys/config.h
toke.o: /usr/include/sys/dirent.h
toke.o: /usr/include/sys/features.h
toke.o: /usr/include/sys/ioctl.h
toke.o: /usr/include/sys/lock.h
toke.o: /usr/include/sys/param.h
toke.o: /usr/include/sys/reent.h
toke.o: /usr/include/sys/select.h
toke.o: /usr/include/sys/signal.h
toke.o: /usr/include/sys/socket.h
toke.o: /usr/include/sys/stat.h
toke.o: /usr/include/sys/stdio.h
toke.o: /usr/include/sys/sysmacros.h
toke.o: /usr/include/sys/termios.h
toke.o: /usr/include/sys/time.h
toke.o: /usr/include/sys/times.h
toke.o: /usr/include/sys/timespec.h
toke.o: /usr/include/sys/types.h
toke.o: /usr/include/sys/ucontext.h
toke.o: /usr/include/sys/uio.h
toke.o: /usr/include/time.h
toke.o: /usr/include/xlocale.h
toke.o: <built-in>
toke.o: <command-line>
toke.o: arg.h
toke.o: array.h
toke.o: cmd.h
toke.o: config.h
toke.o: EXTERN.h
toke.o: form.h
toke.o: handy.h
toke.o: hash.h
toke.o: perl.h
toke.o: perly.h
toke.o: regexp.h
toke.o: spat.h
toke.o: stab.h
toke.o: str.h
toke.o: toke.c
toke.o: util.h
util.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/limits.h
util.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdarg.h
util.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stddef.h
util.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/stdint.h
util.o: /lib/gcc/x86_64-pc-cygwin/7.4.0/include/syslimits.h
util.o: /usr/include/_ansi.h
util.o: /usr/include/_newlib_version.h
util.o: /usr/include/asm/byteorder.h
util.o: /usr/include/asm/socket.h
util.o: /usr/include/bits/byteswap.h
util.o: /usr/include/bits/endian.h
util.o: /usr/include/bits/wordsize.h
util.o: /usr/include/ctype.h
util.o: /usr/include/cygwin/_socketflags.h
util.o: /usr/include/cygwin/_ucred.h
util.o: /usr/include/cygwin/config.h
util.o: /usr/include/cygwin/if.h
util.o: /usr/include/cygwin/in.h
util.o: /usr/include/cygwin/in6.h
util.o: /usr/include/cygwin/signal.h
util.o: /usr/include/cygwin/socket.h
util.o: /usr/include/cygwin/sockios.h
util.o: /usr/include/cygwin/stat.h
util.o: /usr/include/cygwin/time.h
util.o: /usr/include/dirent.h
util.o: /usr/include/endian.h
util.o: /usr/include/errno.h
util.o: /usr/include/features.h
util.o: /usr/include/limits.h
util.o: /usr/include/machine/_default_types.h
util.o: /usr/include/machine/_endian.h
util.o: /usr/include/machine/_time.h
util.o: /usr/include/machine/_types.h
util.o: /usr/include/machine/endian.h
util.o: /usr/include/machine/ieeefp.h
util.o: /usr/include/machine/setjmp.h
util.o: /usr/include/machine/time.h
util.o: /usr/include/machine/types.h
util.o: /usr/include/netinet/in.h
util.o: /usr/include/newlib.h
util.o: /usr/include/setjmp.h
util.o: /usr/include/signal.h
util.o: /usr/include/stdint.h
util.o: /usr/include/stdio.h
util.o: /usr/include/sys/_intsup.h
util.o: /usr/include/sys/_pthreadtypes.h
util.o: /usr/include/sys/_sigset.h
util.o: /usr/include/sys/_stdint.h
util.o: /usr/include/sys/_timespec.h
util.o: /usr/include/sys/_timeval.h
util.o: /usr/include/sys/_types.h
util.o: /usr/include/sys/cdefs.h
util.o: /usr/include/sys/config.h
util.o: /usr/include/sys/dirent.h
util.o: /usr/include/sys/errno.h
util.o: /usr/include/sys/features.h
util.o: /usr/include/sys/ioctl.h
util.o: /usr/include/sys/lock.h
util.o: /usr/include/sys/param.h
util.o: /usr/include/sys/reent.h
util.o: /usr/include/sys/select.h
util.o: /usr/include/sys/signal.h
util.o: /usr/include/sys/socket.h
util.o: /usr/include/sys/stat.h
util.o: /usr/include/sys/stdio.h
util.o: /usr/include/sys/sysmacros.h
util.o: /usr/include/sys/termios.h
util.o: /usr/include/sys/time.h
util.o: /usr/include/sys/times.h
util.o: /usr/include/sys/timespec.h
util.o: /usr/include/sys/types.h
util.o: /usr/include/sys/ucontext.h
util.o: /usr/include/sys/uio.h
util.o: /usr/include/time.h
util.o: /usr/include/xlocale.h
util.o: <built-in>
util.o: <command-line>
util.o: arg.h
util.o: array.h
util.o: cmd.h
util.o: config.h
util.o: EXTERN.h
util.o: form.h
util.o: handy.h
util.o: hash.h
util.o: perl.h
util.o: regexp.h
util.o: spat.h
util.o: stab.h
util.o: str.h
util.o: util.c
util.o: util.h
: Makefile.SH config.sh ; /bin/sh Makefile.SH
: makedepend.SH config.sh ; /bin/sh makedepend.SH
# WARNING: Put nothing here or make depend will gobble it up!
