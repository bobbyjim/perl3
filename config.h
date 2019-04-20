/* config.h
 * This file was produced by running the config.h.SH script, which
 * gets its values from config.sh, which is generally produced by
 * running Configure.
 *
 * Feel free to modify any of this as the need arises.  Note, however,
 * that running config.h.SH again will wipe out any changes you've made.
 * For a more permanent change edit config.sh and rerun config.h.SH.
 */


/* EUNICE:
 *	This symbol, if defined, indicates that the program is being compiled
 *	under the EUNICE package under VMS.  The program will need to handle
 *	things like files that don't go away the first time you unlink them,
 *	due to version numbering.  It will also need to compensate for lack
 *	of a respectable link() command.
 */
/* VMS:
 *	This symbol, if defined, indicates that the program is running under
 *	VMS.  It is currently only set in conjunction with the EUNICE symbol.
 */
/*#undef	EUNICE		/**/
/*#undef	VMS		/**/

/* BIN:
 *	This symbol holds the name of the directory in which the user wants
 *	to put publicly executable images for the package in question.  It
 *	is most often a local directory such as /usr/local/bin.
 */
#define BIN "/usr/local/bin"             /**/

/* BYTEORDER:
 *	This symbol contains an encoding of the order of bytes in a long.
 *	Usual values (in octal) are 01234, 04321, 02143, 03412...
 */
#define BYTEORDER 01234		/**/

/* CPPSTDIN:
 *	This symbol contains the first part of the string which will invoke
 *	the C preprocessor on the standard input and produce to standard
 *	output.	 Typical value of "cc -E" or "/lib/cpp".
 */
/* CPPMINUS:
 *	This symbol contains the second part of the string which will invoke
 *	the C preprocessor on the standard input and produce to standard
 *	output.  This symbol will have the value "-" if CPPSTDIN needs a minus
 *	to specify standard input, otherwise the value is "".
 */
#define CPPSTDIN "/usr/bin/cpp"
#define CPPMINUS ""

/* BCMP:
 *	This symbol, if defined, indicates that the bcmp routine is available
 *	to compare blocks of memory.  If undefined, use memcmp.  If that's
 *	not available, roll your own.
 */
/*#undef	BCMP		/**/

/* BCOPY:
 *	This symbol, if defined, indicates that the bcopy routine is available
 *	to copy blocks of memory.  Otherwise you should probably use memcpy().
 */
/*#undef	BCOPY		/**/

/* CHARSPRINTF:
 *	This symbol is defined if this system declares "char *sprintf()" in
 *	stdio.h.  The trend seems to be to declare it as "int sprintf()".  It
 *	is up to the package author to declare sprintf correctly based on the
 *	symbol.
 */
/*#undef	CHARSPRINTF 	/**/

/* CRYPT:
 *	This symbol, if defined, indicates that the crypt routine is available
 *	to encrypt passwords and the like.
 */
/*#undef	CRYPT		/**/

/* DOSUID:
 *	This symbol, if defined, indicates that the C program should
 *	check the script that it is executing for setuid/setgid bits, and
 *	attempt to emulate setuid/setgid on systems that have disabled
 *	setuid #! scripts because the kernel can't do it securely.
 *	It is up to the package designer to make sure that this emulation
 *	is done securely.  Among other things, it should do an fstat on
 *	the script it just opened to make sure it really is a setuid/setgid
 *	script, it should make sure the arguments passed correspond exactly
 *	to the argument on the #! line, and it should not trust any
 *	subprocesses to which it must pass the filename rather than the
 *	file descriptor of the script to be executed.
 */
/*#undef DOSUID		/**/

/* DUP2:
 *	This symbol, if defined, indicates that the dup2 routine is available
 *	to dup file descriptors.  Otherwise you should use dup().
 */
/*#undef	DUP2		/**/

/* FCHMOD:
 *	This symbol, if defined, indicates that the fchmod routine is available
 *	to change mode of opened files.  If unavailable, use chmod().
 */
/*#undef	FCHMOD		/**/

/* FCHOWN:
 *	This symbol, if defined, indicates that the fchown routine is available
 *	to change ownership of opened files.  If unavailable, use chown().
 */
/*#undef	FCHOWN		/**/

/* FCNTL:
 *	This symbol, if defined, indicates to the C program that it should
 *	include fcntl.h.
 */
#define	FCNTL		/**/

/* FLOCK:
 *	This symbol, if defined, indicates that the flock() routine is
 *	available to do file locking.
 */
/*#undef	FLOCK		/**/

/* GETGROUPS:
 *	This symbol, if defined, indicates that the getgroups() routine is
 *	available to get the list of process groups.  If unavailable, multiple
 *	groups are probably not supported.
 */
/*#undef	GETGROUPS		/**/

