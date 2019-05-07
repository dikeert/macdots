#!/usr/bin/env bash

mkdir -p "${HOME}/.config"
mkdir -p "${HOME}/.local/bin"
mkdir -p "${HOME}/.cache/mpd"

stow -R bash -t "${HOME}"
stow -R nvim -t "${HOME}"
stow -R mpd -t "${HOME}"
stow -R scripts -t "${HOME}/.local/bin"
stow -R hammerspoon -t "${HOME}"

