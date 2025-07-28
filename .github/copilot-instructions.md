# NixOS Flake Configuration - AI Agent Instructions

This is a NixOS Flake for managing desktop environments with Hyprland, structured for multi-host and multi-user configurations.

## Architecture Overview

**Three-layer separation**: System-level (NixOS), user-level (Home Manager), and host-specific configurations are cleanly separated for maximum reusability.

- **`flake.nix`**: Defines inputs (nixpkgs, home-manager, hyprland, anyrun) and outputs. Home Manager is integrated as a NixOS module, NOT standalone.
- **`hosts/`**: Host-specific NixOS configurations. Import system modules from `modules/nixos/`.
- **`users/`**: User-specific Home Manager configurations. Import user modules from `modules/home-manager/`.
- **`modules/`**: Reusable modules organized by scope:
  - `modules/nixos/`: System-level configurations (display servers, networking, system programs)
  - `modules/home-manager/`: User-level configurations (desktop apps, window managers, user programs)

## Critical Import Patterns

**NixOS modules** are imported in `hosts/*/configuration.nix`:
```nix
imports = [
  ../../modules/nixos/display/hyprland.nix
];
```

**Home Manager modules** are imported in `users/*/home.nix`:
```nix
imports = [
  ../../modules/home-manager/hyprland.nix
  ../../modules/home-manager/vscode.nix
];
```

**Both layers needed for complete functionality**: System enables Hyprland (`modules/nixos/display/hyprland.nix`), user configures it (`modules/home-manager/hyprland.nix`).

## Essential Workflows

Because the system is flake based, all files must be added into the git repository to be used, they do not need to be committed, but they must be added.

**Build and test configuration**:
```bash
nixos-rebuild build .#deadbeef  # Always build before applying
```

**Apply configuration**:
```bash
sudo nixos-rebuild switch .#deadbeef
```

**Inputs and cachix**: External flakes (hyprland, anyrun) require specific substituters configured in corresponding NixOS modules (see `modules/nixos/programs/anyrun.nix` for pattern).

## Key Conventions

- **Module naming**: Match directory structure (`modules/nixos/display/hyprland.nix` for system Hyprland config)
- **Cross-module dependencies**: Import related modules explicitly (fonts modules import in display modules)
- **Inputs threading**: Pass `inputs` as `specialArgs` in flake.nix, access via function parameters in modules
- **User configuration scope**: Home Manager handles user-space config (keybindings, themes), NixOS handles system enablement

## Current Hosts

- **deadbeef**: AMD Ryzen 5700X + RTX 3070Ti, gaming/development workstation
- **beefaced**: AMD Ryzen 9700X, NAS/homelab server (not fully configured yet)

