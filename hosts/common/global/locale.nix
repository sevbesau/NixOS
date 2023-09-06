{ lib, ... }:
{
  i18n = {
    defaultLocale = lib.mkDefault "nl_BE.UTF-8";
    extraLocaleSettings = {
      LANG = lib.mkDefault "en_US.UTF-8";
    };
    supportedLocales = lib.mkDefault [
      "en_US.UTF-8/UTF-8"
      "nl_BE.UTF-8/UTF-8"
    ];
  };
  time.timeZone = lib.mkDefault "Europe/Brussels";
}