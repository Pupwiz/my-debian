# LibreOffice

I seldom use LibreOffice. It used to work, when I installed it initially.
But today (several months after installation) I wanted to execute it and it refused.

Initially I was mislead by the error in the console:

    javaldx: Could not find a Java Runtime Environment!
    Warning: failed to read path from javaldx

But nothing was wrong with Java installation.
Except `JAVA_HOME` was not set, but it refused to start even when I defined this variable.
Also, after fix, it started without `JAVA_HOME`, so it was not the case.

During attempt to start LibreOffice showed a message box, saying: 

    Extension Manager: exception in synchronize

So, I googled for it and found this old bug:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=853149

I tried suggested solution, and it worked:

    nick@n76vj:~$ ll /var/spool/libreoffice/uno_packages/cache/
    total 12
    drwxr-xr-x 3 root root 4096 Jun  1 12:04 .
    drwxr-xr-x 3 root root 4096 May 31 09:09 ..
    drwxr-x--- 2 root root 4096 Jun  1 12:04 uno_packages
    nick@n76vj:~$ sudo chmod o+rx /var/spool/libreoffice/uno_packages/cache/uno_packages/
    nick@n76vj:~$ ll /var/spool/libreoffice/uno_packages/cache/
    total 12
    drwxr-xr-x 3 root root 4096 Jun  1 12:04 .
    drwxr-xr-x 3 root root 4096 May 31 09:09 ..
    drwxr-xr-x 2 root root 4096 Jun  1 12:04 uno_packages

So, issue was due the read/browse permission into cache directory.
I assume, that guy, opened that bug and myself - we are both use customized
default `umask`, more restrictive, then pre-installed one. So, directories are
created without read/browse access to everyone.

Currently, I don't know how to fix this. It'd be better to add `chown` command
into right LibreOffice package, but I don't know where and original issue is closed.
I may fix it for myself, creating some post-install script, but I'm not sure yet
at which moment it should be executed. So, I'll just save these notes here in
case I'll need them later.

Just to simplify searching for right command, it is:

    $ sudo chmod o+rx /var/spool/libreoffice/uno_packages/cache/uno_packages/
