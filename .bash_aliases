#####################
#     Allgemein     #
#####################
alias grep='grep --color=auto'
alias man='man -P most'
alias less='less -ir'

# some more ls aliases
#alias ll='ls -lah' 
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lll='ll'
alias llh='ls -alFh'

# Navigation
alias ..='cd ..'
alias 2..='cd ../..'
alias 3..='cd ../../..'
alias 4..='cd ../../../..'

alias fs="find . -name '*.swp'"

#####################
#        SVN        #
#####################

alias sd="svn diff --diff-cmd ~/bin/svn-diff-meld"
alias svnm="svn st | grep -E '^M|^A|^D'"
alias svnlog="svn log --limit 10 | perl -l40pe 's/^-+/\n/'"

#####################
#        Git        #
#####################

alias gitlogbase="git log --pretty=format:'%ad | %an : %s' --graph"
alias gitlogr="gitlogbase --date=relative"
alias gitlogrw="gitlogr --since='5 days ago'"
alias gitlog="gitlogrw"

alias gpl="git pull"
alias gps="git push"
alias ggpl="git gpull"
alias ggps="git gpush"

alias gitbr="git branch"
alias gb="git br"
alias gbrc="git brc"
alias gc="git co"
alias gs="git st"
alias gd="git diff"
alias gm="git merge"
alias gsu="git submodule update --init"
alias gf="git fetch"

alias branches_with="git br -a | grep "
alias gbw="branches_with"

alias merged_branches="git branch --contains"
alias undo_git_commit="git reset HEAD^1"

delete_branch() {
  echo "Soll der Branch $1 wirklich gelöscht werden? (y/n)"
  read -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    git branch -d $1 && git push origin :$1
  fi
  echo
}

######################
#    Ruby & Rails    #
######################
alias be="bundle exec"
alias rvmc="rvm current"
alias routes_for="rake routes | grep "

#####################
#      Dienste      #
#####################

alias psql_server='pg_ctl -D /usr/local/var/postgres/'
alias psqlstart='psql_server start'
alias psqlstop='psql_server stop'

#####################
#       Tools       #
#####################

# ignore case on search
alias rak='rak -i'

######################
# Load local aliases #
######################
if [ -f .bash_aliases_local ]; then
source .bash_aliases_local
fi
