{ _, ... }: {
  home.file."ideavimrc" = {
    text = ''
      set clipboard+=unnamedplus
      nnoremap d "_d
      vnoremap d "_d
      nnoremap D "_D
      vnoremap D "_D
      nnoremap c "_c
      vnoremap c "_c
      nnoremap C "_C
      vnoremap C "_C
      set easymotion
      xnoremap p P
      xnoremap d "_d
    '';
    enable = true;
    target = ".ideavimrc";
  };

}
