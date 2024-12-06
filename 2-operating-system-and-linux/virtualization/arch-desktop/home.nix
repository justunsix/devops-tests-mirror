{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vagrant";
  home.homeDirectory = "/home/vagrant";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    
    # Base
    ## Shell
    zoxide
    nushell
    starship
    carapace
    atuin
    broot
    helix

    # -------------------
    # Additional Programs

    # System/Package Management
    topgrade

    # Shell Utilities
    mprocs
    zellij
    bat
    ## Search
    fzf
    fd

    # File Management
    git
    vcstool
    stow

    # Productivity
    plantuml
    pandoc

    ## DevOps
    neovim
    gnumake
    ### Astronvim dependencies and utilities
    gcc
    tree-sitter
    ripgrep
    lazygit
    ### nodejs LTS for LSP servers as of 2024-11
    nodejs_22
    
    ### Emacs
    ### emacs
    #### Doom Emacs dependencies
    ##### ripgrep, git, fd installed above
    ##### Shellcheck used by Emacs Flymake for shell scripts by default - Emacs 29.1
    ##### shellcheck

  ];

  ##########################
  # Programs Configuration #
  ##########################
  # See https://nix-community.github.io/home-manager/options.xhtml

  # Let home-manager manage shells
  programs.bash = {
    enable = true;
    initExtra = "nu";
  };
  programs.nushell = {
    enable = true;
  };

  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  programs.broot = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  programs.carapace = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    defaultCommand = "fd --hidden --type f";
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "dracula_at_night";
      editor = {
        line-number = "relative";
      };
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
      editor.soft-wrap = {
        enable = true;
      };
      editor.file-picker = {
        hidden = false;
      };
    };
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
      # format = "$all";
      shell = {
        format = "[$indicator ](bold cyan) ";
        disabled = false;
      };
    };
  };

  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/vagrant/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
