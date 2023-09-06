{ config, pkgs, ... }:

{
  home.file = {
    ".inputrc".text = ''
      $include /etc/inputrc

      set meta-flag on
      set input-meta on
      set convert-meta off
      set output-meta on
      
      # diable bell
      set bell-style none
      
      # no ^C
      set echo-control-characters off
      
      # better completion
      # instant tab suggestions
      set show-all-if-unmodified on
      #set show-all-if-ambiguous on
      
      # color files by types
      set colored-stats on
      set visible-stats on
      set mark-symlinked-directories on
      #set colored-completion-prefix on
      set menu-complete-display-prefix on
      
      # vi mode everywhere!
      set editing-mode vi
      set show-mode-in-prompt on
      set vi-ins-mode-string " + "
      set vi-cmd-mode-string " : "
      
      # cycling history searches through history
      $if mode=vi
      set keymap vi-command
      	"\e[A": history-search-backward
      	"\e[B": history-search-forward
      	j: history-search-forward
      	k: history-search-backward
      set keymap vi-insert
      	"\e[A": history-search-backward
      	"\e[B": history-search-forward
      $endif
    '';
  };
   
}