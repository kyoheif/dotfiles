# シンプルな zshrc
# License : MIT
# http://mollifier.mit-license.org/
 
# Enable zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit
zstyle ':completion:*:default' menu select=1

# Push stack automatically
setopt auto_pushd
# Ignore duplicated directories
setopt pushd_ignore_dups
 
# Settings for histories
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
## Ignore duplicated command
setopt hist_ignore_all_dups
setopt hist_save_nodups
## Ugnore spaces
setopt hist_ignore_space
## Reduce blanks
setopt hist_reduce_blanks
 

# Environmnet variables
export LANG=ja_JP.UTF-8

# Use colors
autoload -Uz colors
colors

# Enable multi columns
PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
%# "

# Show Japanese filenames
setopt print_eight_bit
 
# Ignore flow control
setopt no_flow_control
 
# Assume a word beginnign with '#' as comments
setopt interactive_comments

# Complete file pathes
setopt magic_equal_subst
 
# Share histories with other zsh processes
setopt share_history
 
# Show completion list
setopt auto_menu
 
# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation.
setopt extended_glob

# Settings for MacVim
case ${OSTYPE} in
	darwin*)
		export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
		alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
		alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
esac

# invoke tmux when zsh is invoked
if [ "$TMUX" = "" ] && [[ $TERM_PROGRAM != "vscode" ]] ; then
	tmux attach;
	if [ $? ]; then
		tmux;
	fi
fi

# Settings for anyenv
if [ -d $HOME/.anyenv ] ; then
	export PATH="$HOME/.anyenv/bin:$PATH"
	eval "$(anyenv init -)"
	# for tmux
	for D in `ls $HOME/.anyenv/envs`
	do
		export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
	done
fi

# Key binds
bindkey -e
## Delete
bindkey "^[[3~" delete-char
## Home
bindkey "^[[1~" beginning-of-line
## End
bindkey "^[[4~" end-of-line

# vim:set ft=zsh :

