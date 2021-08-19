#!/bin/bash

## Just for the sake of colorful ouput
# Helpers
function echo_ok() { echo -e '\033[1;32m[✔]'"$1"'\033[0m'; }
function echo_info() { echo -e '\033[1;34m[INFO:]'"$1"'\033[0m'; }
function echo_warn() { echo -e '\033[1;33m[WARN:]'"$1"'\033[0m'; }
function echo_error() { echo -e '\033[1;31m[ERROR:] '"$1"'\033[0m'; }

# This script lets you configure/Personalize MacOS!
echo_ok "***********************************************************"
echo_ok "   *    Personalizing $USER's MacOS                *       "
echo_ok
echo_ok "   *    Run_time: $(date) @ $(hostname)            *       "
echo_ok "***********************************************************"

# Enter for the administrator password when prompt
echo_info "This Script requires admin/sudo password for installing few applications/packages"
sudo -v

# Keep-alive: update existing `sudo` time stamp until `bootstrap` has finished
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

set -e

# Requires xcode!
echo_info "Ensure Apple's command line tools are installed before running this script"

if type xcode-select >&- && xpath=$(xcode-select --print-path) &&
    test -d "${xpath}" && test -x "${xpath}"; then
    echo_ok "Xcode already installed. Skipping."
else
    echo_info "Installing Xcode…"
    xcode-select --install
    while ! command -v xcode-select >&-; do
        sleep 60
    done
    echo_ok "Xcode installed!"
fi

# Install Homebrew
echo_info "Check for Homebrew & Install if not present"
which -s brew
if [[ $? != 0 ]]; then
    echo_warn "Homebrew is not present, Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo_ok "Homebrew successfully installed"
else
    echo_ok "Homebrew is already installed, Updating to latest version \n"
    brew update
fi

