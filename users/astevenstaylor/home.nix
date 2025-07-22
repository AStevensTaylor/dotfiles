{
    config,
    inputs,
    outputs,
    osConfig,
    pkgs,
    ...
}: {
    imports = [
      ../../modules/home-manager/vscode.nix
      ../../modules/home-manager/vivaldi.nix
      ../../modules/home-manager/nh.nix

      ../../modules/home-manager/hyprland.nix

      ./git.nix
    ];

    home.username = "astevenstaylor";
    home.homeDirectory = "/home/astevenstaylor";


    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "25.05"; 

    programs.home-manager.enable = true;
}