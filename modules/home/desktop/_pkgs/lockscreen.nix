{
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  systemd.user.services.hypridle.Unit.ConditionPathExists = "!%t/flint/hypr_focusmode_active";
}
