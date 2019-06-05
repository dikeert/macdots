#!/usr/bin/env bash

dirf() {
	local dir="$1"

	find "${HOME}/${dir}" -type d -maxdepth 1 -mindepth 1 | xargs -I {} basename {} | sort -r | fzf --height=40% --sync
}

cdf() {
	local dir="$1"
	cd "${HOME}/${dir}/$(dirf "$dir")"
}

codef() {
	local dir="$1"
	local target="$(dirf "$dir")"

	if [ "$target" == "" ] || [ "$target" == "." ]; then
		exit 1
	else
		code "${HOME}/${dir}/${target}"
	fi
}

alias src="cdf work/src"
alias dos="cdf work/dos"
alias cde="codef work/src"
alias hms="cdf work/homes"
alias gg='cdf $(pwd | sed "s|/Users/aermolenko/||")'

