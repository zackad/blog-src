{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    devenv.url = "github:cachix/devenv";
    devenv.inputs.nixpkgs.follows = "nixpkgs";
  };

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs =
    {
      self,
      nixpkgs,
      devenv,
      systems,
      ...
    }@inputs:
    let
      forEachSystem = nixpkgs.lib.genAttrs (import systems);
    in
    {
      packages = forEachSystem (system: {
        devenv-up = self.devShells.${system}.default.config.procfileScript;
      });

      devShells = forEachSystem (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = devenv.lib.mkShell {
            inherit inputs pkgs;
            modules = [
              {
                # https://devenv.sh/packages/
                packages = with pkgs; [
                  hugo
                  nodejs-slim
                  yarn
                ];

                # https://devenv.sh/scripts/
                scripts.build.exec = "yarn run build";

                # https://devenv.sh/languages/
                # languages.nix.enable = true;

                # https://devenv.sh/pre-commit-hooks/
                # pre-commit.hooks.shellcheck.enable = true;

                # https://devenv.sh/processes/
                process.manager.implementation = "overmind";
                processes.serve.exec = "yarn run dev";
              }
            ];
          };
        }
      );
    };
}
