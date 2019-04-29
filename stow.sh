#!/usr/bin/env bash

mkdir -p "${HOME}/.config"
mkdir -p "${HOME}/.local/bin"

stow -R bash -t "${HOME}"
stow -R nvim -t "${HOME}"
stow -R hosts -t "${HOME}"
stow -R scripts -t "${HOME}/.local/bin"
stow -R hammerspoon -t "${HOME}"

