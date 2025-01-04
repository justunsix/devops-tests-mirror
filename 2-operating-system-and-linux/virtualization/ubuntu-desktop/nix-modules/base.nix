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
    zellij
 
    # File Management
    git
    stow

    # System/Package Management
    topgrade
  ];

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

  };
}

