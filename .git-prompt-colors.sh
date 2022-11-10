# This theme for gitprompt.sh is optimized for the "Solarized Dark" and "Solarized Light" color schemes
# tweaked for Ubuntu terminal fonts
# some modifications on colors
# added ruby prompt, and kernel version as well

override_git_prompt_colors() {
  if [ -e ~/.rvm/bin/rvm-prompt ]; then
    RUBY_PROMPT='{$(~/.rvm/bin/rvm-prompt i v)}'
  else
    if command -v rbenv > /dev/null; then
      RUBY_PROMPT='{$(rbenv version | sed -e "s/ (set.*$//")}'
    fi
  fi
  Time12a="\$(date +%H:%M:%S)"
 
  GIT_PROMPT_THEME_NAME="Custom"
  GIT_PROMPT_STAGED="${Yellow}●"
  GIT_PROMPT_UNTRACKED="${Cyan}…"
  GIT_PROMPT_STASHED="${BoldMagenta}⚑"
  GIT_PROMPT_CLEAN="${Green}✔"
  GIT_PROMPT_COMMAND_OK="${Green}✔"
  GIT_PROMPT_COMMAND_FAIL="${Red}✘"
  
  GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${Yellow}${PathShort}"
  GIT_PROMPT_START_ROOT="${GIT_PROMPT_START_USER}"
  if [ -n "$SSH_CLIENT" ]; then
    GIT_PROMPT_END_USER="\n${Cyan}λ ${ResetColor}"
    GIT_PROMPT_END_ROOT="\n${Cyan}» ${ResetColor}"
  else
    GIT_PROMPT_END_USER="\n${BoldBlue} ➭ ${ResetColor}"
    GIT_PROMPT_END_ROOT="\n${BoldRed} # ${ResetColor}"
  fi
  GIT_PROMPT_LEADING_SPACE=1
  GIT_PROMPT_PREFIX=""
  GIT_PROMPT_SUFFIX="" 
  GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING="✭"
}

reload_git_prompt_colors "Custom"
