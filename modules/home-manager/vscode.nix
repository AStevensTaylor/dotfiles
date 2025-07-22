# A home-manger module for my configuration of VSCode

{
  config,
  inputs, 
  outputs,
  osConfig,
  pkgs,
  ...
}: {
  programs.vscode.enable = true;
  programs.vscode.profiles.default = {
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    extensions = with pkgs.vscodeExtensions; [
    ];
    userSettings = {
      "update.showNotes" = false;
    };
  };
}