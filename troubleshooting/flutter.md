# Flutter

After a while, couple of system updates/upgrades, flutter upgrade, etc,
`flutter doctor` started to show problems with Android SDK.

I had to delete old SDK folder and install cmdtools only from [here](https://developer.android.com/studio#command-tools).

Then I unzipped it into `~/Android/SDK` (so that `~/Android/SDK/cmdline-tools` appeared).

I had to add paths to `$PATH` in the `.bash_custom` (see in the repo).

And to install minimal SDK I had to experiment. It seems minimal requirements are:

    # cd to simplify other commands
    cd Android/SDK/cmdline-tools/latest/bin

    # ensure we have recent cmdline-tools
    sdkmanager --install "cmdline-tools;latest"
    sdkmanager --update

    # this will list all possible components to select most fresh one
    sdkmanager --list

    sdkmanager "platform-tools" "platforms;android-32" "build-tools;32.0.0" "system-images;android-32;google_apis;x86_64"

    # ensure flutter can find it and happy with licenses
    flutter config --android-sdk=Android/SDK
    flutter doctor --android-licenses

Below is a list of installed tools:

    $ sdkmanager --list_installed
    Installed packages:=====================] 100% Fetch remote repository...       
      Path                                        | Version | Description                                | Location                                   
      -------                                     | ------- | -------                                    | -------                                    
      build-tools;32.0.0                          | 32.0.0  | Android SDK Build-Tools 32                 | build-tools/32.0.0                         
      cmdline-tools;latest                        | 5.0     | Android SDK Command-line Tools (latest)    | cmdline-tools/latest                       
      emulator                                    | 31.1.4  | Android Emulator                           | emulator                                   
      patcher;v4                                  | 1       | SDK Patch Applier v4                       | patcher/v4                                 
      platform-tools                              | 31.0.3  | Android SDK Platform-Tools                 | platform-tools                             
      platforms;android-32                        | 1       | Android SDK Platform 32                    | platforms/android-32                       
      system-images;android-32;google_apis;x86_64 | 2       | Google APIs Intel x86 Atom_64 System Image | system-images/android-32/google_apis/x86_64
