{...} : {
  boot = {
    kernelParams = [
      "i915.enable_guc=2"
      "kvm.enable_virt_at_load=0"
    ];
    loader = {
      systemd-boot = {
        enable = false;
      };
      grub = {
        enable = true;
        gfxmodeEfi = "1024x768";
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };
  }
