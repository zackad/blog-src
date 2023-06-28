{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [ 
    pkgs.bun
    pkgs.hugo
    pkgs.nodejs-18_x
  ];

  # https://devenv.sh/scripts/
  scripts.build.exec = "bun run build";

  enterShell = ''
  '';

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  processes.serve.exec = "bun run dev";

  # See full reference at https://devenv.sh/reference/options/
}