/* GETHOSTENT:
 *	This symbol, if defined, indicates that the gethostent() routine is
 *	available to lookup host names in some data base or other.
 */
/*#undef	GETHOSTENT		/**/

/* GETPGRP:
 *	This symbol, if defined, indicates that the getpgrp() routine is
 *	available to get the current process group.
 */
/*#undef	GETPGRP		/**/

/* GETPRIORITY:
 *	This symbol, if defined, indicates that the getpriority() routine is
 *	available to get a process's priority.
 */
/*#undef	GETPRIORITY		/**/

/* HTONS:
 *	This symbol, if defined, indicates that the htons routine (and friends)
 *	are available to do network order byte swapping.
 */
/* HTONL:
 *	This symbol, if defined, indicates that the htonl routine (and friends)
 *	are available to do network order byte swapping.
 */
/* NTOHS:
 *	This symbol, if defined, indicates that the ntohs routine (and friends)
 *	are available to do network order byte swapping.
 */
/* NTOHL:
 *	This symbol, if defined, indicates that the ntohl routine (and friends)
 *	are available to do network order byte swapping.
 */
/*#undef	HTONS		/**/
/*#undef	HTONL		/**/
/*#undef	NTOHS		/**/
/*#undef	NTOHL		/**/

/* index:
 *	This preprocessor symbol is defined, along with rindex, if the system
 *	uses the strchr and strrchr routines instead.
 */
/* rindex:
 *	This preprocessor symbol is defined, along with index, if the system
 *	uses the strchr and strrchr routines instead.
 */
/*#undef	index strchr	/* cultural */
/*#undef	rindex strrchr	/*  differences? */

/* IOCTL:
 *	This symbol, if defined, indicates that sys/ioctl.h exists and should
 *	be included.
 */
/*#undef	IOCTL		/**/

/* KILLPG:
 *	This symbol, if defined, indicates that the killpg routine is available
 *	to kill process groups.  If unavailable, you probably should use kill
 *	with a negative process number.
 */
/*#undef	KILLPG		/**/

/* MEMCMP:
 *	This symbol, if defined, indicates that the memcmp routine is available
 *	to compare blocks of memory.  If undefined, roll your own.
 */
/*#undef	MEMCMP		/**/

/* MEMCPY:
 *	This symbol, if defined, indicates that the memcpy routine is available
 *	to copy blocks of memory.  Otherwise you should probably use bcopy().
 *	If neither is defined, roll your own.
 */
/*#undef	MEMCPY		/**/

/* MKDIR:
 *	This symbol, if defined, indicates that the mkdir routine is available
 *	to create directories.  Otherwise you should fork off a new process to
 *	exec /bin/mkdir.
 */
/*#undef	MKDIR		/**/

/* NDBM:
 *	This symbol, if defined, indicates that ndbm.h exists and should
 *	be included.
 */
/*#undef	NDBM		/**/

/* ODBM:
 *	This symbol, if defined, indicates that dbm.h exists and should
 *	be included.
 */
/*#undef	ODBM		/**/

/* READDIR:
 *	This symbol, if defined, indicates that the readdir routine is available
 *	from the C library to create directories.
 */
/*#undef	READDIR		/**/

/* RENAME:
 *	This symbol, if defined, indicates that the rename routine is available
 *	to rename files.  Otherwise you should do the unlink(), link(), unlink()
 *	trick.
 */
/*#undef	RENAME		/**/

/* RMDIR:
 *	This symbol, if defined, indicates that the rmdir routine is available
 *	to remove directories.  Otherwise you should fork off a new process to
 *	exec /bin/rmdir.
 */
/*#undef	RMDIR		/**/

/* SETEGID:
 *	This symbol, if defined, indicates that the setegid routine is available
 *	to change the effective gid of the current program.
 */
/*#undef	SETEGID		/**/

/* SETEUID:
 *	This symbol, if defined, indicates that the seteuid routine is available
 *	to change the effective uid of the current program.
 */
/*#undef	SETEUID		/**/

/* SETPGRP:
 *	This symbol, if defined, indicates that the setpgrp() routine is
 *	available to set the current process group.
 */
/*#undef	SETPGRP		/**/

/* SETPRIORITY:
 *	This symbol, if defined, indicates that the setpriority() routine is
 *	available to set a process's priority.
 */
/*#undef	SETPRIORITY		/**/

/* SETREGID:
 *	This symbol, if defined, indicates that the setregid routine is
 *	available to change the real and effective gid of the current program.
 */
/* SETRESGID:
 *	This symbol, if defined, indicates that the setresgid routine is
 *	available to change the real, effective and saved gid of the current
 *	program.
 */
/*#undef	SETREGID		/**/
/*#undef	SETRESGID		/**/

/* SETREUID:
 *	This symbol, if defined, indicates that the setreuid routine is
 *	available to change the real and effective uid of the current program.
 */
