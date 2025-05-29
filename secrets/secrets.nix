let
    iso = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINIHkPNXgAYaCjHU9e+8H4QGpy7iBxoj7wFj6E+wsZZ0";
    GPC = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFValwqP4Dktx27I/TWRVbHE32jXq7oA4kOBg5fPYMvm";
in {
    "secret1.age".publicKeys = [ iso GPC ];
    "iso-secrets.age".publicKeys = [ iso GPC ];
}