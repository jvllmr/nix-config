{ config, lib, pkgs, ... }:
let
  hasNvidia = config.hardware.nvidia != null;
in
{
  config = lib.mkIf hasNvidia {
    # Set environment variables related to NVIDIA graphics
    environment.variables = {
      GBM_BACKEND = "nvidia-drm";
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };

    boot = {
      kernelParams = [
        "module_blacklist=i915" # blacklist intel video driver
      ];
    };

    # Enable OpenGL
    hardware.opengl = {
      enable = true;
      driSupport = lib.mkDefault true;
      driSupport32Bit = lib.mkDefault true;
      #---------------------------------------------------------------------
      # Install additional packages that improve graphics performance and compatibility.
      #---------------------------------------------------------------------
      extraPackages = with pkgs; [
        intel-media-driver # LIBVA_DRIVER_NAME=iHD
        libvdpau-va-gl
        nvidia-vaapi-driver
        vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
        vaapiVdpau
        vulkan-validation-layers
      ];
    };

    hardware.nvidia = {


      modesetting.enable = true;
      nvidiaPersistenced = false;

      powerManagement.enable = true;

      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;


      open = false;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.production;



    };
    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = [ "nvidia" ];

    environment.systemPackages = with pkgs; [

      clinfo
      gwe
      virtualglLib
      vulkan-loader
      vulkan-tools
    ];

  };




}
