let
    nixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINIHkPNXgAYaCjHU9e+8H4QGpy7iBxoj7wFj6E+wsZZ0";
in {
    "secret1.age".publicKeys = [ nixos ];
}