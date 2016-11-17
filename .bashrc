export PATH=$PATH:~/bin
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Aliases
alias hist='history'
alias ll='ls -lhG'
alias be='bundle exec'
alias diff='diff -u'

# Redefine command to add options
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'

# Set shell variables
export GREP_OPTIONS="--color=auto -E"
export HISTSIZE=10000                                        # 500 is default
export HISTFILESIZE=1000000
#export HISTTIMEFORMAT='%b %d %I:%M %p '                     # using strftime format
export HISTCONTROL=ignoreboth                                # ignoredups:ignorespace
export HISTIGNORE="history:hist:pwd:exit:df:ls:ls -la:ll"

# Customize Terminal
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad                       # sets colors for ls
#export PS1=":> "


# Set sublime as the default editor
#which -s subl && export EDITOR="subl --wait"

# Prompt for git tracked color changes
PROMPT_COMMAND=$PROMPT_COMMAND' PS1="$(set $?; [ $1 -ne 0 ] && echo "${c_error}X "${c_reset})${c_path}\W${c_reset}$(git_prompt) :> "'
export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

# A more colorful prompt
c_reset='\[\e[0m\]'                                        # \[\e[0m\] resets the color to default color
c_error='\[\e[1;31m\]'                                     # \e[1;31m\ sets the color to red (bold)
c_path='\[\e[0;35m\]'                                      # \e[0;35m\ sets the color to purple
c_git_clean='\[\e[0;32m\]'                                 # \e[0;32m\ sets the color to green
c_git_dirty='\[\e[0;31m\]'                                 # \e[0;31m\ sets the color to red

# Determines if the git branch you are on is clean or dirty
git_prompt ()
{
  # Is this a git directory?
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  # Grab working branch name
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  # Clean or dirty branch
  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_git_clean}"
  else
    git_color=${c_git_dirty}
  fi
  echo " [$git_color$git_branch${c_reset}]"
}




[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
