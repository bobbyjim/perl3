Perl3 for Raspbian 2019
=======================

This is my "fork" of the Perl 3 source, which I recently wrestled to compile on the 
Raspberry Pi running Raspbian:

pi@vl53l0x:~ $ lsb_release -a

No LSB modules are available.

Distributor ID:	Raspbian

Description:	Raspbian GNU/Linux 9.4 (stretch)

Release:	9.4

Codename:	stretch


Modifications
-------------

I did make one modification: the random number generator now uses the fast,
small, very good, non-cryptographic PRNG from here:

http://burtleburtle.net/bob/rand/smallprng.html


That's about it.  Oh yes, there's a two-line shell script I used to capture how I built the binary, called compile_perl3.  And the Perl3 binary for Raspbian 9.4 is there as well.


Things Included in Perl3 (WIP)
------------------------------
Here's what Perl3 has:

* $, @, and % (and hash-list assignment)
* heredocs
* "local"
* "interpolation" and backticks
* $_
* <handle> readline
* STDIN, STDOUT and STDERR
* if, for, foreach, unless, while, until, last, continue
* do 'stat.pl';
  Uses the value of EXPR as a filename and executes the 
  contents of the file as a script. Its primary use is to 
  include subroutines from a subroutine library.

* s//   /^abc/
* **, **=, ., .=, string ops, =~ and !~, x, x=, ..
* file test ops

accept(NEWSOCKET,GENERICSOCKET)
Does the same thing that the accept system call does.
Returns true if it succeeded, false otherwise.
See example in section on Interprocess Communication.

bind(SOCKET,NAME)
Does the same thing that the bind system call does.
Returns true if it succeeded, false otherwise.
NAME should be a packed address of the proper type for the socket.
See example in section on Interprocess Communication.

chdir

chmod

chop

chown

chroot

close

closedir

connect(SOCKET,NAME)
Does the same thing that the connect system call does.
Returns true if it succeeded, false otherwise.
NAME should be a package address of the proper type for the socket.
See example in section on Interprocess Communication.

cos

crypt

dbmclose(ASSOC_ARRAY)

dbmopen(ASSOC,DBNAME,MODE)

defined

delete

die

do BLOCK
do SUBROUTINE (params)

do EXPR
Uses the value of EXPR as a filename and executes the contents 
of the file as a perl script. Its primary use is to include 
subroutines from a perl subroutine library.

each

eof

eval

exec

exit

exp

fcntl(FILEHANDLE,FUNCTION,SCALAR)
Implements the fcntl(2) function.
You'll probably have to say

	do "fcntl.h";	# probably /usr/local/lib/perl/fcntl.h

first to get the correct function definitions.
If fcntl.h doesn't exist or doesn't have the correct definitions
you'll have to roll your own, based on your C header files such 
as <sys/fcntl.h>.  (There is a perl script called makelib that 
comes with the perl kit which may help you in this.)
Argument processing and value return works just like ioctl below.
Note that fcntl will produce a fatal error if used on a machine 
that doesn't implement fcntl(2).

fileno(HANDLE)

flock(HANDLE,OPERATION)

fork

getc(FILEHANDLE)

getlogin

getpeername(SOCKET)

getpgrp(PID)

getppid

getpriority(WHICH,WHO)

* getpwnam(NAME)
* getgrnam(NAME)
* gethostbyname(NAME)
* getnetbyname(NAME)
* getprotobyname(NAME)
* getpwuid(UID)
* getgrgid(GID)
* getservbyname(NAME,PROTO)
* gethostbyaddr(ADDR,ADDRTYPE)
* getnetbyaddr(ADDR,ADDRTYPE)
* getprotobynumber(NUMBER)
* getservbyport(PORT,PROTO)
* getpwent()
* getgrent()
* gethostent()
* getnetent()
* getprotoent()
* getservent()
* setpwent()
* setgrent()
* sethostent(STAYOPEN)
* setnetent(STAYOPEN)
* setprotoent(STAYOPEN)
* setservent(STAYOPEN)
* endpwent()
* endgrent()
* endhostent()
* endnetent()
* endprotoent()
* endservent()

These routines perform the same functions as their counterparts 
in the system library. The return values from the various get 
routines are as follows:


	($name,$passwd,$uid,$gid,
	   $quota,$comment,$gcos,$dir,$shell) = getpw.\|.\|.
	($name,$passwd,$gid,$members) = getgr.\|.\|.
	($name,$aliases,$addrtype,$length,@addrs) = gethost.\|.\|.
	($name,$aliases,$addrtype,$net) = getnet.\|.\|.
	($name,$aliases,$proto) = getproto.\|.\|.
	($name,$aliases,$port,$proto) = getserv.\|.\|.


The $members value returned by getgr.\|.\|. is a space separated 
list of the login names of the members of the group.

The @addrs value returned by the gethost.\|.\|. functions is a 
list of the raw addresses returned by the corresponding system 
library call. In the Internet domain, each address is four bytes 
long and you can unpack it by saying something like:

	($a,$b,$c,$d) = unpack('C4',$addr[0]);

getsockname(SOCKET)
Returns the packed sockaddr address of this end of the SOCKET connection.

	# An internet sockaddr
	$sockaddr = 'S n a4 x8';
	$mysockaddr = getsockname(S);
	($family, $port, $myaddr) = unpack($sockaddr,$mysockaddr);


getsockopt(SOCKET,LEVEL,OPTNAME)
Returns the socket option requested, or undefined if there is an error.

