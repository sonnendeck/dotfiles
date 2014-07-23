# Avoid succesive duplicates in the bash command history.
export HISTCONTROL=ignoredups:ignorespace

# Append commands to the bash command history file (~/.bash_history)
# instead of overwriting it.
shopt -s histappend

# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Load git bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -d $RBENV_ROOT ]; then
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init -)"
fi

#############################################################################
#                               P r o m p t
#############################################################################



# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi


# Get the name of the branch we are on
git_prompt_info() {
  branch_prompt=$(__git_ps1)
  if [ -n "$branch_prompt" ]; then
    status_icon=$(git_status)
    if [ "$status_icon" == "+" ]; then
      echo "$branch_prompt" $status_icon
    else
      echo "$branch_prompt"
    fi
  fi
}

# Show '+' character if changes are pending
git_status() {
  if current_git_status=$(git status | grep 'staged for commit\|Changes to be committed'  2> /dev/null); then
    echo '+'
  else
    echo ''
  fi
}

# good git aware prompt
export PS1="\[\033[1;37m\][\w]\[\033[1;36m\]\[\033[1;33m\]\$(git_prompt_info)\[\033[1;0m\] $ "

## Old test prompts
#export PS1="\[\033[1;34m\][\t] \[\033[1;37m\][\w] \[\033[1;33m\]\$(git_prompt_info) \[\033[1;0m\]$ "
#export PS1="\[\033[1;39m\][\t]\[\033]0;\u@\h: \w\007\]\[\033[1;34m\]\u\[\033[0m\]@\[\033[1;39m\]\h\[\033[0m\] \[\033[1;33m\][\w]\[\033[1;0m\]\$(git_prompt_info) $ "

# general path munging
PATH=/usr/local/bin:${PATH}
#PATH=${PATH}:~/bin


#####################
#   Documentation   #
#####################

# Change the look of the prompt 
# -----------------------------
# \d – Current date
# \t – Current time
# \h – Host name
# \# – Command number
# \u – User name
# \W – Current working directory (ie: Desktop/)
# \w – Current working directory, full path (ie: /Users/Admin/Desktop 

# color values
#    0 Reset colors to 37;40 
#    1 Bold text. In reality, it's not really bold, text is only brighter. 
#    5 Blinking text. Many terminal apps don't support this 
#    7 Reverse video, inverts the background and the foreground colors 
#   30 Black 
#   31 Red 
#   32 Green 
#   33 Yellow 
#   34 Blue 
#   35 Magenta 
#   36 Cyan 
#   37 White 
#   40 Black background 
#   41 Red background 
#   42 Green background 
#   43 Yellow background 
#   44 Blue background 
#   45 Magenta background 
#   46 Cyan background 
#   47 White background 
#
# To use colors you have to use the ANSI syntax : \033[color-value m
#   Example: \033[32m
# Use semicolon to group values: \033[1;32;47m # bold and green with white background

# export PS1="\033[32m[\t] \h@\u [\w] $\033[37m "
# export PS1="\033[32m[\t]\u [\w] $\033[37m "
# export PS1="\033[32m[\t] [\w] $\033[37m "
# export PS1='\[\033[32m[\t]\] [\w] →\[\033[m\] '
# export PS1='\[\033[31m\]\w →\[\033[m\] '
# export CLICOLOR=1;

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
