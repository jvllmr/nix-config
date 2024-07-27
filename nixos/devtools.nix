{ pkgs, ... }: {


  environment.systemPackages = with pkgs; [
    python312Full
    pre-commit
    pdm
    rustup
    nodejs
    gcc
    gh # Github CLI
  ];

}
