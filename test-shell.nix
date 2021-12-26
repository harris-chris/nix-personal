let
  personalPkgs = import <personal>;
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  buildInputs = with personalPkgs; [
    getworkspacename
  ];
}
