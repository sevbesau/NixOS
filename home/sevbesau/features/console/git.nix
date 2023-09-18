{
  programs.git = {
    enable = true;
    userName = "sevbesau";
    userEmail = "seppe@sevbesau.xyz";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}