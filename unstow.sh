#!/usr/bin/env bash

mkdir -p "${HOME}/.config"
mkdir -p "${HOME}/.local/bin"

stow -D bash -t "${HOME}"
stow -D nvim -t "${HOME}"
stow -D hosts -t "${HOME}"
stow -D scripts -t "${HOME}/.local/bin"
stow -D hammerspoon -t "${HOME}"

