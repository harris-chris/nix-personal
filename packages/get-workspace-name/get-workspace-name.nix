{ stdenv, bash, coreutils, gcc, wmctrl }:

stdenv.mkDerivation {
  name = "getworkspacename";
  src = ./getWorkspaceName.cpp;
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];
  installPhase = ''
    ln -s ${wmctrl.out}/bin/wmctrl $out/bin/wmctrl
  '';
  inherit gcc coreutils;
  system = builtins.system;
}
