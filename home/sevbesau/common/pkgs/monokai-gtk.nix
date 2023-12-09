{ lib, stdenv, fetchzip, gtk-engine-murrine }:

stdenv.mkDerivation rec {
  pname = "monokai-gtk";
  version = "0.0.1";

  srcs = [
    (fetchzip {
      url = "https://github.com/avivace/monokai-gtk/archive/refs/heads/master.zip";
      sha256 = "sha256-lPIjFJSeRo0qgaARcDyhMCUDpgvbjhyQzyj1CVzOob4=";
    })
  ];

  sourceRoot = ".";

  propagatedUserEnvPkgs = [ gtk-engine-murrine ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/themes
    cp -a monokai-gtk* $out/share/themes
    rm $out/share/themes/*/{LICENSE,README.md,.gitignore}
    runHook postInstall
  '';

  meta = with lib; {
    description = "Monokai GTK theme";
    homepage = "https://github.com/avivace/monokai-gtk";
    license = licenses.gpl3Only;
    platforms = platforms.all;
    maintainers = [ maintainers.sevbesau ];
  };
}