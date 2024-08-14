{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    prismlauncher
    teamspeak_client
    (lutris.override {
      extraLibraries = pkgs: [
        # List library dependencies here
      ];
    })
  ];
}
