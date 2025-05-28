{pkgs, ...}: {


    programs.zoxide = {
        enable = true; # Enable zoxide
        enableFishIntegration = true; # Enable Fish shell integration
    };


    programs.eza = {
        enable = true; # Enable eza
        enableFishIntegration = true; # Enable Fish shell integration
        enableBashIntegration = true; # Enable Bash shell integration
        extraOptions = ["-l" "--icons" "--git" "-a"];
    };

    programs.bat = {enable = true;}; # Enable bat, a cat clone with syntax highlighting

    home.packages = with pkgs; [
        # Add your packages here
        coreutils # Core utilities, like 'ls', 'cp', etc.
        fd
        htop
        httpie
        jq
        procs
        ripgrep
        tldr
        zip
    ];
}