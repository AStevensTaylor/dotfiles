{ ... }: {
  perSystem = { config, self', inputs', pkgs, system, ... }: {
    # Development shell for working on this flake
    devShells.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        nixfmt-rfc-style
        nil
        nh
      ];
      
      shellHook = ''
        echo "🔧 Development environment for NixOS flake"
        echo "Available commands:"
        echo "  nixfmt-rfc-style - Format Nix files"
        echo "  nil - Nix language server"
        echo "  nh - NixOS helper"
      '';
    };

    # Formatter for `nix fmt`
    formatter = pkgs.nixfmt-rfc-style;

    # Packages that can be built with `nix build`
    packages = {
      # You can add custom packages here
    };
  };
}
