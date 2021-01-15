# Printer

I have regular troubles with my `HP LaserJet M1132 MFP`.

It has habbit to pretend a flash drive and not behave as a printer.
Usually, it cost several reconnections to different USB ports of my laptop and
couple times of switching printer off and on before it start to print.
Occasionally, I had to reinstall `hp-plugin`.

Recently I faught to make its scanner work. I'm not sure what exactly helped 
finally, but what I did in order:

1. Installed sane utils: `sudo apt install sane-utils`.
2. Ensured that `lsusb`, `sane-find-scanner` and `scanimage -L` list my scanner.
3. `scanimage > img.pnm` won't work, though with IO error.
4. Checked `journalctl` and saw massages, suggesting to reinstall `hp-plugin` and run `hp-systray` in background.
5. Found that there is no anything like `hp-systray` on my path.
6. Upgraded hplip from backports: `sudo apt install -t buster-backports hplip`.
7. Tried to run `hp-plugin` without `sudo`, as recomended, to ensure that it
   cannot install plugin, requires `root` password, doesn't allow to choose
   another user, while `root` is disabled on my system.
8. Tried to run `sudo hp-plugin` as do not recommended, but kinda works.
9. Ensured that there is still nothing as `hp-systray` on my laptop.
10. Guessed to execute `hp-info`, which launched some tray icon.

It started to work after that, even `simple-scan`.

I found, that preferences in the `simple-scan` (contrast and brightness) has no
effect, but it's rather minor issue after 2 hours of fight.