/* SETRESUID:
 *	This symbol, if defined, indicates that the setresuid routine is
 *	available to change the real, effective and saved uid of the current
 *	program.
 */
/*#undef	SETREUID		/**/
/*#undef	SETRESUID		/**/

/* SETRGID:
 *	This symbol, if defined, indicates that the setrgid routine is available
 *	to change the real gid of the current program.
 */
/*#undef	SETRGID		/**/

/* SETRUID:
 *	This symbol, if defined, indicates that the setruid routine is available
 *	to change the real uid of the current program.
 */
/*#undef	SETRUID		/**/

/* SOCKET:
 *	This symbol, if defined, indicates that the BSD socket interface is
 *	supported.
 */
/* SOCKETPAIR:
 *	This symbol, if defined, indicates that the BSD socketpair call is
 *	supported.
 */
/* OLDSOCKET:
 *	This symbol, if defined, indicates that the 4.1c BSD socket interface
 *	is supported instead of the 4.2/4.3 BSD socket interface.
 */
/*#undef	SOCKET		/**/

/*#undef	SOCKETPAIR	/**/

/*#undef	OLDSOCKET	/**/

/* STATBLOCKS:
 *	This symbol is defined if this system has a stat structure declaring
 *	st_blksize and st_blocks.
 */
/*#undef	STATBLOCKS 	/**/

/* STDSTDIO:
 *	This symbol is defined if this system has a FILE structure declaring
 *	_ptr and _cnt in stdio.h.
 */
/*#undef	STDSTDIO 	/**/

/* STRUCTCOPY:
 *	This symbol, if defined, indicates that this C compiler knows how
 *	to copy structures.  If undefined, you'll need to use a block copy
 *	routine of some sort instead.
 */
#define	STRUCTCOPY	/**/

/* SYMLINK:
 *	This symbol, if defined, indicates that the symlink routine is available
 *	to create symbolic links.
 */
/*#undef	SYMLINK		/**/

/* SYSCALL:
 *	This symbol, if defined, indicates that the syscall routine is available
 *	to call arbitrary system calls.  If undefined, that's tough.
 */
/*#undef	SYSCALL		/**/

/* TMINSYS:
 *	This symbol is defined if this system declares "struct tm" in
 *	in <sys/time.h> rather than <time.h>.  We can't just say
 *	-I/usr/include/sys because some systems have both time files, and
 *	the -I trick gets the wrong one.
 */
/* I_SYSTIME:
 *	This symbol is defined if this system has the file <sys/time.h>.
 */
/*#undef	TMINSYS 	/**/
/*#undef	I_SYSTIME 	/**/

/* VARARGS:
 *	This symbol, if defined, indicates to the C program that it should
 *	include varargs.h.
 */
/*#undef	VARARGS		/**/

/* VFORK:
 *	This symbol, if defined, indicates that vfork() exists.
 */
/*#undef	VFORK	/**/

/* VOIDSIG:
 *	This symbol is defined if this system declares "void (*signal())()" in
 *	signal.h.  The old way was to declare it as "int (*signal())()".  It
 *	is up to the package author to declare things correctly based on the
 *	symbol.
 */
#define	VOIDSIG 	/**/

/* VPRINTF:
 *	This symbol, if defined, indicates that the vprintf routine is available
 *	to printf with a pointer to an argument list.  If unavailable, you
 *	may need to write your own, probably in terms of _doprnt().
 */
/* CHARVSPRINTF:
 *	This symbol is defined if this system has vsprintf() returning type
 *	(char*).  The trend seems to be to declare it as "int vsprintf()".  It
 *	is up to the package author to declare vsprintf correctly based on the
 *	symbol.
 */
/*#undef	VPRINTF		/**/
/*#undef	CHARVSPRINTF 	/**/

/* GIDTYPE:
 *	This symbol has a value like gid_t, int, ushort, or whatever type is
 *	used to declare group ids in the kernel.
 */
#define GIDTYPE unsigned short		/**/

/* I_DIRENT:
 *	This symbol, if defined, indicates to the C program that it should
 *	include dirent.h.
 */
/* DIRNAMLEN:
 *	This symbol, if defined, indicates to the C program that the length
 *	of directory entry names is provided by a d_namlen field.  Otherwise
 *	you need to do strlen() on the d_name field.
 */
#define	I_DIRENT		/**/
/*#undef	DIRNAMLEN		/**/

/* I_FCNTL:
 *	This symbol, if defined, indicates to the C program that it should
 *	include fcntl.h.
 */
#define	I_FCNTL		/**/

/* I_GRP:
 *	This symbol, if defined, indicates to the C program that it should
 *	include grp.h.
 */
#define	I_GRP		/**/

/* I_NETINET_IN:
 *	This symbol, if defined, indicates to the C program that it should
 *	include netinet/in.h.
 */
