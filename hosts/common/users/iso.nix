{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.iso = {
    initialHashedPassword = "$y$j9T$dPSd2/JuD8NgrkH8MedBr/$UOcgID9oDU2z0wL0CsaJe668apKXemKZ4sDaxKRWdt.";
    isNormalUser = true;
    description = "iso";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
    ];
    openssh.authorizedKeys.keys = [
      # GPC key?
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFValwqP4Dktx27I/TWRVbHE32jXq7oA4kOBg5fPYMvm vetle.olstad@gmail.com"
      # WSL ssh key
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMVJGa9hb+wy1ClcmRCQWVD1dW6KJ1itq3uVh5LkLG4F vetle.olstad@gmail.com"
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.iso =
    import ../../../home/iso/${config.networking.hostName}.nix;
}
