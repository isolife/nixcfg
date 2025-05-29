{
    age = {
        secrets = {
            secret1 = {
                file = ../../secrets/secret1.age;
            };
            iso-secrets = {
                file = ../../secrets/iso-secrets.age;
                owner = "iso";
            };
        };
    };
}