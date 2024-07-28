{ pkgs, ... }: {


  environment.systemPackages = with pkgs; [
    python39Full
    python310Full
    python311Full
    python312Full
    pre-commit
    pipx
    rustup
    nodejs
    gcc
    gh # Github CLI
    ansible
    ansible-lint
  ];



}
