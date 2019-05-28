for f in "${${(%):-%N}:A:h}"/**/*.(|z)sh(N-.); do
	source "$f"
done
unset f

PROMPT+='
$(__ayame::prompt::path)
$(__ayame::prompt::status) '

PROMPT2+='$(__ayame::prompt::status) '

RPROMPT+='$(__ayame::git::branch)'

SPROMPT+='$(__ayame::prompt::correct)'

# vim:ft=zsh:
