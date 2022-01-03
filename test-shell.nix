with builtins; let
  channelPkgs = import ./default.nix { overrides = localOverrides; };
  pkgs = import <nixpkgs> {};
  localOverrides = {
    kakoune = pkgs.kakoune;
  };
  channelPkgNames = with builtins; (map (name: getAttr name channelPkgs) (attrNames channelPkgs));
in pkgs.mkShell {
  buildInputs = channelPkgNames ++ [ pkgs.which ];
}