#define	I_NETINET_IN		/**/

/* I_PWD:
 *	This symbol, if defined, indicates to the C program that it should
 *	include pwd.h.
 */
/* PWQUOTA:
 *	This symbol, if defined, indicates to the C program that struct passwd
 *	contains pw_quota.
 */
/* PWAGE:
 *	This symbol, if defined, indicates to the C program that struct passwd
 *	contains pw_age.
 */
/* PWCHANGE:
 *	This symbol, if defined, indicates to the C program that struct passwd
 *	contains pw_change.
 */
/* PWCLASS:
 *	This symbol, if defined, indicates to the C program that struct passwd
 *	contains pw_class.
 */
/* PWEXPIRE:
 *	This symbol, if defined, indicates to the C program that struct passwd
 *	contains pw_expire.
 */
#define	I_PWD		/**/
/*#undef	PWQUOTA		/**/
/*#undef	PWAGE		/**/
/*#undef	PWCHANGE	/**/
/*#undef	PWCLASS		/**/
/*#undef	PWEXPIRE	/**/

/* I_SYSDIR:
 *	This symbol, if defined, indicates to the C program that it should
 *	include sys/dir.h.
 */
/*#undef	I_SYSDIR		/**/

/* I_SYSIOCTL:
 *	This symbol, if defined, indicates that sys/ioctl.h exists and should
 *	be included.
 */
/*#undef	I_SYSIOCTL		/**/

/* I_VARARGS:
 *	This symbol, if defined, indicates to the C program that it should
 *	include varargs.h.
 */
/*#undef	I_VARARGS		/**/

/* I_VFORK:
 *	This symbol, if defined, indicates to the C program that it should
 *	include vfork.h.
 */
/*#undef	I_VFORK		/**/

/* INTSIZE:
 *	This symbol contains the size of an int, so that the C preprocessor
 *	can make decisions based on it.
 */
#define INTSIZE 4		/**/

/* RANDBITS:
 *	This symbol contains the number of bits of random number the rand()
 *	function produces.  Usual values are 15, 16, and 31.
 */
#define RANDBITS 31		/**/

/* SIG_NAME:
 *	This symbol contains an list of signal names in order.
 */
#define SIG_NAME "ZERO","0","HUP","INT","QUIT","ILL","TRAP","ABRT","BUS","FPE","KILL","USR1","SEGV","USR2","PIPE","ALRM","TERM","16","CHLD","CONT","STOP","TSTP","TTIN","TTOU","URG","XCPU","XFSZ","VTALRM","PROF","WINCH","IO","PWR","SYS","32","33","RTMIN","RTMIN+1","RTMIN+2","RTMIN+3","RTMIN+4","RTMIN+5","RTMIN+6","RTMIN+7","RTMIN+8","RTMIN+9","RTMIN+10","RTMIN+11","RTMIN+12","RTMIN+13","RTMIN+14","RTMIN+15","RTMAX-14","RTMAX-13","RTMAX-12","RTMAX-11","RTMAX-10","RTMAX-9","RTMAX-8","RTMAX-7","RTMAX-6","RTMAX-5","RTMAX-4","RTMAX-3","RTMAX-2","RTMAX-1","RTMAX"		/**/

/* STDCHAR:
 *	This symbol is defined to be the type of char used in stdio.h.
 *	It has the values "unsigned char" or "char".
 */
#define STDCHAR char	/**/

/* UIDTYPE:
 *	This symbol has a value like uid_t, int, ushort, or whatever type is
 *	used to declare user ids in the kernel.
 */
#define UIDTYPE unsigned short		/**/

/* VOIDFLAGS:
 *	This symbol indicates how much support of the void type is given by this
 *	compiler.  What various bits mean:
 *
 *	    1 = supports declaration of void
 *	    2 = supports arrays of pointers to functions returning void
 *	    4 = supports comparisons between pointers to void functions and
 *		    addresses of void functions
 *
 *	The package designer should define VOIDUSED to indicate the requirements
 *	of the package.  This can be done either by #defining VOIDUSED before
 *	including config.h, or by defining defvoidused in Myinit.U.  If the
 *	latter approach is taken, only those flags will be tested.  If the
 *	level of void support necessary is not present, defines void to int.
 */
#ifndef VOIDUSED
#define VOIDUSED 7
#endif
#define VOIDFLAGS 7
#if (VOIDFLAGS & VOIDUSED) != VOIDUSED
#define void int		/* is void to be avoided? */
#define M_VOID		/* Xenix strikes again */
#endif

/* PRIVLIB:
 *	This symbol contains the name of the private library for this package.
 *	The library is private in the sense that it needn't be in anyone's
 *	execution path, but it should be accessible by the world.  The program
 *	should be prepared to do ~ expansion.
 */
#define PRIVLIB "/usr/local/lib/perl"		/**/

