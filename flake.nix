{
  description = "Nix flake for Spoke. The universal data connector";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    zig-overlay = {
      url = "github:mitchellh/zig-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    flake-utils,
    nixpkgs,
    zig-overlay,
    ...
  }: let
    systems = builtins.attrNames zig-overlay.packages;
    outputs = flake-utils.lib.eachSystem systems (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          zig-overlay.overlays.default
          self.overlays
        ];
      };
    in rec {
      # packages exported by the flake
      packages = {
        spoke-small = pkgs.spoke-small {release = "Small";};
        spoke-fast = pkgs.spoke-fast {release = "Fast";};
        spoke-debug = pkgs.spoke-debug {release = "Debug";};
        docker-spoke-small = pkgs.dockerTools.buildImage {
          name = "spoke-small";
          config = {
            Cmd = ["${packages.spoke-small}/bin/spoke"];
          };
        };
        docker-spoke-fast = pkgs.dockerTools.buildImage {
          name = "spoke-fast";
          config = {
            Cmd = ["${packages.spoke-fast}/bin/spoke"];
          };
        };
        docker-spoke-debug = pkgs.dockerTools.buildImage {
          name = "spoke-debug";
          config = {
            Cmd = ["${packages.spoke-debug}/bin/spoke"];
          };
        };
        default = packages.spoke-small {};
      };

      # nix run
      apps = {
        test.hurl = {
          type = "app";
          program = toString (pkgs.writeScript "test.hurl" ''
            export PATH="${pkgs.lib.makeBinPath (
              with pkgs; [
                hurl
              ]
            )}"

            hurl \
              --variable protocol=http \
              --variable host=localhost \
              --variable port=3001 \
              --test \
              --glob "test/**/*.hurl"
          '');
        };
        ui.dev = {
          type = "app";
          program = toString (pkgs.writeScript "ui.dev" ''
            export PATH="${pkgs.lib.makeBinPath (
              with pkgs; [
                nodejs_20
              ]
            )}:$PATH"

            cd ui && npm run dev
          '');
        };
        ui.format = {
          type = "app";
          program = toString (pkgs.writeScript "ui.format" ''
            export PATH="${pkgs.lib.makeBinPath (
              with pkgs; [
                nodejs_20
              ]
            )}:$PATH"

            cd ui && npm run format
          '');
        };
        ui.check = {
          type = "app";
          program = toString (pkgs.writeScript "ui.check" ''
            export PATH="${pkgs.lib.makeBinPath (
              with pkgs; [
                nodejs_20
              ]
            )}:$PATH"

            cd ui && npm run check
          '');
        };
        ui.lint = {
          type = "app";
          program = toString (pkgs.writeScript "ui.lint" ''
            export PATH="${pkgs.lib.makeBinPath (
              with pkgs; [
                nodejs_20
              ]
            )}:$PATH"

            cd ui && npm run lint
          '');
        };
        ui.test = {
          type = "app";
          program = toString (pkgs.writeScript "ui.test" ''
            export PATH="${pkgs.lib.makeBinPath (
              with pkgs; [
                nodejs_20
              ]
            )}:$PATH"

            cd ui && npm run test:unit
          '');
        };
        ui.build = {
          type = "app";
          program = toString (pkgs.writeScript "ui.build" ''
            export PATH="${pkgs.lib.makeBinPath (
              with pkgs; [
                nodejs_20
              ]
            )}:$PATH"

            cd ui && npm run build
          '');
        };
        ui.start = {
          type = "app";
          program = toString (pkgs.writeScript "ui.start" ''
            export PATH="${pkgs.lib.makeBinPath (
              with pkgs; [
                nodejs_20
              ]
            )}:$PATH"

            cd ui && npm run start
          '');
        };
        ui.open = {
          type = "app";
          program = toString (pkgs.writeScript "ui.open" ''
            cd ui && open http://localhost:3000
          '');
        };
        ui.install = {
          type = "app";
          program = toString (pkgs.writeScript "ui.install" ''
            export PATH="${pkgs.lib.makeBinPath (
              with pkgs; [
                nodejs_20
              ]
            )}:$PATH"

            cd ui && npm install
          '');
        };
        default = packages.spoke-fast;
      };

      # nix fmt
      formatter = pkgs.alejandra;

      # nix develop -c $SHELL
      devShells.default = pkgs.mkShell {
        packages = [
          pkgs.bats
          pkgs.hurl
          pkgs.nodejs_20
          pkgs.zigpkgs."0.11.0"
        ];
      };
    });
  in
    outputs
    // {
      # Overlay that can be imported so you can access the packages
      # using spoke.overlays
      overlays = final: prev: {
        spoke-small = prev.pkgs.callPackage ./spoke.nix {release = "Small";};
        spoke-fast = prev.pkgs.callPackage ./spoke.nix {release = "Fast";};
        spoke-debug = prev.pkgs.callPackage ./spoke.nix {release = "Debug";};
      };
    };
}
