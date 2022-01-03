{ pkgs ? import <nixpkgs> {} }:
let
  hello = pkgs.writeShellScriptBin "hello" ''
    echo "Test for personal channel"
  '';
in with pkgs; rec {
  inherit hello;
  inherit (kakoune);
  getworkspacename = callPackage ./packages/get-workspace-name/get-workspace-name.nix {};
  kakounetoworkspace = callPackage ./packages/kakoune-to-workspace/kakoune-to-workspace.nix { getworkspacename = getworkspacename; };
}
