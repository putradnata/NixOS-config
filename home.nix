{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "andikaputra";
  home.homeDirectory = "/home/andikaputra";

  #Installed Packages for $HOME || System will not affected
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
    papirus-icon-theme
    neofetch
    noto-fonts-cjk-sans
  ];

  #Shell Configuration with ZSH
  programs.zsh = {
    # enable zsh
    enable = true;
    # custom aliases
    shellAliases = {
      ls="exa -al --color=always --group-directories-first --icons";
      la="exa -a --color=always --group-directories-first --icons";
      ll="exa -l --color=always --group-directories-first --icons";
      lt="exa -aT --color=always --group-directories-first --icons";
    };
    # history
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    # enable OHmyzsh
    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git" 
      ];
      theme = "robbyrussell";
    };
    #enable some ohmyzsh feature
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
  };

  # enable starship shell
  programs.starship = {
    	enable = true;
      # starship settings
      settings = {
          add_newline = true;
          package.disabled = true;
          character = {
              success_symbol = "[ナタ ➜](bold green)";
              error_symbol = "[ナタ ✗](bold red) ";
              vicmd_symbol = "[ナタ V](bold green) ";
          };
      };
  };

  #Alacritty Settings
  programs.alacritty = {
    enable = true;
    settings = {
      # set default shell to run by alacritty
      shell = {
        program = "/home/andikaputra/.nix-profile/bin/zsh";  
      };
      # fonts
      font = {
        normal = {
          family = "UbuntuMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "UbuntuMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "UbuntuMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "UbuntuMono Nerd Font";
          style = "Bold Italic";
        };
      };
      
      # keybindings
      key_bindings = [
        {
          key = "V";
          mods = "Control|Shift";
          action = "Paste";
        }
        {
          key = "C";
          mods = "Control|Shift";
          action = "Copy";
        }
        {
          key = "Insert";
          mods = "Shift";
          action = "PasteSelection";
        }
        {
          key = "Key0";
          mods = "Control";
          action = "ResetFontSize";
        }
        {
          key = "Equals";
          mods = "Control";
          action = "IncreaseFontSize";
        }
        {
          key = "Plus";
          mods = "Control";
          action = "IncreaseFontSize";
        }
        {
          key = "Minus";
          mods = "Control";
          action = "DecreaseFontSize";
        }
        {
          key = "F11";
          mods = "None";
          action = "ToggleFullscreen";
        }
        {
          key = "Paste";
          mods = "None";
          action = "Paste";
        }
        {
          key = "Copy";
          mods = "None";
          action = "Copy";
        }
        {
          key = "L";
          mods = "Control";
          action = "ClearLogNotice";
        }
        {
          key = "L";
          mods = "Control";
          chars = "\x0c";
        }
        {
          key = "PageUp";
          mods = "None";
          action = "ScrollPageUp";
          mode = "~Alt";
        }
        {
          key = "PageDown";
          mods = "None";
          action = "ScrollPageDown";
          mode = "~Alt";
        }
        {
          key = "Home";
          mods = "Shift";
          action = "ScrollToTop";
          mode = "~Alt";
        }
        {
          key = "End";
          mods = "Shift";
          action = "ScrollToBottom";
          mode = "~Alt";
        }
      ];
    };
  };

  # Kitty
  programs.kitty = {
    enable = true;
    # Theme
    theme = "Duotone Dark";
    # Settings
    settings = {
      # Padding
      window_padding_width = "15";

      # Cursors
      cursor_shape = "beam";
      cursor_beam_thickness = "1";

      # Size
      remember_window_size = "yes";
      initial_window_width = "640";
      initial_window_height = "400";

      # Layouts
      enabled_layouts = "horizontal,splits,grid,fat";
      window_resize_step_cells = "1";
      window_resize_step_lines = "1";

      # Border
      window_border_width = "0";
    };
  
    # Font
    font = {
      name = "Ubuntu Mono Nerd Font";
      size = 13;
    };
    # Keybindings
    keybindings = {
      "ctrl+shit+c" = "copy_to_clipboard";
      "ctrl+shit+v" = "paste_from_clipboard";
      "ctrl+shit+s" = "paste_from_selection";
      "shift+insert" = "paste_from_selection";
      "ctrl+shit+o" = "pass_selection_to_program";
      "ctrl+shit+up" = "scroll_line_up";
      "ctrl+shit+k" = "scroll_line_up";
      "ctrl+shit+down" = "scroll_line_down";
      "ctrl+shit+j" = "scroll_line_down";
      "ctrl+shit+page_up" = "scroll_page_up";
      "ctrl+shit+page_down" = "scroll_page_down";
      "ctrl+shit+h" = "show_scrollback";
      # Window Management
      "ctrl+shit+enter" = "new_window";
      "ctrl+shit+w" = "close_window";
      "ctrl+shit+]" = "next_window";
      "ctrl+shit+[" = "previous_window";
      "ctrl+shit+f" = "move_window_forward";
      "ctrl+shit+b" = "move_window_backward";
      "ctrl+shit+`" = "move_window_to_top";
      "ctrl+shit+r" = "start_resizing_window";
      "ctrl+shit+1" = "first_window";
      "ctrl+shit+2" = "second_window";
      "ctrl+shit+3" = "third_window";
      "ctrl+shit+4" = "fourth_window";
      "ctrl+shit+5" = "fifth_window";
      "ctrl+shit+6" = "sixth_window";
      "ctrl+shit+7" = "seventh_window";
      "ctrl+shit+8" = "eighth_window";
      "ctrl+shit+9" = "ninth_window";
      "ctrl+shit+0" = "tenth_window";
      "ctrl+shit+alt+l" = "resize_window narrower";
      "ctrl+shit+alt+h" = "resize_window wider";
      "ctrl+shit+alt+k" = "resize_window taller";
      "ctrl+shit+alt+j" = "resize_window shorter";
      # Tab Management
      "ctrl+shit+right" = "next_tab";
      "ctrl+shit+left" = "previous_tab";
      "ctrl+shit+t" = "new_tab";
      "ctrl+shit+q" = "close_tab";
      "ctrl+shit+." = "move_tab_forward";
      "ctrl+shit+," = "move_tab_backward";
      "ctrl+shit+alt+t" = "set_tab_title";
      "ctrl+alt+1" = "goto_tab 1";
      "ctrl+alt+2" = "goto_tab 2";
      # Layout management
      "ctrl+shit+l" = "next_layout";
      "ctrl+alt+t" = " goto_layout tall";
      "ctrl+alt+s" = " goto_layout splits";
      "ctrl+shit+alt+g" = "goto_layout grid";
      "ctrl+alt+p" =  "last_used_layout";
      # Font sizes
      "ctrl+shit+equal" = "change_font_size all +1.0";
      "ctrl+shit+minus" = "change_font_size all -1.0";
      "ctrl+shit+backspace" = "change_font_size all 0";
      "ctrl+shit+f6"  = "change_font_size all 10.0";
      # Select and act on visible text
     " ctrl+shit+e" = "kitten hints";
      # Misc
     " ctrl+shit+f11" = "toggle_fullscreen";
     " ctrl+shit+f10" = "toggle_maximized";
     " ctrl+shit+u" = "kitten unicode_input";
     " ctrl+shit+f2" = "edit_config_file";
     " ctrl+shit+escape" = "kitty_shell window";
     " ctrl+shit+a>m" = "set_background_opacity +0.1";
     " ctrl+shit+a>l" = "set_background_opacity -0.1";
     " ctrl+shit+a>1" = "set_background_opacity 1";
     " ctrl+shit+a>d" = "set_background_opacity default";
     " ctrl+shit+delete" = "clear_terminal reset active";
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
