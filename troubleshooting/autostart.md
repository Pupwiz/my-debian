# Auto start application after GUI is ready

Well, there are myriad of options.
It can be done with systemd too.

See example of the service file at `../dotfiles/systemd`.
To enable it use following commands:
    
    systemctl --user enable unclutter
    systemctl --user start unclutter
