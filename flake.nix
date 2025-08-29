{
  description = "ML Project Template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
  let 
    inherit (self) outputs;
    lib = nixpkgs.lib;
  in flake-utils.lib.eachDefaultSystem (system:
    let pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells = pkgs.callPackage ./shells {};
    });
}
