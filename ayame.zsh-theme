#!/usr/bin/env zsh
# vim:ft=zsh:

autoload -U colors && colors
COLOR_OFF="%{$reset_color%}"

__ayame_pathshorten() {
	setopt localoptions noksharrays extendedglob
	local MATCH MBEGIN MEND
	local -a match mbegin mend
	"${2:-echo}" "${1//(#m)[^\/]##\//${MATCH/(#b)([^.])*/$match[1]}/}"
}

__ayame_path() {
	local COLOR_PATH="%{[38;5;244m%}"
	local _path_="$(__ayame_pathshorten "${PWD/$HOME/~}")"
	echo "${COLOR_PATH}${_path_}${COLOR_OFF}"
}

__ayame_status() {
	local COLOR_FALSE="%{$fg[red]%}"
	local COLOR_TRUE="%{$fg[green]%}"
	local PROMPT_CHAR="❯"
	echo "%(0?.${COLOR_TRUE}.${COLOR_FALSE})${PROMPT_CHAR}${COLOR_OFF}"
}

main() {
	# Allow for functions in the prompt.
	setopt PROMPT_SUBST
	# Hide old prompt
	setopt TRANSIENT_RPROMPT

PROMPT='
$(__ayame_status) '
RPROMPT='$(__ayame_path)'
}

main
