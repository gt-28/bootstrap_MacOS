#!/bin/bash

BLUE=$(tput setaf 4)
CYAN=$(tput setaf 6)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
# This script lets you configure/Personalize MacOS!
echo "*******************************"
echo "* Personalizing $USER's MacOS  *"
echo "*******************************"

# Install's `homebrew`
printf "${BLUE} Check for Homebrew & Install if not present \n"
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    printf "${CYAN} Homebrew is not present, Installing Homebrew \n"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    printf "${YELLOW} Homebrew is already installed, Updating to latest version \n"
    brew update
fi
printf "${GREEN}\xE2\x9C\x94 Homebrew installed \n"

# Install's require homebrew packages
breweries=(
    autoconf
    automake
    curl
    coreutils
    findutils
    git
    htop
    jq
    tree
    vim
    wget
) 
printf "${BLUE}Installing $breweries \n"
brew install ${breweries[@]}
printf "${GREEN}\xE2\x9C\x94 Brew packages installed \n"

# Install's homebrew casks
brewCasks=(
    iterm
    itsycal
    postman
    signal
    visual-studio-code
    open-in-code
)
printf "${BLUE}Installing $brewCasks \n"
brew cask install ${brewCasks[@]}
printf "${GREEN}\xE2\x9C\x94 BrewCasks installed \n"

# Install Alfred 4
printf "${CYAN}Installing $brewCasks \n"
brew cask install alfred
open -a "Alfred 4"
printf "${GREEN}\xE2\x9C\x94 Alfred installed, please use 'opt+space' \n"

# Install require browser
printf "${CYAN} Choose browser to install \n"
PS3='Please enter your choice: '
options=("google-chrome" "firefox" "microsoft-edge" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "google-chrome")
            echo "you chose choice 1"
            printf "${BLUE} Installing Google Chrome \n"
            brew cask install google-chrome
            ;;
        "firefox")
            echo "you chose choice 2"
            printf "${BLUE} Installing Mozilla Fireox \n"
            brew cask install firefox
            ;;
        "microsoft-edge")
            echo "you chose choice 2"
            printf "${BLUE} Installing Microsoft Edge \n"
            brew cask install microsoft-edge
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

