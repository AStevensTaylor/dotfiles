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
      "update.showReleaseNotes" = false;
      "git.autofetch" =  true;
      "editor.fontFamily" = "JetBrains Mono, monospace";
      "editor.fontSize" = 14;
      "editor.lineHeight" = 24;
      "editor.tabSize" = 2;
      "editor.wordWrap" = "on";
      "editor.autosave" = "afterDelay";
      "git.enableSmartCommit": true

    };
  };
}