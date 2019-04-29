#!/usr/bin/env bash

cdf() {
	local dir="$1"
	cd "${HOME}/${dir}/$(find "${HOME}/${dir}" -type d -maxdepth 1 -mindepth 1 | xargs -I {} basename {} | sort -r | fzf --height=40% --sync)"
}

alias src="cdf work/src"
alias dos="cdf work/dos"

