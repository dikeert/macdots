#!/usr/bin/env bash

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

for file in $(find /usr/local/etc/bash_completion.d/*); do
    . $file
done
