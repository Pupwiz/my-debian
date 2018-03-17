# AppImage experiment

This folder contains couple of scripts and list file for `wget` to download and
setup some applications from [AppImage](https://appimage.org/) repository.

`AppImage` is a format of executable file packed with all its dependencies.  It's
interesting from usability POV as a way to more simply obtain fresh packages
for Debian with all their dependencies inside to avoid dependency hell and run
recent software on a stable system.

Especially it is interesting in a pair with `firejail` to easily execute such
images in a sandbox.

Scripts in this folder automate downloading bunch of `AppImage`s and wrap them
with *.desktop entries to execute them in the sandbox via `firejail`.

Unfortunately, my experiments lid me to conclusion that this technology is not
mature and popular enough to be practical right now. I was not able to find
some useful and recent packages in the repository. And even from those I tried
only Firefox executed smoothly. Couple of others I tried failed to find
dependency libs (obviously not packed into image).

So, currently this approach is not relyable. Other alternative required.
But I preserved it here in case I decide to review it later.

One usage I can think of for it is to package some apps into this format myself
to isolate app's dependencies from the host system. Sort of a lightweight
alternative to other containers like Docker and LXC. I still need to evaluate
what is more secure and easy to use.

[Here](https://github.com/AppImage/AppImages) is a project, tools and docs about
how to create custom `AppImage`s.

Note: for scripts to work contains of this folder should be placed into
`~/bin`.

