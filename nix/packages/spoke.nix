{
  pkgs,
  system,
  stdenv,
  ...
}: {
  pname ? "spoke",
  version ? "0.0.1",
  release ? "Fast",
}:
pkgs.stdenvNoCC.mkDerivation {
  inherit pname version;
  src = ../..;
  nativeBuildInputs = [
    pkgs.zigpkgs.master
  ];
  dontConfigure = true;
  dontInstall = true;
  buildPhase = ''
    mkdir -p $out
    mkdir -p .cache/{p,z,tmp}
    zig build install --cache-dir $(pwd)/zig-cache --global-cache-dir $(pwd)/.cache -Dcpu=baseline -Doptimize=Release${release} --prefix $out
  '';
}
