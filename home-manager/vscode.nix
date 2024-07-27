{ pkgs, ... }: {

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscode-icons-team.vscode-icons
      jnoortheen.nix-ide
      ms-python.python
      ms-python.debugpy
      ms-python.vscode-pylance
      rust-lang.rust-analyzer
      charliermarsh.ruff
      ms-python.vscode-pylance
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      eamodio.gitlens
      redhat.ansible
      redhat.vscode-yaml
      charliermarsh.ruff
      tamasfe.even-better-toml
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-theme-onedark";
        publisher = "akamud";
        version = "2.3.0";
        sha256 = "sha256-8GGv4L4poTYjdkDwZxgNYajuEmIB5XF1mhJMxO2Ho84=";
      }
      {
        name = "mypy-type-checker";
        publisher = "ms-python";
        version = "2023.6.0";
        sha256 = "sha256-uL/iHtBX5sSnkM5fVlMRWEtspNcirirjp9O5ScW039c=";
      }

    ];

    userSettings = {
      "editor.formatOnSave" = true;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "workbench.iconTheme" = "vscode-icons";
      "workbench.colorTheme" = "Atom One Dark";
      "nix.serverPath" = "nixd";
      "nix.enableLanguageServer" = true;
      git = {
        confirmSync = false;
      };
      "[nix]" = { "editor.defaultFormatter" = "jnoortheen.nix-ide"; };
      "[python]" = { "editor.defaultFormatter" = "charliermarsh.ruff"; };
    };
  };
}
