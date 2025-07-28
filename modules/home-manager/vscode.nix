# A home-manger module for my configuration of VSCode

{
  pkgs,
  ...
}: {
  programs.vscode.enable = true;
  programs.vscode.profiles.default = {
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ];
    userSettings = {
      "update.showReleaseNotes" = false;
      "git.autofetch" =  true;
      "editor.fontFamily" = "JetBrains Mono, monospace";
      "editor.fontSize" = 14;
      "editor.lineHeight" = 24;
      "editor.tabSize" = 2;
      "editor.wordWrap" = "on";
      "files.autoSave" = "onFocusChange";
      "git.enableSmartCommit" =  true;

      /* Nix IDE settings */
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nil}/bin/nil";
      "nix.serverSettings" = {
        nil = {
          formatting = {
            command = ["nixfmt"];
          };
        };
      };
    };
    userMcp = {
      servers = {
        Github = {
          url = "https://api.githubcopilot.com/mcp/";
        };
        Nix = {
          type = "stdio";
          command = "nix";
          args = ["run" "github:utensils/mcp-nixos" "--"];
        };
      };
    };
  };

  home.packages = with pkgs; [
    /* Extra Dev tools */
    uv
    nixfmt
  ];
}