{ pkgs, ... }: {
  programs.delta.enable = true;
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = [
      {
        user = {
          name = "Muneeb Usmani";
          email = "muneebusmani8355@gmail.com";
        };
      }
      {
        credential."https://github.com" = {
          helper = [
            ""
            "!${pkgs.gh}/bin/gh auth git-credential"
          ];
        };
      }
      {
        credential."https://gist.github.com" = {
          helper = [
            ""
            "!${pkgs.gh}/bin/gh auth git-credential"
          ];
        };
      }
    ];
  };

}
