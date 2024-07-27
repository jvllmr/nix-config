# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ outputs
, pkgs
, ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };


  home = {
    username = "jan";
    homeDirectory = "/home/jan";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    vscode
    discord

    spotify
    brave
    nextcloud-client

  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.fish.enable = true;
  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    userName = "Jan Vollmer";
    userEmail = "jan@vllmr.dev";
    signing = {
      key = "19473D3A5AB433DA";
      signByDefault = true;
    };



  };



  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "edibdbjcniadpccecjdfdjjppcpchdlm"; } # i still don't care about cookies
      { id = "fmkadmapgofadopljbjfkapdkoienihi"; } # react devtools
      { id = "fgmjlmbojbkmdpofahffgcpkhkngfpef"; } # startpage
    ];
  };

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



  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
