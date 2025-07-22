{pkgs, ...} :{

  wayland.windowManager.hyprland = {
    enable = true;

    package = null;
    portalPackage = null;

    systemd.variables = ["--all"];

    settings = {
      "$mod" = "SUPER";

      bind = [
        "$mod, Return, exec, kitty"
      ];
    };
  };

  programs.kitty.enable = true; # Required for default config

  services.hyprpolkitagent.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };
}
