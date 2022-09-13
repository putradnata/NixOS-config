{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "andikaputra";
  home.homeDirectory = "/home/andikaputra";

  #Installed Packages for Home
  home.packages = with pkgs; [
    htop
    vscode
    distrobox
    megasync
    gnome.gnome-tweaks
    gnomeExtensions.tray-icons-reloaded
    thunderbird
    google-chrome-dev
    alacritty
    kitty
    exa
    git
    gnome.gnome-terminal
    notion-app-enhanced
    libwebp
  ];

  #Shell Configuration
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls="exa -al --color=always --group-directories-first --icons";
      la="exa -a --color=always --group-directories-first --icons";
      ll="exa -l --color=always --group-directories-first --icons";
      lt="exa -aT --color=always --group-directories-first --icons";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
