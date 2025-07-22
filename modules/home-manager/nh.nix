{
  config,
  inputs,
  outputs,
  osConfig,
  pkgs,
  ...
}: {
  programs.nh = {
    enable = true;
    flake = "${config.home.homeDirectory}/code/github.com/AStevensTaylor/dotfiles";
  };
}