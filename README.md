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

