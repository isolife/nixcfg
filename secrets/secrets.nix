#Remeber to rekey - nix run github:ryantm/agenix -- --rekey
let
    #Users
    iso = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGDcjIpyfLBC+VdXeq1uKHfEcfLNRGSDMngJoJc8CfLC";
    GPC = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFValwqP4Dktx27I/TWRVbHE32jXq7oA4kOBg5fPYMvm";

    users = [iso GPC];

    #Systems
    #systems = [hostname];
in {
    "secret1.age".publicKeys = [ iso GPC ];
    "iso-secrets.age".publicKeys = [ iso GPC ];
    #Secret for all users and systems
    #"secret2.age".publicKeys = users ++ systems;"
}