{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.home.git;
in {
  options.features.home.git = {
    enable = mkEnableOption "git";
    userName = mkOption {
      type = types.str;
    };
    userEmail = mkOption {
      type = types.str;
    };
    editor = mkOption {
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    programs = {
      git = {
        enable = true;
        package = pkgs.gitFull;
        userName = cfg.userName;
        userEmail = cfg.userEmail;
        aliases = {
          co = "checkout";
        };
        extraConfig = {
          color = {
            ui = true;
          };
          core = {
            editor = cfg.editor;
          };
          init = {
            defaultBranch = "main";
          };
          pull = {
            rebase = false;
          };
        };
      };
    };
  };
}
