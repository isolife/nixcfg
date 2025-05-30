# Common configuration for all hosts

{ 
  lib, 
  inputs, 
  outputs,
  pkgs,  
  ... }: {
  imports = [
    ./users
    ./extraServices
    inputs.home-manager.nixosModules.home-manager
    ];
    home-manager = {
      useUserPackages = true; # Use user packages
      extraSpecialArgs = {inherit inputs outputs;}; # Pass inputs and outputs to home-manager
    };
  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

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

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [
        "root"
        "iso"
      ]; # Set users that are allowed to use the flake command
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
    registry = (lib.mapAttrs (_: flake: { inherit flake; }))
      ((lib.filterAttrs (_: lib.isType "flake")) inputs);
    nixPath = [ "/etc/nix/path" ];
  };
  users.defaultUserShell = pkgs.fish; # Default user shell
  # services.xserver.desktopManager.xfce.enableXfwm = true; # Enable XFCE window manager
}
