__ayame::git::branch() {
	local branch_name="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"

	if [[ -n $branch_name ]]; then
		echo "${COLOR_GIT}${branch_name}${COLOR_OFF}"
	fi
}
