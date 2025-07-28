{ self, ... }: {
  flake = {
    # Common NixOS modules that can be imported by hosts
    nixosModules = {
      # Hyprland desktop environment
      hyprland = "${self}/modules/nixos/display/hyprland.nix";
      
      # Networking modules
      tailscale = "${self}/modules/nixos/networking/tailscale.nix";
      vpn = "${self}/modules/nixos/networking/vpn.nix";
      
      # Services
      pipewire = "${self}/modules/nixos/services/pipewire.nix";
      
      # Programs
      anyrun = "${self}/modules/nixos/programs/anyrun.nix";
      
      # Fonts
      fonts = "${self}/modules/nixos/display/fonts.nix";
    };

    # Common Home Manager modules
    homeManagerModules = {
      # Desktop applications
      hyprland = "${self}/modules/home-manager/hyprland.nix";
      vscode = "${self}/modules/home-manager/vscode.nix";
      vivaldi = "${self}/modules/home-manager/vivaldi.nix";
      anyrun = "${self}/modules/home-manager/anyrun.nix";
      
      # System tools
      nh = "${self}/modules/home-manager/nh.nix";
      
      # Fonts
      fonts = "${self}/modules/home-manager/fonts.nix";
    };
  };
}
