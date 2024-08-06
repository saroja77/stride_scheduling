# stride_scheduling

Stride scheduler in proc.c, which allocates CPU to a process based on the number of tickets initially allotted to that process. Stride value is inversely proportional to the number of tickets, and the process with the lowest pass value--cumulative stride value--is given running time. Hence a process with more tickets is scheduled more running time.

Additionally, implemented system calls getpinfo and settickets in sysproc.c, the former is used for user to monitor the amount of CPU time allocated, and latter for setting the tickets for a process.

This is based on XV6 OS. xv6 is a re-implementation of Dennis Ritchie's and Ken Thompson's Unix
Version 6 (v6).  xv6 loosely follows the structure and style of v6,
but is implemented for a modern x86-based multiprocessor using ANSI C.

BUILDING AND RUNNING XV6

To build xv6 on an x86 ELF machine (like Linux or FreeBSD), run "make".
On non-x86 or non-ELF machines (like OS X, even on x86), you will
need to install a cross-compiler gcc suite capable of producing x86 ELF
binaries.  See http://pdos.csail.mit.edu/6.828/2014/tools.html.
Then run "make TOOLPREFIX=i386-jos-elf-".

To run xv6, install the QEMU PC simulators.  To run in QEMU, run "make qemu".
