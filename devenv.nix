{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = with pkgs; [
    hugo
    nodejs-slim
    yarn
  ];

  # https://devenv.sh/scripts/
  scripts.build.exec = "yarn run build";

  enterShell = ''
  '';

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  processes.serve.exec = "yarn run dev";

  # See full reference at https://devenv.sh/reference/options/
}
