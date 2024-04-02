{ config, pkgs, ... }: {
  environment.sessionVariables = {
    #NPM_CONFIG_PREFIX= "~/.npm-global";
    #DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
    #DOTNET_TOOLS = "$HOME/.dotnet/tools";
    #NPM_BIN = "$HOME/.npm-global/bin";
    #PATH = "$DOTNET_TOOLS:$NPM_BIN:$PATH";
  };
}
