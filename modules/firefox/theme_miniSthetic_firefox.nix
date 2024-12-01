{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "miniSthetic_Firefox";
  src = pkgs.fetchFromGitHub {
    owner = "ashish-kus";
    repo = "MiniSthetic_Firefox";
    rev = "2f674f1c571d91b5249fc6c2af6b4a75b48a32b8";
    sha256 = "0hx8qwybdwfjdspy075dvfp2mp3xwbb1r357vh5d35f7026xhz48";
  };

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out
  '';
}
