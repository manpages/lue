{ mkDerivation, base, binary, containers, hakyll, pandoc, stdenv }:
mkDerivation {
  pname = "life";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base binary containers hakyll pandoc
  ];
  license = stdenv.lib.licenses.unfree;
}
