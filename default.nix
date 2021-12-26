let
  pkgs = import <nixpkgs> {};

  hello = pkgs.writeShellScriptBin "hello" ''
    echo "Test for personal channel"
  '';

  channelPackages = {
    inherit hello;
    getworkspacename = pkgs.callPackage ./packages/get-workspace-name/get-workspace-name.nix {};
  };
in channelPackages
