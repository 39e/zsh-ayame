setopt prompt_subst

PROMPT=""
RPROMPT=""
SPROMPT=""
PROMPT_CHAR="❯"

__ayame::prompt::path() {
	local _path_="$(__ayame::misc::pathshorten "${PWD/$HOME/~}")"

	echo "${COLOR_PATH}${_path_}${COLOR_OFF}"
}

__ayame::prompt::status() {
	echo "%(0?.${COLOR_TRUE}.${COLOR_FALSE})${PROMPT_CHAR}${COLOR_OFF}"
}

__ayame::prompt::correct() {
	echo "${COLOR_FALSE}Did you mean?: %R -> %r [nyae]? ${COLOR_OFF}"
}
