{ pkgs, ... }: {

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
}
