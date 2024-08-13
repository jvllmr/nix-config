{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    minecraft
    teamspeak_client
    (lutris.override {
      extraLibraries = pkgs: [
        # List library dependencies here
      ];
    })
  ];
}
