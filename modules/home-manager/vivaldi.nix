{
  config,
  inputs,
  outputs,
  osConfig,
  pkgs,
  ...
}: {
  programs.chromium.enable = true;
  programs.chromium.package = pkgs.vivaldi;
}