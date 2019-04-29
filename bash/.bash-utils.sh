#!/usr/bin/env bash

shorten_path() {
        local current_path=`pwd`
        local last=`echo $current_path | sed -e 's/[^\/]*\///g'`
        local path=""
        [[ $current_path == "$HOME"* ]] && read -ra path <<< "~"
        
        current_path=${current_path/"$HOME"/''}
        current_path=${current_path:1}
        
        IFS="/" read -ra current_path <<< "$current_path"
        for x in "${current_path[@]}"
        do
                if [ "$x" == "$last" ];
                then
                        path="${path}/${x}"
                else
                        path="${path}/${x:0:1}"
                fi
        done
        
        echo $path
}

ddu() {
	du -sch .[!.]* * |sort -h
}

uber_download() {
	lftp -e "pget -c -n128 \"$1\"; quit"
}

dcln() {
	local filter="$1"
	d ps -a | grep $filter | awk '{ print $1 }' | \
		xargs -I '{}' sh -c 'docker stop {}; docker rm {}'
	d volume ls -f dangling=true | tail -n +2 | awk '{ print $2 }' | \
		xargs -I '{}' docker volume rm '{}'
}

