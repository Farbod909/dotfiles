local ret_status="%{$fg_bold[yellow]%}➜ " # I don't want the arrow to change colors even if the previous command was invalid.
local path_string="%{$fg[cyan]%}%2~%{$reset_color%}" # Only show the last two folders

# ***** GIT STUFF *****

GIT_REBASE="\uE0A0"
GIT_UNPULLED="⇣"
GIT_UNPUSHED="⇡"

colorize() {
  echo "%F{$1}$2%f"
}

git_rebase_check() {
  git_dir=$(git rev-parse --git-dir)

  if test -d "$git_dir/rebase-merge" -o -d "$git_dir/rebase-apply"; then
    echo $GIT_REBASE
  fi
}

git_remote_check() {
  local_commit=$(git rev-parse "@" 2>&1)
  remote_commit=$(git rev-parse "@{u}" 2>&1)
  common_base=$(git merge-base "@" "@{u}" 2>&1) # last common commit

  if [[ $local_commit != $remote_commit ]]; then
    if [[ $common_base == $remote_commit ]]; then
      echo $GIT_UNPUSHED
    elif [[ $common_base == $local_commit ]]; then
      echo $GIT_UNPULLED
    else
      echo $GIT_UNPUSHED $GIT_UNPULLED
    fi
  fi
}


git_symbol() {
  echo "$(git_rebase_check) $(git_remote_check)"
}

git_time_since_commit() {
  if [[ $(git log &> /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
    # Get the last commit.
    last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null)
    now=$(date +%s)
    seconds_since_last_commit=$((now - last_commit))

    # Totals
    minutes=$((seconds_since_last_commit / 60))
    hours=$((seconds_since_last_commit / 3600))

    # Sub-hours and sub-minutes
    days=$((seconds_since_last_commit / 86400))
    sub_hours=$((hours % 24))
    sub_minutes=$((minutes % 60))

    if [ $hours -gt 24 ]; then
      echo $(colorize "red" "${days}d")
    elif [ $minutes -gt 60 ]; then
      echo $(colorize "white" "${sub_hours}h${sub_minutes}m")
    else
      echo $(colorize "green" "${minutes}m")
    fi
  fi
}

git_custom_prompt() {
  local branch=$(current_branch)
  if [ -n "$branch" ]; then
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(git_symbol) $(colorize 242 $branch) : $(git_time_since_commit) : $(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=$(colorize "red" "⬡")
ZSH_THEME_GIT_PROMPT_CLEAN=$(colorize "green" "⬢")

# ***** END GIT STUFF *****

PROMPT='${ret_status} ${path_string} %{$fg_bold[white]%}'
RPROMPT='$(git_custom_prompt)'

