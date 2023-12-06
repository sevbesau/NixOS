{ lib, stdenv, fetchurl, gtk-engine-murrine }:

stdenv.mkDerivation rec {
  pname = "monokai-gtk";
  version = "0.0.1";

  srcs = [
    (fetchurl {
      url = "https://github.com/avivace/monokai-gtk/archive/refs/heads/master.zip";
      sha256 = "725046dfb1b50066f68e8de01e25c8289d9264a9ac39bd347c044c6b13c006fc";
    })
  ];

  sourceRoot = ".";

  propagatedUserEnvPkgs = [ gtk-engine-murrine ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/themes
    unzip -d $out/share/themes monokai-gtk-master.zip
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