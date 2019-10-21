with {
  rev = "290b5ee6113cc05cadcdaf0df6ddfdb74847ede3";
  sha256 = "0z1svdv537c0gw5kikszl4iq4274y3ay8adw1bfi1kw5xakplja9";

  config = {
    packageOverrides = super: let self = super.pkgs; in {
      pifs = self.callPackage ./pifs.nix { };
    };
  };

  overlays = [ ];
};

import (builtins.fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  inherit sha256;
}) { inherit config overlays; }
