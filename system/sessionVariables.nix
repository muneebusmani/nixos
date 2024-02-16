{ config, pkgs, ... }: {
  environment.sessionVariables = {
    NPM_CONFIG_PREFIX= "~/.npm-global";
    DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
    PATH = "$HOME/.dotnet/tools:$PATH";
    PATH = "$HOME/.npm-global/bin:$PATH";
  };
}
