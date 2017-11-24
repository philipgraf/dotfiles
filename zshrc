# Set custom prompt
setopt PROMPT_SUBST
autoload -U promptinit
promptinit
prompt grb

# Initialize completion
autoload -U compinit
compinit

# Add pats
export PATH=/usr/local/sbin:/usr/local/bin:${PATH}
export PATH="$HOME/bin:$PATH"

# Colorize terminal
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# Nicer history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# Use vim as the editor
export EDITOR=vi

# Use C-x C-e to edit the current command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

zstyle ':completion:*' menu select=20

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

# Highlight search results in ack.
export ACK_COLOR_MATCH='red'

function mcd() { mkdir -p $1 && cd $1 }
function cdf() { cd *$1*/ } # stolen from @topfunky

# Switch projects
function p() {
        project=$(ls ~/projects | selecta)
        if [[ -n "$project" ]]; then
                cd ~/projects/$project
        fi
}

function dev() {
        folder=$(find $HOME/dev -mindepth 1 -maxdepth 2 -type d | selecta)
        if [[ -n "$folder" ]]; then
                cd $folder
        fi
}

# By default, ^S freezes terminal output and ^Q resumes it. Disable that so
# that those keys can be used for other things.
unsetopt flowcontrol
# Run Selecta in the current working directory, appending the selected path, if
# any, to the current command.
function insert-selecta-path-in-command-line() {
        local selected_path
        # Print a newline or we'll clobber the old prompt.
        echo
        # Find the path; abort if the user doesn't select anything.
        selected_path=$(find * -type f | selecta) || return
        # Append the selection to the current command buffer.
        eval 'LBUFFER="$LBUFFER$selected_path"'
        # Redraw the prompt since Selecta has drawn several new lines of text.
        zle reset-prompt
}
# Create the zle widget
zle -N insert-selecta-path-in-command-line
# Bind the key to the newly created widget
bindkey "^S" "insert-selecta-path-in-command-line"

# Load rbenv automatically by appending
# the following to ~/.zshrc:
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

bindkey "5C" forward-word
bindkey "5D" backward-word

[[ -f $HOME/.zsh_local ]] && source $HOME/.zsh_local
