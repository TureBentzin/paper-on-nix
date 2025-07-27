{
  description = "";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };

      fetchPaper = import ./packages/fetchPaper.nix {
        inherit pkgs;
      };
    in {
      nixosModules.default = { config, lib, ... }:
        {
          imports = [ ./modules/papermc.nix ];

          _module.args = {
            inherit pkgs fetchPaper;
          };
        };
    };
}
