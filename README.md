Magnus' dotfiles
================

These are my dotfiles for osx. They are slightly opininated for the tools to use,
but do not modify keybindings, install too many plugins etc.

Many of the settings are inspired by [mathiasbynens](https://github.com/mathiasbynens/dotfiles) and [yadr](https://github.com/skwp/dotfiles).

Yes, there is config for both `vim` and `Sublime`. Each tool, each purpose!

## Pre-installation

It is recommended, but not required, to install the following applications.

* [BetterTouchTool](https://www.boastr.net/)
* [Docker(Machine)](https://docs.docker.com/engine/installation/mac/)
* [GPG Tools](https://gpgtools.org/)
* [iTerm2](https://www.iterm2.com/)
* [Skype](https://www.skype.com/en/)
* [Spotify](https://www.spotify.com/)
* [Sublime Text 3](https://www.sublimetext.com/)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [VLC](https://www.videolan.org/vlc/)


## Installation

It is recommended to use `rvm`, for many reasons, but in particular for gem management. If you do not have `rvm` installed, please run:

```
$ rake install:rvm
```

This will also setup `homebrew` and the latest version of `ruby`. After this, install remaining packages and dotfiles by:

```
$ rake install
```

Dotfiles will not be overwritten, but created as a backup

## Post-installation

### iTerm2 Solarized colors

Go to Preferences → Profiles → Colors → Load Presets → Solarized Dark

## Contents

### Tmux
If you are not used to tmux, play around with it a bit. It is similar to `screen`. Here is a [quick guide](https://gist.github.com/MohamedAlaa/2961058) to using tmux.

### Vim
I have not installed any plugins. It is bundled with `vundle`, so installing plugins from here is easy.

### Aliases
Check out `zsh/aliases` for some pretty cool and handy aliases.