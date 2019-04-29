#!/usr/bin/env bash

_j11() {
	export JAVA_HOME=$(/usr/libexec/java_home -v 11)
}

_j8() {
	export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
}

export MAVEN_OPTS="-Xmx4096m"

alias j11=_j11
alias j8=_j8
