with import <nixpkgs> { };

let
    pythonPackages = python3Packages;
in pkgs.mkShell rec {
    name = "prolog";

    buildInputs = [
      swi-prolog-gui
    ];
}
