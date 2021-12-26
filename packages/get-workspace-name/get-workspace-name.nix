{ stdenv, bash, gcc, coreutils, wmctrl }:

stdenv.mkDerivation {
  name = "getworkspacename";
  src = ./getWorkspaceName.cpp;
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];
  inherit gcc coreutils;
  system = builtins.system;
}
