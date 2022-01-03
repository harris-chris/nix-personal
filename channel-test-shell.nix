{ overrides ? {} }:
with builtins; let
  channelPkgs = import <personal> {};
  pkgs = import <nixpkgs> {};
  channelPkgNames = (map (name: getAttr name channelPkgs) (attrNames channelPkgs));
in pkgs.mkShell {
  channelPkgNames = (attrNames channelPackages);
  buildInputs = channelPkgNames ++ [ pkgs.which ];
}
