{
  flake.homeModules.coding = {
    lib,
    config,
    osConfig ? {},
    pkgs,
    ...
  }: let
    enabled = osConfig.var.features.coding or false;
  in {
    imports = [
      ./config/_lazyvim.nix
      ./config/_mkenv.nix
    ];

    config = lib.mkIf enabled {
      programs = {
        git = {
          enable = true;
          settings = {
            # CHANGEME
            user = {
              name = "ringgasnoblefristonlubis007-art";
              email = "ringgasnoblefristonlubis007@gmail.com";
            };
            init.defaultBranch = "main";
            safe.directory = [
              (osConfig.var.flakePath or "${config.home.homeDirectory}/.config/flint")
            ];
          };
        };

        gh = {
          enable = true;
          gitCredentialHelper.enable = true;
        };

        direnv = {
          enable = true;
          nix-direnv.enable = true;
        };

        vscode.enable = true;
      };

      home = {
        sessionPath = [
          "$HOME/.local/bin"
          "${config.home.profileDirectory}/bin"
        ];

        packages = with pkgs; [
          lazygit
          bubblewrap
          jq
          lazydocker
          gcc
          gdb
          gnumake
          python3
          nodejs
          go
          gopls
          jdk
        ];
      };
    };
  };
}
