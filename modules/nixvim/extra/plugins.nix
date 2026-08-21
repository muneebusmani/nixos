{ pkgs, ... }: {
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    easy-dotnet-nvim
    dotnet-nvim
    mcphub-nvim
    nvim-window-picker
    plenary-nvim
    # rest-nvim
  ];

}
