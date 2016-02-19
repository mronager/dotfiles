#!/bin/bash
brew update
brew upgrade

# core utils
brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed --default-names
brew install wget --enable-iri
brew install grc
brew install mtr
brew install pv
brew install gpg
brew install tmux
brew install tree

# node
brew install node # This installs `npm` too using the recommended installation method
brew install imagemagick --with-webp

# zsh
brew install zsh

# vim
brew install vim

# git tools
brew install git
brew install gh
brew install diff-so-fancy

# Remove outdated versions from the cellar
brew cleanup

# finally install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"