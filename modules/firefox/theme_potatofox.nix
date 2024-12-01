{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "potatafox";
  src = pkgs.fetchgit {
    url = "https://codeberg.org/awwpotato/potatofox";
    rev = "be7cb0b05d47a67f063fa4b41ffc24941a65cd6e";
    sha256 = "004jf1mas0rhdk76jm2rp07c3pdmy546pyp8b9vl461dk936hwiz";
  };

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out
  '';
}
