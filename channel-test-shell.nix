with builtins; let
  pkgs = import <nixpkgs> {};
  channelPkgs = import <personal> { pkgs = pkgs; };
  channelPkgNames = with builtins; (map (name: getAttr name channelPkgs) (attrNames channelPkgs));
in pkgs.mkShell {
  buildInputs = channelPkgNames ++ [ pkgs.which ];
}
