let
  pkgs = import <nixpkgs> {};

  hello = pkgs.writeShellScriptBin "hello" ''
    echo "Test for personal channel"
  '';

  channelPackages = rec {
    inherit hello;
    getworkspacename = pkgs.callPackage ./packages/get-workspace-name/get-workspace-name.nix {};
    kakounetoworkspace = pkgs.callPackage ./packages/kakoune-to-workspace/kakoune-to-workspace.nix {
      getworkspacename = getworkspacename;
    };
  };
in channelPackages
