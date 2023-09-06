{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    historyControl = [ "erasedups" "ignorespace" ];
    initExtra = ''
      
    '';
    bashrcExtra = ''
      R="\e[0m"
      
      BG_BLACK="\[\033[40m\]"
      BG_RED="\[\033[41m\]"
      BG_GREEN="\[\033[42m\]"
      BG_YELLOW="\[\033[43m\]"
      BG_BLUE="\[\033[44m\]"
      BG_PURPLE="\[\033[45m\]"
      BG_CYAN="\[\033[46m\]"
      BG_WHITE="\[\033[47m\]"
      
      FG_BLACK="\[\033[30m\]"
      FG_RED="\[\033[31m\]"
      FG_GREEN="\[\033[32m\]"
      FG_YELLOW="\[\033[33m\]"
      FG_BLUE="\[\033[34m\]"
      FG_PURPLE="\[\033[35m\]"
      FG_CYAN="\[\033[36m\]"
      FG_WHITE="\[\033[37m\]"
      
      TEXT_COLOR="$FG_BLACK"
      
      # opening char
      O=""
      # closing char
      C=""
      
      source "$HOME/.local/bin/scripts/git-prompt"
      
      function GIT {
        GIT_PS1_SHOWDIRTYSTATE="1"
        GIT_PS1_SHOWSTASHSTATE=
      	GIT_PS1_SHOWSUNTRACKEDFILES=
      	GIT_PS1_SHOWUPSTREAM="auto"
      	GIT_PS1_STATESEPARATOR=" "
      	git status > /dev/null 2>&1 && echo -e "\e[31m$O\e[41m\e[30m$( __git_ps1 | sed 's/[()]//g' )\e[0m\e[31m$C\e[0m"
      }
      
      
      # setting the prompt
      HOST="$FG_GREEN$O$BG_GREEN$TEXT_COLOR\h$R$FG_GREEN$C$R"
      CWD="$FG_CYAN$O$BG_CYAN$TEXT_COLOR\w$R$FG_CYAN$C$R"
      PROMPT="\n\$ "
      PS1="$HOST $CWD \$(GIT) $PROMPT"
    '';
  };
}