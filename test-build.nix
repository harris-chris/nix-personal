let
  pkgs = import <nixpkgs> {};
  wrapper = { stdenv, writeShellScriptBin, bash, kakoune }:
    writeShellScriptBin "wrapkak"
    ''
      #! ${bash}/bin/bash
      echo "stay calm this is a wrapper"
      exec ${kakoune}/bin/kak $@
    '';
in
  with pkgs; callPackage wrapper {}
