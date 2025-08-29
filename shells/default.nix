{ pkgs, ... }:

rec {
  default = pkgs.callPackage ./ml.nix {
    accelerationType = "rocm";
    torchConfig = {
      version = {
        torch = "2.6.0";
      };
    };
  };
}
