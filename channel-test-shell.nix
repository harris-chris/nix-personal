{ overrides ? {} }:
with builtins; let
  channelPkgs = import <personal> {};
  pkgs = import <nixpkgs> {};
  channelPkgNames = (map (name: getAttr name channelPkgs) (attrNames channelPkgs));
in pkgs.mkShell {
  buildInputs = channelPkgNames ++ [ pkgs.which ];
}
