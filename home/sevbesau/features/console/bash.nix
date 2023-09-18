{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    historyControl = [ "erasedups" "ignorespace" ];
    initExtra = ''
      
    '';
    bashrcExtra = ''
      # opening char
      O=""
      # closing char
      C=""
      
      RESET="\e[0m"
      GREEN_ON_BLACK="\e[0m\e[1;33;40m"
      BLACK_ON_GREEN="\e[0m\e[5;30;43m"
      BLUE_ON_BLACK="\e[0m\e[1;35;40m"
      BLACK_ON_BLUE="\e[0m\e[5;30;45m"
      RED_ON_BLACK="\e[0m\e[1;30;40m"
      BLACK_ON_RED="\e[0m\e[5;30;40m"

      source "$HOME/.local/bin/scripts/git-prompt"
      
      function GIT {
        GIT_PS1_SHOWDIRTYSTATE="1"
        GIT_PS1_SHOWSTASHSTATE=
      	GIT_PS1_SHOWSUNTRACKEDFILES=
      	GIT_PS1_SHOWUPSTREAM="auto"
      	GIT_PS1_STATESEPARATOR=" "
      	git status > /dev/null 2>&1 && echo -e "$RED_ON_BLACK$O$BLACK_ON_RED$( __git_ps1 | sed 's/[()]//g' )$RED_ON_BLACK$C"
      }
      
      # setting the prompt
      HOST="$GREEN_ON_BLACK$O$BLACK_ON_GREEN\h$GREEN_ON_BLACK$C"
      CWD="$BLUE_ON_BLACK$O$BLACK_ON_BLUE\w$BLUE_ON_BLACK$C"
      PROMPT="$RESET\n\$ "
      PS1="$HOST $CWD \$(GIT) $PROMPT"
    '';
  };
}