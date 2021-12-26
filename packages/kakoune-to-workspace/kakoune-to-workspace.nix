{ stdenv, writeShellScriptBin, bash, kakoune, getworkspacename }:

let
  script = ''
    #! ${bash}/bin/bash

    desktop="$(${getworkspacename}/bin/getworkspacename)"

    # bspc result was empty, so most likely not using bspwm
    [ -z "$desktop" ] && exec ${kakoune}/bin/kak "$@"

    ${kakoune}/bin/kak -clear

    # if session with desktop id is found, connect to it. otherwise create it
    if ${kakoune}/bin/kak -l | grep -q "^''${desktop}$"; then
        exec ${kakoune}/bin/kak -c "$desktop" "$@"
    else
        exec ${kakoune}/bin/kak -s "$desktop" "$@"
    fi
  '';
in writeShellScriptBin "kakounetoworkspace" script
