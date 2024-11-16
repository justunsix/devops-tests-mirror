{ config, pkgs }: {
  packages = with pkgs; [
    # Base
    ## Shell
    zoxide
    gnumake
    nushell
    starship
    carapace
    atuin
    broot
    helix
    fzf

    # File Management
    git

    # System/Package Management
    topgrade
  ];

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    # Let home-manager manage shells
    bash = {
      enable = true;
      initExtra = "nu";
    };
    # kubectl will use k3s kubectl
    # # k9s will use k3s's kubeconfig
    nushell = {
      enable = true;
      shellAliases = {
        lg = "lazygit";
        k = "kubectl";
        k9s = "k9s --kubeconfig /etc/rancher/k3s/k3s.yaml";
      };
    };
    atuin = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
    };
    broot = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
    };
    carapace = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
    };
    fzf = {
      enable = true;
      enableBashIntegration = true;
      defaultCommand = "fd --hidden --type f";
    };
    helix = {
      enable = true;
      settings = {
        theme = "dracula_at_night";
        editor = { line-number = "relative"; };
        editor.cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        editor.soft-wrap = { enable = true; };
        editor.file-picker = { hidden = false; };
      };
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
      settings = {
        # format = "$all";
        shell = {
          format = "[$indicator ](bold cyan) ";
          disabled = false;
        };
        # https://starship.rs/config/#kubernetes
        kubernetes = {
          disabled = false;
          # Only show the module in directories that contain a k8s file
          detect_files = [ "k8s" ];
          #        symbol = "k8s ";
        };
      };
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
    };

  };
}

