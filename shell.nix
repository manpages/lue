with (import <peti> {}).pkgs;
let pkg = haskell-ng.packages.ghc784.callPackage
            ({ mkDerivation, base, hakyll, stdenv }:
             mkDerivation {
               pname = "life";
               version = "0.1.0.0";
               sha256 = "0";
               isLibrary = false;
               isExecutable = true;
               buildDepends = [ base hakyll ];
               license = stdenv.lib.licenses.unfree;
             }) {};
in
  pkg.env
