#!/usr/bin/env bash

dirf() {
	local dir="$1"

	find "${HOME}/${dir}" -type d -maxdepth 1 -mindepth 1 | xargs -I {} basename {} | sort -r | fzf --height=40% --sync
}

cdf() {
	local dir="$1"
	cd "${HOME}/${dir}/$(dirf "$dir")"
}

git_local_branch() {
    git checkout $(git rev-parse HEAD > /dev/null 2>&1 && git branch -a -vv --color=never | grep -v remote | grep -v '/HEAD\s' | fzf --height 10% --tac | sed 's/^..//' | awk '{print $1}' | sed 's#^remotes/[^/]*/##')
}

git_remote_branch() {
  git checkout $(git rev-parse HEAD > /dev/null 2>&1 && git branch -a -vv --color=never | grep -v '/HEAD\s' | fzf --height 10% --tac | sed 's/^..//' | awk '{print $1}' | sed 's#^remotes/[^/]*/##')
}

git_tag() {
    git checkout $(git rev-parse HEAD > /dev/null 2>&1 && git tag --color=never | fzf --height 10% --tac)
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
alias gcl='git_local_branch'
alias gcr='git_remote_branch'
alias gct='git_tag'

