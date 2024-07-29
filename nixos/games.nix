{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    teamspeak_client
    (lutris.override {
      extraLibraries = pkgs: [
        # List library dependencies here
      ];
    })
  ];
}
