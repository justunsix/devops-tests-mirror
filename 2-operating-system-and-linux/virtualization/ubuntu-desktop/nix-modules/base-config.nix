{ config, pkgs }: {
  packages = with pkgs; [

  ];

  programs = {
     bash = {
      enable = true;
      initExtra = ''
      export PATH="$HOME/.local/bin:$PATH"
      nu'';

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
        # In SSH, limited colour support, so use base16
        theme = "base16_default";
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


