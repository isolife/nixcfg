let
    iso = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGDcjIpyfLBC+VdXeq1uKHfEcfLNRGSDMngJoJc8CfLC";
    GPC = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFValwqP4Dktx27I/TWRVbHE32jXq7oA4kOBg5fPYMvm";
in {
    "secret1.age".publicKeys = [ iso GPC ];
    "iso-secrets.age".publicKeys = [ iso GPC ];
}