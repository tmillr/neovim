{
  description = "Neovim development";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }: let
    lib = nixpkgs.lib;
  in
    flake-utils.lib.eachSystem (lib.attrNames nixpkgs.legacyPackages) (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [(python3.withPackages (ps: with ps; [msgpack])) doxygen];
        # shellHook = ''
        #   env
        # '';
      };
    });
}
