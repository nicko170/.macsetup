#!/bin/bash

pretty_print() {
  printf "\n%b\n" "$1"
}

cd ~

defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder AppleShowAllFiles TRUE
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXPreferredViewStyle Clmv
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.dock show-process-indicators -bool true
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 12
chflags nohidden ~/Library
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
xcode-select --install
sleep 1
osascript -e 'tell application "System Events"' -e 'tell process "Install Command Line Developer Tools"' -e 'keystroke return' -e 'click button "Agree" of window "License Agreement"' -e 'end tell' -e 'end tell'

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install coreutils
brew install findutils
brew tap homebrew/dupes
brew install homebrew/dupes/grep
printf 'export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"' >> ~/.zshrc
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

git config --global user.name "Nick Pratley"
git config --global user.email "nick@npratley.net"

git config --global core.excludesfile '~/.gitignore'
echo '.DS_Store' >> ~/.gitignore

git config --global credential.helper osxkeychain

git config --global color.ui true




pretty_print "Installing Ultimate VIM Runtime"

git clone https://github.com/nicko170/vimrc .vim_runtime

sh .vim_runtime/install_awesome_vimrc.sh

pretty_print "Installing Oh My Tmux!"
git clone https://github.com/nicko170/.tmux .tmux

ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .


