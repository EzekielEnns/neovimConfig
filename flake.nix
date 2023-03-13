{
  description = "My Neovim configuration flake";
  license = "MIT";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # tells nix to use current dir for input on config
    my-neovim-config.url = "path:.";
  };

  outputs = { self, nixpkgs, my-neovim-config }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      myConfig = my-neovim-config.neovim.config;
    in {
      packages.${pkgs.system}."neovim-with-config" = pkgs.neovim.override {
        withConfig = true;
        config = myConfig;
      };
    };
}
