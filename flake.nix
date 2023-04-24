{
  description = "booking-tutorial";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nixpkgs-ruby.url = "github:bobvanderlinden/nixpkgs-ruby";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, nixpkgs-ruby, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShell = pkgs.mkShell {
          nativeBuildInputs = [
            nixpkgs-ruby.packages."${system}"."ruby-3.1.3"
            pkgs.postgresql
            pkgs.chromedriver
            pkgs.yarn
            pkgs.overmind
            pkgs.nodejs
            pkgs.heroku

            # necessary for nokogiri gem build
            pkgs.zlib
            pkgs.lzma
          ];
        };
      });
}
